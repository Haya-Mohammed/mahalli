import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mahalli/core/config/locale/l10n/app_localizations.dart';
import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/core/di/injection_container.dart';
import 'package:mahalli/core/error/failure.dart';
import 'package:mahalli/features/customers/domain/debt_rules.dart';
import 'package:mahalli/features/customers/domain/models/customer_details.dart';
import 'package:mahalli/features/customers/domain/models/customer_input.dart';
import 'package:mahalli/features/customers/domain/models/debt_entry.dart';
import 'package:mahalli/features/customers/domain/models/debt_page.dart';
import 'package:mahalli/features/customers/domain/models/debt_summary.dart';
import 'package:mahalli/features/customers/domain/repository/customer_repository.dart';
import 'package:mahalli/features/customers/domain/usecases/record_adjustment.dart';
import 'package:mahalli/features/customers/domain/usecases/record_payment.dart';
import 'package:mahalli/features/customers/domain/usecases/save_customer.dart';
import 'package:mahalli/features/customers/presentation/cubits/customer_detail/customer_detail_cubit.dart';
import 'package:mahalli/features/customers/presentation/cubits/customer_detail/customer_detail_state.dart';
import 'package:mahalli/features/customers/presentation/cubits/customer_form/customer_form_cubits.dart';
import 'package:mahalli/features/customers/presentation/cubits/customer_list/customer_list_cubit.dart';
import 'package:mahalli/features/customers/presentation/pages/customer_list_page.dart';

class _MemoryCustomerRepository implements CustomerRepository {
  final _names = <int, String>{};
  final _active = <int, bool>{};
  final entries = <DebtEntry>[];

  CustomerDetails _details(int id) => CustomerDetails(
    id: id,
    name: _names[id]!,
    isActive: _active[id]!,
    balanceMinor: balanceFromAmounts(
      entries.where((entry) => entry.customerId == id).map((entry) => entry.amountMinor),
    ),
  );

  @override
  Future<List<CustomerDetails>> list() async => _names.keys.map(_details).toList();

  @override
  Future<CustomerDetails?> get(int id) async => _names.containsKey(id) ? _details(id) : null;

  @override
  Future<bool> nameExists(String name, {int? excludingId}) async => _names.entries.any(
    (row) => row.key != excludingId && row.value.toLowerCase() == name.trim().toLowerCase(),
  );

  @override
  Future<CustomerDetails> save(CustomerInput input, {int? id}) async {
    final key = id ?? _names.length + 1;
    _names[key] = input.name.trim();
    _active.putIfAbsent(key, () => true);
    return _details(key);
  }

  @override
  Future<void> setActive(int id, bool active, {bool allowOutstandingDebt = false}) async {
    if (!active && _details(id).balanceMinor != 0 && !allowOutstandingDebt) {
      throw const OutstandingDebtFailure('Customer has debt');
    }
    _active[id] = active;
  }

  @override
  Future<DebtPage> ledger(int customerId, {required int offset, required int limit}) async {
    final rows = entries
        .where((entry) => entry.customerId == customerId)
        .toList()
        .reversed
        .toList();
    return DebtPage(rows.skip(offset).take(limit).toList(), rows.length > offset + limit);
  }

  @override
  Future<DebtSummary> debtSummary({int topCount = 10}) async {
    final owing = (await list()).where((row) => row.balanceMinor > 0).toList()
      ..sort((a, b) => b.balanceMinor.compareTo(a.balanceMinor));
    return DebtSummary(
      totalMinor: balanceFromAmounts(owing.map((row) => row.balanceMinor)),
      largestBalances: owing.take(topCount).toList(),
    );
  }

  @override
  Future<CustomerDetails> recordPayment(int customerId, int amountMinor, {String? note}) async {
    final delta = paymentDelta(_details(customerId).balanceMinor, amountMinor);
    await recordInTxn(
      customerId: customerId,
      type: DebtTxType.payment,
      deltaMinor: delta,
      note: note,
    );
    return _details(customerId);
  }

  @override
  Future<CustomerDetails> recordAdjustment(
    int customerId,
    int deltaMinor, {
    required String reason,
  }) async {
    if (reason.trim().isEmpty) throw const ValidationFailure('Reason required');
    final delta = adjustmentDelta(_details(customerId).balanceMinor, deltaMinor);
    await recordInTxn(
      customerId: customerId,
      type: DebtTxType.adjustment,
      deltaMinor: delta,
      note: reason,
    );
    return _details(customerId);
  }

  @override
  Future<void> recordInTxn({
    required int customerId,
    required DebtTxType type,
    required int deltaMinor,
    int? saleId,
    int? returnId,
    String? note,
  }) async {
    if (!_names.containsKey(customerId)) {
      throw const NotFoundFailure('Customer not found');
    }
    entries.add(
      DebtEntry(
        id: entries.length + 1,
        customerId: customerId,
        type: type,
        amountMinor: deltaMinor,
        createdAt: DateTime(2026, 10, 5, 12, entries.length),
        note: note,
        saleId: saleId,
        returnId: returnId,
      ),
    );
  }
}

void main() {
  test('ledger balance follows signed entries and rejects overpayment', () async {
    final repo = _MemoryCustomerRepository();
    final customer = await repo.save(const CustomerInput(name: 'Mariam'));
    await repo.recordInTxn(customerId: customer.id, type: DebtTxType.saleCredit, deltaMinor: 10000);
    await repo.recordPayment(customer.id, 3000);
    await repo.recordInTxn(customerId: customer.id, type: DebtTxType.saleCredit, deltaMinor: 5000);
    await repo.recordInTxn(
      customerId: customer.id,
      type: DebtTxType.returnCredit,
      deltaMinor: -2000,
    );
    await repo.recordPayment(customer.id, 4000);

    expect((await repo.get(customer.id))!.balanceMinor, 6000);
    expect((await repo.debtSummary()).totalMinor, 6000);
    expect(repo.entries.map((row) => row.amountMinor), [10000, -3000, 5000, -2000, -4000]);
    await expectLater(repo.recordPayment(customer.id, 6001), throwsA(isA<OverpaymentFailure>()));
    expect(repo.entries.length, 5);
    await expectLater(repo.setActive(customer.id, false), throwsA(isA<OutstandingDebtFailure>()));
    await repo.setActive(customer.id, false, allowOutstandingDebt: true);
    expect((await repo.get(customer.id))!.balanceMinor, 6000);
  });

  test('customer detail cubits reports overpayment and preserves history', () async {
    final repo = _MemoryCustomerRepository();
    final customer = await repo.save(const CustomerInput(name: 'Nadia'));
    await repo.recordAdjustment(customer.id, 2500, reason: 'Opening debt');
    final cubit = CustomerDetailCubit(repo, RecordPayment(repo), RecordAdjustment(repo));
    addTearDown(cubit.close);
    await cubit.load(customer.id);
    expect(await cubit.payment(3000), CustomerActionResult.overpayment);
    expect(cubit.state.entries.length, 1);
    expect(await cubit.payment(1000), CustomerActionResult.success);
    expect(cubit.state.customer!.balanceMinor, 1500);
    expect(cubit.state.entries.first.type, DebtTxType.payment);
  });

  testWidgets('owner can add and find a customer', (tester) async {
    final repo = _MemoryCustomerRepository();
    sl.registerSingleton<CustomerRepository>(repo);
    sl.registerFactory<CustomerListCubit>(() => CustomerListCubit(repo));
    sl.registerFactory<CustomerFormCubit>(() => CustomerFormCubit(SaveCustomer(repo)));
    addTearDown(() async {
      await sl.unregister<CustomerFormCubit>();
      await sl.unregister<CustomerListCubit>();
      await sl.unregister<CustomerRepository>();
    });

    await tester.pumpWidget(
      const MaterialApp(
        locale: Locale('en'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: CustomerListPage(),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Add customer'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('customer_name')), 'Mariam');
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();
    expect(find.text('Mariam'), findsOneWidget);
    await tester.enterText(find.byType(TextField).first, 'Unknown');
    await tester.pumpAndSettle();
    expect(find.text('Mariam'), findsNothing);
    expect(tester.takeException(), isNull);
  });
}
