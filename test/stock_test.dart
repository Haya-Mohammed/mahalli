import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mahalli/core/config/locale/l10n/app_localizations.dart';
import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/core/di/injection_container.dart';
import 'package:mahalli/core/error/failure.dart';
import 'package:mahalli/features/stock/domain/models/stock_enums.dart';
import 'package:mahalli/features/stock/domain/models/stock_movement_entry.dart';
import 'package:mahalli/features/stock/domain/models/stock_movement_page.dart';
import 'package:mahalli/features/stock/domain/models/stock_product.dart';
import 'package:mahalli/features/stock/domain/repositories/stock_repository.dart';
import 'package:mahalli/features/stock/domain/stock_math.dart';
import 'package:mahalli/features/stock/domain/usecases/stock_use_cases.dart';
import 'package:mahalli/features/stock/presentation/cubits/stock_details/stock_details_cubit.dart';
import 'package:mahalli/features/stock/presentation/cubits/stock_details/stock_details_state.dart';
import 'package:mahalli/features/stock/presentation/cubits/stock_list/stock_list_cubit.dart';
import 'package:mahalli/features/stock/presentation/pages/stock_detail_page.dart';
import 'package:mahalli/features/stock/presentation/pages/stock_list_page.dart';

class _MemoryStockRepository implements StockRepository {
  _MemoryStockRepository({int openingMilli = 1000}) : quantityMilli = openingMilli {
    movements.add(
      StockMovementEntry(
        id: 1,
        productId: 1,
        type: StockMovementType.opening,
        quantityMilli: openingMilli,
        createdAt: DateTime(2026, 10, 4),
      ),
    );
  }

  int quantityMilli;
  final movements = <StockMovementEntry>[];

  StockProduct get product => StockProduct(
    id: 1,
    name: 'Tea',
    quantityMilli: quantityMilli,
    thresholdMilli: 500,
    unit: UnitType.piece,
    isActive: true,
  );

  @override
  Future<List<StockProduct>> listProducts() async => [product];

  @override
  Future<StockProduct?> getProduct(int productId) async => productId == 1 ? product : null;

  @override
  Future<StockMovementPage> getMovements(
    int productId, {
    required int offset,
    required int limit,
  }) async {
    final ordered = movements.reversed.toList();
    final page = ordered.skip(offset).take(limit + 1).toList();
    return StockMovementPage(page.take(limit).toList(), page.length > limit);
  }

  @override
  Future<StockProduct> addStock(int productId, int quantityMilli, {String? note}) async {
    await recordInTxn(
      productId: productId,
      deltaMilli: quantityMilli,
      type: StockMovementType.purchase,
      note: note,
    );
    return product;
  }

  @override
  Future<StockProduct> adjustStock(int productId, int targetMilli, {String? note}) async {
    await recordInTxn(
      productId: productId,
      deltaMilli: adjustmentDelta(quantityMilli, targetMilli),
      type: StockMovementType.adjustment,
      note: note,
    );
    return product;
  }

  @override
  Future<StockProduct> recordDamage(
    int productId,
    int quantityMilli, {
    required String reason,
  }) async {
    await recordInTxn(
      productId: productId,
      deltaMilli: damageDelta(this.quantityMilli, quantityMilli),
      type: StockMovementType.damage,
      note: reason,
    );
    return product;
  }

  @override
  Future<void> recordInTxn({
    required int productId,
    required int deltaMilli,
    required StockMovementType type,
    int? referenceId,
    String? note,
  }) async {
    quantityMilli += deltaMilli;
    movements.add(
      StockMovementEntry(
        id: movements.length + 1,
        productId: productId,
        type: type,
        quantityMilli: deltaMilli,
        createdAt: DateTime(2026, 10, 4, 12, movements.length),
        note: note,
      ),
    );
  }
}

void main() {
  test('stock statuses distinguish negative, out, low, and healthy', () {
    expect(stockStatus(-1, 500), StockStatus.negative);
    expect(stockStatus(0, 500), StockStatus.out);
    expect(stockStatus(500, 500), StockStatus.low);
    expect(stockStatus(501, 500), StockStatus.healthy);
  });

  test('adjustment from negative stock reaches the counted target', () {
    expect(adjustmentDelta(-500, 0), 500);
    expect(adjustmentDelta(-500, 1200), 1700);
    expect(() => adjustmentDelta(100, -1), throwsA(isA<ValidationFailure>()));
  });

  test('stock actions preserve movement sum and reject excess damage', () async {
    final repo = _MemoryStockRepository();
    final cubit = StockDetailCubit(repo, AddStock(repo), AdjustStock(repo), RecordDamage(repo));
    addTearDown(cubit.close);
    await cubit.load(1);

    expect(await cubit.add(1500), StockActionResult.success);
    expect(await cubit.adjust(2000), StockActionResult.success);
    expect(await cubit.damage(250, reason: 'Broken'), StockActionResult.success);
    expect(cubit.state.product?.quantityMilli, 1750);
    expect(repo.movements.map((row) => row.quantityMilli).reduce((a, b) => a + b), 1750);
    expect(cubit.state.movements.first.type, StockMovementType.damage);

    expect(await cubit.damage(2000, reason: 'Broken'), StockActionResult.insufficient);
    expect(repo.quantityMilli, 1750);
    expect(() => RecordDamage(repo)(1, 100, reason: ''), throwsA(isA<ValidationFailure>()));
  });

  testWidgets('owner adds stock from product history', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    final repo = _MemoryStockRepository();
    sl.registerFactory<StockDetailCubit>(
      () => StockDetailCubit(repo, AddStock(repo), AdjustStock(repo), RecordDamage(repo)),
    );
    addTearDown(() => sl.unregister<StockDetailCubit>());

    await tester.pumpWidget(
      const MaterialApp(
        locale: Locale('en'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: StockDetailPage(productId: 1),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Add stock'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('stock_quantity')), '1.5');
    tester.testTextInput.hide();
    await tester.pumpAndSettle();
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    expect(repo.quantityMilli, 2500);
    expect(find.text('Stock added'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('negative stock is visible in the stock list', (tester) async {
    final repo = _MemoryStockRepository(openingMilli: -500);
    sl.registerFactory<StockListCubit>(() => StockListCubit(repo));
    addTearDown(() => sl.unregister<StockListCubit>());

    await tester.pumpWidget(
      const MaterialApp(
        locale: Locale('en'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: StockListPage(),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Tea'), findsOneWidget);
    expect(find.text('Negative'), findsWidgets);
    await tester.tap(find.widgetWithText(ChoiceChip, 'Negative 1'));
    await tester.pumpAndSettle();
    expect(find.text('Tea'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
