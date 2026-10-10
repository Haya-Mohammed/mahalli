// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mahalli/core/config/locale/l10n/app_localizations.dart';
// import 'package:mahalli/core/database/collections/enums.dart';
// import 'package:mahalli/core/di/injection_container.dart';
// import 'package:mahalli/features/catalog/domain/models/catalog_item.dart';
// import 'package:mahalli/features/catalog/domain/models/catalog_page_result.dart';
// import 'package:mahalli/features/catalog/domain/models/product_input.dart';
// import 'package:mahalli/features/catalog/domain/models/service_input.dart';
// import 'package:mahalli/features/catalog/domain/repository/catalog_repository.dart';
// import 'package:mahalli/features/categories/domain/models/category_Model.dart';
// import 'package:mahalli/features/categories/domain/repository/category_repository.dart';
// import 'package:mahalli/features/onboarding/domain/models/shop_model.dart';
// import 'package:mahalli/features/onboarding/domain/repository/shop_repository.dart';
// import 'package:mahalli/features/onboarding/domain/usecases/create_shop.dart';
// import 'package:mahalli/features/onboarding/presentation/cubit/shop_cubit.dart';
// import 'package:mahalli/features/sales/domain/models/cart_line.dart';
// import 'package:mahalli/features/sales/domain/models/checkout_input.dart';
// import 'package:mahalli/features/sales/domain/models/draft_cart_data.dart';
// import 'package:mahalli/features/sales/domain/models/sale_details.dart';
// import 'package:mahalli/features/sales/domain/models/sale_summary.dart';
// import 'package:mahalli/features/sales/domain/models/sales_page.dart';
// import 'package:mahalli/features/sales/domain/repositories/sales_repository.dart';
// import 'package:mahalli/features/sales/presentation/cubits/cart_cubit/cart_cubit.dart';
// import 'package:mahalli/features/sales/presentation/cubits/checkout_cubit/checkout_cubit.dart';
// import 'package:mahalli/features/sales/presentation/pages/sales_page.dart';
//
// class _Catalog implements CatalogRepository {
//   final items = const [
//     CatalogItem(
//       id: 1,
//       type: ItemType.product,
//       name: 'Milk',
//       sellingPrice: 800,
//       cost: 500,
//       isActive: true,
//       categoryId: 1,
//       stockMilli: 24000,
//     ),
//     CatalogItem(
//       id: 2,
//       type: ItemType.service,
//       name: 'Haircut',
//       sellingPrice: 3000,
//       cost: 0,
//       isActive: true,
//       categoryId: 2,
//     ),
//   ];
//
//   @override
//   Future<CatalogPageResult> search({
//     required ItemType type,
//     required String query,
//     required bool includeInactive,
//     required int offset,
//     required int limit,
//   }) async {
//     final rows = items.where((item) => item.type == type).toList();
//     return CatalogPageResult(rows.skip(offset).take(limit).toList(), rows.length > offset + limit);
//   }
//
//   @override
//   Future<CatalogItem?> get(ItemType type, int id) async {
//     for (final item in items) {
//       if (item.type == type && item.id == id) return item;
//     }
//     return null;
//   }
//
//   @override
//   Future<CatalogItem?> getByBarcode(String barcode) async => null;
//   @override
//   Future<CatalogItem> saveProduct(ProductInput input, {int? id}) => throw UnimplementedError();
//   @override
//   Future<CatalogItem> saveService(ServiceInput input, {int? id}) => throw UnimplementedError();
//   @override
//   Future<void> setActive(ItemType type, int id, bool active) => throw UnimplementedError();
// }
//
// class _Categories implements CategoryRepository {
//   @override
//   Future<List<CategoryModel>> list() async => const [
//     CategoryModel(id: 1, name: 'Dairy', type: ItemType.product, isActive: true),
//     CategoryModel(id: 2, name: 'Services', type: ItemType.service, isActive: true),
//   ];
//   @override
//   Future<CategoryModel> save({int? id, required String name, required ItemType type}) =>
//       throw UnimplementedError();
//   @override
//   Future<void> setActive(int id, bool active) => throw UnimplementedError();
// }
//
// class _Sales implements SalesRepository {
//   @override
//   Future<DraftCartData?> loadDraft() async => null;
//   @override
//   Future<void> saveDraft(List<CartLine> lines, {int? customerId}) async {}
//   @override
//   Future<void> discardDraft() async {}
//   @override
//   Future<SaleSummary> create(CheckoutInput input) => throw UnimplementedError();
//   @override
//   Future<SalesPage> list({required int offset, required int limit}) => throw UnimplementedError();
//   @override
//   Future<SaleDetails?> details(int saleId) => throw UnimplementedError();
// }
//
// class _Shop implements ShopRepository {
//   @override
//   Future<ShopModel?> getShop() async => null;
//   @override
//   Future<ShopModel> createShop(ShopModel details) async => details;
//   @override
//   Future<ShopModel> updateShop(ShopModel details) async => details;
// }
//
// void main() {
//   testWidgets('Sales POS shows products and services and updates the cart', (tester) async {
//     tester.view.physicalSize = const Size(375, 812);
//     tester.view.devicePixelRatio = 1;
//     addTearDown(() {
//       tester.view.resetPhysicalSize();
//       tester.view.resetDevicePixelRatio();
//     });
//
//     await sl.reset();
//     addTearDown(sl.reset);
//     final sales = _Sales();
//     sl.registerSingleton<CatalogRepository>(_Catalog());
//     sl.registerSingleton<CategoryRepository>(_Categories());
//     sl.registerFactory<CartCubit>(() => CartCubit(sales));
//     sl.registerFactory<CheckoutCubit>(() => CheckoutCubit(sales));
//     final shop = _Shop();
//     final shopCubit = ShopCubit(shop, CreateShop(shop));
//     addTearDown(shopCubit.close);
//
//     await tester.pumpWidget(
//       BlocProvider.value(
//         value: shopCubit,
//         child: const MaterialApp(
//           locale: Locale('en'),
//           localizationsDelegates: AppLocalizations.localizationsDelegates,
//           supportedLocales: AppLocalizations.supportedLocales,
//           home: Scaffold(body: SalesPage(onOpenInventory: _noop)),
//         ),
//       ),
//     );
//     await tester.pumpAndSettle();
//
//     expect(find.text('Milk'), findsOneWidget);
//     expect(find.text('Haircut'), findsOneWidget);
//     await tester.tap(find.text('Milk'));
//     await tester.pumpAndSettle();
//     expect(find.text('Clear cart'), findsOneWidget);
//     expect(find.text('Items: 1'), findsOneWidget);
//
//     await tester.tap(find.textContaining('Checkout •'));
//     await tester.pumpAndSettle();
//     expect(find.text('Cash in full'), findsOneWidget);
//     await tester.tap(find.text('Partial payment'));
//     await tester.pumpAndSettle();
//     expect(find.text('Customer (required for credit)'), findsOneWidget);
//     await tester.pageBack();
//     await tester.pumpAndSettle();
//
//     await tester.tap(find.text('Dairy'));
//     await tester.pumpAndSettle();
//     expect(find.text('Milk'), findsOneWidget);
//     expect(find.text('Haircut'), findsNothing);
//     await tester.tap(find.text('Clear cart'));
//     await tester.pumpAndSettle();
//     expect(find.text('Items: 0'), findsOneWidget);
//   });
// }
//
// void _noop() {}
