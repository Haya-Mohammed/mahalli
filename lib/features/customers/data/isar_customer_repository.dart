import 'package:isar_community/isar.dart';
import 'package:mahalli/core/database/collections/customer.dart';
import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/core/database/transaction_runner.dart';
import 'package:mahalli/core/error/failure.dart';
import 'package:mahalli/features/customers/domain/models/customer_details.dart';
import 'package:mahalli/features/customers/domain/models/customer_input.dart';
import 'package:mahalli/features/customers/domain/models/debt_entry.dart';
import 'package:mahalli/features/customers/domain/models/debt_page.dart';
import 'package:mahalli/features/customers/domain/models/debt_summary.dart';

import '../domain/debt_rules.dart';
import '../domain/repository/customer_repository.dart';

class IsarCustomerRepository implements CustomerRepository {
  const IsarCustomerRepository(this.isar, this.transactions);
  final Isar isar;
  final TransactionRunner transactions;

  @override
  Future<List<CustomerDetails>> list() async {
    try {
      final customers = await isar.customers.where().findAll();
      final entries = await isar.debtTransactions.where().findAll();
      final balances = <int, int>{};
      for (final entry in entries) {
        balances.update(
          entry.customerId,
          (value) => value + entry.amount,
          ifAbsent: () => entry.amount,
        );
      }
      final result = customers.map((row) => _details(row, balances[row.id] ?? 0)).toList();
      result.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
      return result;
    } catch (_) {
      throw const DatabaseFailure('Unable to load customers');
    }
  }

  @override
  Future<CustomerDetails?> get(int id) async {
    try {
      final row = await isar.customers.get(id);
      if (row == null) return null;
      return _details(row, await _balance(id));
    } catch (_) {
      throw const DatabaseFailure('Unable to load customer');
    }
  }

  @override
  Future<bool> nameExists(String name, {int? excludingId}) async {
    final normalized = name.trim().toLowerCase();
    if (normalized.isEmpty) return false;
    try {
      final rows = await isar.customers.where().findAll();
      return rows.any(
        (row) => row.id != excludingId && row.name.trim().toLowerCase() == normalized,
      );
    } catch (_) {
      throw const DatabaseFailure('Unable to check customer name');
    }
  }

  @override
  Future<CustomerDetails> save(CustomerInput input, {int? id}) async {
    final name = input.name.trim();
    if (name.isEmpty ||
        name.length > 100 ||
        (input.phone?.trim().length ?? 0) > 30 ||
        (input.notes?.trim().length ?? 0) > 500) {
      throw const ValidationFailure('Invalid customer details');
    }
    return transactions.run(() async {
      final previous = id == null ? null : await isar.customers.get(id);
      if (id != null && previous == null) {
        throw const NotFoundFailure('Customer not found');
      }
      final row = previous ?? Customer();
      row
        ..name = name
        ..phone = _optional(input.phone)
        ..notes = _optional(input.notes)
        ..updatedAt = DateTime.now();
      row.id = await isar.customers.put(row);
      return _details(row, await _balance(row.id));
    });
  }

  @override
  Future<void> setActive(int id, bool active, {bool allowOutstandingDebt = false}) =>
      transactions.run(() async {
        final row = await isar.customers.get(id);
        if (row == null) throw const NotFoundFailure('Customer not found');
        if (!active && !allowOutstandingDebt && await _balance(id) != 0) {
          throw const OutstandingDebtFailure('Customer has a debt balance');
        }
        row.isActive = active;
        row.updatedAt = DateTime.now();
        await isar.customers.put(row);
      });

  @override
  Future<DebtPage> ledger(int customerId, {required int offset, required int limit}) async {
    try {
      final rows = await isar.debtTransactions
          .filter()
          .customerIdEqualTo(customerId)
          .sortByCreatedAtDesc()
          .offset(offset)
          .limit(limit + 1)
          .findAll();
      return DebtPage(rows.take(limit).map(_entry).toList(), rows.length > limit);
    } catch (_) {
      throw const DatabaseFailure('Unable to load debt ledger');
    }
  }

  @override
  Future<DebtSummary> debtSummary({int topCount = 10}) async {
    final customers = await list();
    final owing = customers.where((customer) => customer.balanceMinor > 0).toList()
      ..sort((a, b) => b.balanceMinor.compareTo(a.balanceMinor));
    return DebtSummary(
      totalMinor: balanceFromAmounts(owing.map((customer) => customer.balanceMinor)),
      largestBalances: owing.take(topCount).toList(),
    );
  }

  @override
  Future<CustomerDetails> recordPayment(int customerId, int amountMinor, {String? note}) =>
      transactions.run(() async {
        final row = await isar.customers.get(customerId);
        if (row == null) throw const NotFoundFailure('Customer not found');
        final balance = await _balance(customerId);
        final delta = paymentDelta(balance, amountMinor);
        await recordInTxn(
          customerId: customerId,
          type: DebtTxType.payment,
          deltaMinor: delta,
          note: note,
        );
        return _details(row, balance + delta);
      });

  @override
  Future<CustomerDetails> recordAdjustment(
    int customerId,
    int deltaMinor, {
    required String reason,
  }) {
    if (reason.trim().isEmpty) {
      throw const ValidationFailure('Adjustment reason required');
    }
    return transactions.run(() async {
      final row = await isar.customers.get(customerId);
      if (row == null) throw const NotFoundFailure('Customer not found');
      final balance = await _balance(customerId);
      final delta = adjustmentDelta(balance, deltaMinor);
      await recordInTxn(
        customerId: customerId,
        type: DebtTxType.adjustment,
        deltaMinor: delta,
        note: reason.trim(),
      );
      return _details(row, balance + delta);
    });
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
    final customer = await isar.customers.get(customerId);
    if (customer == null) throw const NotFoundFailure('Customer not found');
    if (type == DebtTxType.saleCredit && !customer.isActive) {
      throw const ValidationFailure('Inactive customer cannot receive new credit');
    }
    if (deltaMinor == 0) throw const ValidationFailure('Zero debt movement');
    if ((type == DebtTxType.saleCredit && deltaMinor < 0) ||
        (type == DebtTxType.payment || type == DebtTxType.returnCredit) && deltaMinor > 0) {
      throw const ValidationFailure('Invalid debt movement direction');
    }
    if (deltaMinor < 0 && await _balance(customerId) + deltaMinor < 0) {
      throw const OverpaymentFailure('Debt movement exceeds balance');
    }
    final cleanedNote = note?.trim();
    await isar.debtTransactions.put(
      DebtTransaction()
        ..customerId = customerId
        ..type = type
        ..amount = deltaMinor
        ..saleId = saleId
        ..returnId = returnId
        ..note = cleanedNote == null || cleanedNote.isEmpty ? null : cleanedNote,
    );
  }

  Future<int> _balance(int customerId) =>
      isar.debtTransactions.where().customerIdEqualTo(customerId).amountProperty().sum();

  String? _optional(String? value) {
    final trimmed = value?.trim();
    return trimmed == null || trimmed.isEmpty ? null : trimmed;
  }

  CustomerDetails _details(Customer row, int balance) => CustomerDetails(
    id: row.id,
    name: row.name,
    phone: row.phone,
    notes: row.notes,
    isActive: row.isActive,
    balanceMinor: balance,
  );

  DebtEntry _entry(DebtTransaction row) => DebtEntry(
    id: row.id,
    customerId: row.customerId,
    type: row.type,
    amountMinor: row.amount,
    createdAt: row.createdAt,
    note: row.note,
    saleId: row.saleId,
    returnId: row.returnId,
  );
}
