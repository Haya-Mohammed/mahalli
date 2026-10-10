import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/core/config/routes/routes.dart';
import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';
import 'package:mahalli/features/backup/presentation/backup_page.dart';
import 'package:mahalli/features/catalog/domain/models/catalog_item.dart';
import 'package:mahalli/features/catalog/presentation/pages/barcode_scanner_page.dart';
import 'package:mahalli/features/catalog/presentation/pages/catalog_form_page.dart';
import 'package:mahalli/features/catalog/presentation/widgets/catalog_view.dart';
import 'package:mahalli/features/categories/presentation/pages/category_page.dart';
import 'package:mahalli/features/customers/domain/models/customer_details.dart';
import 'package:mahalli/features/customers/presentation/pages/customer_detail_page.dart';
import 'package:mahalli/features/customers/presentation/pages/customer_form_page.dart';
import 'package:mahalli/features/customers/presentation/pages/customer_list_page.dart';
import 'package:mahalli/features/customers/presentation/pages/debts_overview_page.dart';
import 'package:mahalli/features/expenses/presentation/expenses_page.dart';
import 'package:mahalli/features/receipts/presentation/pages/receipt_page.dart';
import 'package:mahalli/features/reports/presentation/pages/reports_page.dart';
import 'package:mahalli/features/returns/presentation/pages/return_page.dart';
import 'package:mahalli/features/sales/presentation/pages/checkout_page.dart';
import 'package:mahalli/features/sales/presentation/pages/sale_details_page.dart';
import 'package:mahalli/features/sales/presentation/pages/sales_history_page.dart';
import 'package:mahalli/features/security/presentation/pages/pin_pages.dart';
import 'package:mahalli/features/settings/presentation/pages/about_page.dart';
import 'package:mahalli/features/settings/presentation/pages/receipt_settings_page.dart';
import 'package:mahalli/features/settings/presentation/pages/settings_page.dart';
import 'package:mahalli/features/settings/presentation/pages/shop_settings_page.dart';
import 'package:mahalli/features/shell/views/app_gate_view.dart';
import 'package:mahalli/features/stock/presentation/pages/stock_detail_page.dart';
import 'package:mahalli/features/stock/presentation/pages/stock_list_page.dart';

abstract final class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    final Widget page = switch (settings.name) {
      AppRoutes.home => const AppGate(),
      AppRoutes.customers => const CustomerListPage(),
      AppRoutes.customerForm => CustomerFormPage(
        customer: args as CustomerDetails?,
      ),
      AppRoutes.customerDetail => CustomerDetailPage(customerId: args as int),
      AppRoutes.debts => const DebtsOverviewPage(),
      AppRoutes.catalog => _catalogPage(args as ItemType),
      AppRoutes.catalogForm => _catalogForm(args as CatalogFormArgs),
      AppRoutes.catalogDetail => CatalogDetailPage(item: args as CatalogItem),
      AppRoutes.barcodeScanner => const BarcodeScannerPage(),
      AppRoutes.categories => const CategoryPage(),
      AppRoutes.stock => const StockListPage(),
      AppRoutes.stockDetail => StockDetailPage(productId: args as int),
      AppRoutes.checkout => BlocProvider.value(
        value: (args as CheckoutArgs).cart,
        child: const CheckoutPage(),
      ),
      AppRoutes.salesHistory => const SalesHistoryPage(),
      AppRoutes.saleDetail => SaleDetailsPage(saleId: args as int),
      AppRoutes.receipt => _receiptPage(args as ReceiptArgs),
      AppRoutes.saleReturn => ReturnPage(saleId: args as int),
      AppRoutes.expenses => const ExpensesPage(),
      AppRoutes.expenseForm => _expenseForm(args as ExpenseFormArgs?),
      AppRoutes.expenseCategories => const ExpenseCategoriesPage(),
      AppRoutes.reports => const ReportsPage(),
      AppRoutes.settings => const SettingsPage(),
      AppRoutes.shopSettings => const ShopSettingsPage(),
      AppRoutes.receiptSettings => const ReceiptSettingsPage(),
      AppRoutes.pinSetup => const PinSetupPage(),
      AppRoutes.pinSettings => const PinSettingsPage(),
      AppRoutes.backup => const BackupPage(),
      AppRoutes.about => const AboutPage(),
      _ => throw ArgumentError.value(settings.name, 'route', 'Unknown route'),
    };
    return switch (settings.name) {
      AppRoutes.customerForm ||
      AppRoutes.catalogForm ||
      AppRoutes.expenseForm ||
      AppRoutes.saleReturn => _buildRoute<bool>(page, settings),
      AppRoutes.barcodeScanner => _buildRoute<String>(page, settings),
      AppRoutes.checkout => _buildRoute<int>(page, settings),
      _ => _buildRoute<void>(page, settings),
    };
  }

  static Route<T> _buildRoute<T>(Widget page, RouteSettings settings) =>
      MaterialPageRoute<T>(builder: (_) => page, settings: settings);

  static Widget _catalogPage(ItemType type) => Builder(
    builder: (context) => Scaffold(
      appBar: AppBar(
        title: Text(
          type == ItemType.service
              ? context.l10n.services
              : context.l10n.products,
        ),
      ),
      body: CatalogView(initialType: type),
    ),
  );

  static Widget _catalogForm(CatalogFormArgs args) => CatalogFormPage(
    type: args.type,
    item: args.item,
    initialBarcode: args.initialBarcode,
  );

  static Widget _expenseForm(ExpenseFormArgs? args) =>
      ExpenseFormPage(entry: args?.entry, onSaved: args?.onSaved);

  static Widget _receiptPage(ReceiptArgs args) =>
      ReceiptPage(saleId: args.saleId, onNewSale: args.onNewSale);
}
