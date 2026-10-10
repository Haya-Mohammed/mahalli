import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mahalli/core/config/locale/l10n/app_localizations.dart';
import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/core/di/injection_container.dart';
import 'package:mahalli/core/error/failure.dart';
import 'package:mahalli/features/catalog/domain/models/catalog_item.dart';
import 'package:mahalli/features/catalog/domain/models/catalog_page_result.dart';
import 'package:mahalli/features/catalog/domain/models/product_input.dart';
import 'package:mahalli/features/catalog/domain/models/service_input.dart';
import 'package:mahalli/features/catalog/domain/repository/catalog_repository.dart';
import 'package:mahalli/features/catalog/presentation/cubit/catalog_cubit.dart';
import 'package:mahalli/features/categories/domain/models/category_Model.dart';
import 'package:mahalli/features/categories/domain/repository/category_repository.dart';
import 'package:mahalli/features/categories/domain/usecases/category_name_policy.dart';
import 'package:mahalli/features/categories/presentation/cubit/category_cubit.dart';
import 'package:mahalli/features/categories/presentation/pages/category_page.dart';
import 'package:mahalli/features/shell/presentation/inventory_tab.dart';
import 'package:mahalli/features/stock/domain/models/stock_movement_page.dart';
import 'package:mahalli/features/stock/domain/models/stock_product.dart';
import 'package:mahalli/features/stock/domain/repositories/stock_repository.dart';
import 'package:mahalli/features/stock/presentation/cubits/stock_list/stock_list_cubit.dart';

class _EmptyStockRepo implements StockRepository {
  @override
  Future<List<StockProduct>> listProducts() async => [];
  @override
  Future<StockProduct?> getProduct(int productId) async => null;
  @override
  Future<StockMovementPage> getMovements(
    int productId, {
    required int offset,
    required int limit,
  }) async => const StockMovementPage([], false);
  @override
  Future<StockProduct> addStock(int productId, int quantityMilli, {String? note}) =>
      throw UnimplementedError();
  @override
  Future<StockProduct> adjustStock(int productId, int targetMilli, {String? note}) =>
      throw UnimplementedError();
  @override
  Future<StockProduct> recordDamage(int productId, int quantityMilli, {required String reason}) =>
      throw UnimplementedError();
  @override
  Future<void> recordInTxn({
    required int productId,
    required int deltaMilli,
    required StockMovementType type,
    int? referenceId,
    String? note,
  }) => throw UnimplementedError();
}

class _CategoryRepo implements CategoryRepository {
  final items = <CategoryModel>[];
  int nextId = 1;

  @override
  Future<List<CategoryModel>> list() async => List.of(items);

  @override
  Future<CategoryModel> save({int? id, required String name, required ItemType type}) async {
    if (isCategoryNameTaken(items, name: name, type: type, excludingId: id)) {
      throw DuplicateNameFailure(name);
    }
    final previous = id == null ? null : items.firstWhere((row) => row.id == id);
    final row = CategoryModel(
      id: id ?? nextId++,
      name: name.trim(),
      type: type,
      isActive: previous?.isActive ?? true,
    );
    if (previous != null) items.remove(previous);
    items.add(row);
    return row;
  }

  @override
  Future<void> setActive(int id, bool active) async {
    final previous = items.firstWhere((row) => row.id == id);
    items.remove(previous);
    items.add(CategoryModel(id: id, name: previous.name, type: previous.type, isActive: active));
  }
}

class _EmptyCatalogRepo implements CatalogRepository {
  @override
  Future<CatalogPageResult> search({
    required ItemType type,
    required String query,
    required bool includeInactive,
    required int offset,
    required int limit,
  }) async => const CatalogPageResult([], false);

  @override
  Future<CatalogItem?> get(ItemType type, int id) async => null;
  @override
  Future<CatalogItem?> getByBarcode(String barcode) async => null;
  @override
  Future<CatalogItem> saveProduct(ProductInput input, {int? id}) => throw UnimplementedError();
  @override
  Future<CatalogItem> saveService(ServiceInput input, {int? id}) => throw UnimplementedError();
  @override
  Future<void> setActive(ItemType type, int id, bool active) => throw UnimplementedError();
}

void main() {
  test('names are unique within type, including inactive categories', () {
    final items = [
      const CategoryModel(id: 1, name: ' Drinks ', type: ItemType.product, isActive: false),
    ];
    expect(isCategoryNameTaken(items, name: 'drinks', type: ItemType.product), isTrue);
    expect(isCategoryNameTaken(items, name: 'DRINKS', type: ItemType.service), isFalse);
    expect(
      isCategoryNameTaken(items, name: 'drinks', type: ItemType.product, excludingId: 1),
      isFalse,
    );
  });

  test('cubits saves, rejects duplicate, and deactivates', () async {
    final cubit = CategoryCubit(_CategoryRepo());
    addTearDown(cubit.close);
    await cubit.load();
    expect(await cubit.save(name: 'Drinks', type: ItemType.product), CategorySaveResult.saved);
    expect(cubit.state.items, hasLength(1));
    expect(
      await cubit.save(name: ' drinks ', type: ItemType.product),
      CategorySaveResult.duplicate,
    );
    expect(await cubit.setActive(1, false), isTrue);
    expect(cubit.state.items.single.isActive, isFalse);
    expect(cubit.state.busy, isFalse);
  });

  testWidgets('owner opens categories from Inventory and adds one', (tester) async {
    final repository = _CategoryRepo();
    sl.registerFactory<CategoryCubit>(() => CategoryCubit(repository));
    sl.registerFactory<CatalogCubit>(() => CatalogCubit(_EmptyCatalogRepo()));
    sl.registerFactory<StockListCubit>(() => StockListCubit(_EmptyStockRepo()));
    addTearDown(() => sl.unregister<CategoryCubit>());
    addTearDown(() => sl.unregister<CatalogCubit>());
    addTearDown(() => sl.unregister<StockListCubit>());
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      const MaterialApp(
        locale: Locale('en'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(body: InventoryTab()),
      ),
    );
    await tester.tap(find.byTooltip('More'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Categories').last);
    await tester.pumpAndSettle();
    expect(find.byType(CategoryPage), findsOneWidget);

    await tester.tap(find.text('Add category'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'Drinks');
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();
    expect(find.text('Drinks'), findsOneWidget);
    expect(repository.items.single.type, ItemType.product);
    expect(tester.takeException(), isNull);
  });
}
