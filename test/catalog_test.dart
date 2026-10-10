import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mahalli/core/config/locale/l10n/app_localizations.dart';
import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/core/di/injection_container.dart';
import 'package:mahalli/core/error/failure.dart';
import 'package:mahalli/core/money/money.dart';
import 'package:mahalli/features/catalog/domain/catalog_validation.dart';
import 'package:mahalli/features/catalog/domain/models/catalog_item.dart';
import 'package:mahalli/features/catalog/domain/models/catalog_page_result.dart';
import 'package:mahalli/features/catalog/domain/models/product_input.dart';
import 'package:mahalli/features/catalog/domain/models/service_input.dart';
import 'package:mahalli/features/catalog/domain/repository/catalog_repository.dart';
import 'package:mahalli/features/catalog/presentation/cubit/catalog_cubit.dart';
import 'package:mahalli/features/catalog/presentation/pages/catalog_form_page.dart';
import 'package:mahalli/features/categories/domain/models/category_Model.dart';
import 'package:mahalli/features/categories/domain/repository/category_repository.dart';
import 'package:mahalli/features/onboarding/domain/models/shop_model.dart';
import 'package:mahalli/features/onboarding/domain/repository/shop_repository.dart';
import 'package:mahalli/features/onboarding/domain/usecases/create_shop.dart';
import 'package:mahalli/features/onboarding/presentation/cubit/shop_cubit.dart';

class _CatalogRepo implements CatalogRepository {
  final calls = <({ItemType type, String query, int offset})>[];
  Completer<CatalogPageResult>? next;
  ProductInput? savedProduct;

  @override
  Future<CatalogPageResult> search({
    required ItemType type,
    required String query,
    required bool includeInactive,
    required int offset,
    required int limit,
  }) {
    calls.add((type: type, query: query, offset: offset));
    return next?.future ?? Future.value(const CatalogPageResult([], false));
  }

  @override
  Future<CatalogItem?> get(ItemType type, int id) async => null;
  @override
  Future<CatalogItem?> getByBarcode(String barcode) async => null;
  @override
  Future<CatalogItem> saveProduct(ProductInput input, {int? id}) async {
    validateProduct(input);
    savedProduct = input;
    return CatalogItem(
      id: id ?? 1,
      type: ItemType.product,
      name: input.name,
      sellingPrice: input.sellingPrice,
      cost: input.purchasePrice,
      isActive: true,
      stockMilli: input.openingStockMilli,
    );
  }

  @override
  Future<CatalogItem> saveService(ServiceInput input, {int? id}) => throw UnimplementedError();
  @override
  Future<void> setActive(ItemType type, int id, bool active) => throw UnimplementedError();
}

class _Categories implements CategoryRepository {
  @override
  Future<List<CategoryModel>> list() async => [];
  @override
  Future<CategoryModel> save({int? id, required String name, required ItemType type}) =>
      throw UnimplementedError();
  @override
  Future<void> setActive(int id, bool active) => throw UnimplementedError();
}

class _ShopRepo implements ShopRepository {
  @override
  Future<ShopModel?> getShop() async =>
      const ShopModel(name: 'Mahalli', businessType: BusinessType.grocery, currency: 'ILS');
  @override
  Future<ShopModel> createShop(ShopModel details) async => details;
  @override
  Future<ShopModel> updateShop(ShopModel details) async => details;
}

void main() {
  test('money and quantity parse Arabic decimals without floating point', () {
    expect(Money.tryParse('١٢٫٣٤')?.minor, 1234);
    expect(Money.tryParse('١٢٫٣٤٥', currency: 'JOD')?.minor, 12345);
    expect(Quantity.tryParse('١٫٢٥')?.milli, 1250);
    expect(Quantity.tryParse('1.2345'), isNull);
  });

  test('catalog validation requires positive sale price and valid stock', () {
    ProductInput product({int sale = 100, int opening = 0}) => ProductInput(
      name: 'Tea',
      sellingPrice: sale,
      purchasePrice: 50,
      unit: UnitType.piece,
      lowStockThresholdMilli: 0,
      openingStockMilli: opening,
    );
    expect(() => validateProduct(product()), returnsNormally);
    expect(() => validateProduct(product(sale: 0)), throwsA(isA<ValidationFailure>()));
    expect(() => validateProduct(product(opening: -1)), throwsA(isA<ValidationFailure>()));
    expect(
      () => validateService(const ServiceInput(name: 'Repair', sellingPrice: 0, cost: 0)),
      throwsA(isA<ValidationFailure>()),
    );
  });

  test('catalog ignores stale search response after type changes', () async {
    final repo = _CatalogRepo();
    final pending = Completer<CatalogPageResult>();
    repo.next = pending;
    final cubit = CatalogCubit(repo);
    addTearDown(cubit.close);

    final first = cubit.load();
    repo.next = null;
    cubit.selectType(ItemType.service);
    await Future<void>.delayed(Duration.zero);
    pending.complete(
      const CatalogPageResult([
        CatalogItem(
          id: 1,
          type: ItemType.product,
          name: 'Tea',
          sellingPrice: 100,
          cost: 0,
          isActive: true,
        ),
      ], false),
    );
    await first;
    expect(cubit.state.type, ItemType.service);
    expect(cubit.state.items, isEmpty);
    expect(repo.calls.map((call) => call.type), [ItemType.product, ItemType.service]);
  });

  testWidgets('product form parses price and opening quantity', (tester) async {
    tester.view.physicalSize = const Size(800, 1100);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    final repository = _CatalogRepo();
    sl.registerFactory<CatalogFormCubit>(() => CatalogFormCubit(repository));
    sl.registerSingleton<CategoryRepository>(_Categories());
    addTearDown(() => sl.unregister<CatalogFormCubit>());
    addTearDown(() => sl.unregister<CategoryRepository>());
    final shopRepo = _ShopRepo();
    final shop = ShopCubit(shopRepo, CreateShop(shopRepo));
    await shop.load();
    addTearDown(shop.close);

    await tester.pumpWidget(
      BlocProvider<ShopCubit>.value(
        value: shop,
        child: const MaterialApp(
          locale: Locale('en'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: CatalogFormPage(type: ItemType.product),
        ),
      ),
    );
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('catalog_name')), 'Tea');
    await tester.enterText(find.byKey(const Key('catalog_selling')), '12.50');
    await tester.scrollUntilVisible(
      find.byKey(const Key('catalog_opening')),
      250,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.enterText(find.byKey(const Key('catalog_opening')), '1.25');
    tester.testTextInput.hide();
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(
      find.text('Save'),
      250,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    expect(repository.savedProduct?.name, 'Tea');
    expect(repository.savedProduct?.sellingPrice, 1250);
    expect(repository.savedProduct?.openingStockMilli, 1250);
    expect(tester.takeException(), isNull);
  });
}
