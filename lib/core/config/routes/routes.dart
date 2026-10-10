import 'package:flutter/foundation.dart';
import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/features/catalog/domain/models/catalog_item.dart';
import 'package:mahalli/features/expenses/domain/models/expense_model.dart';
import 'package:mahalli/features/sales/presentation/cubits/cart_cubit/cart_cubit.dart';

/// Route names shared by navigation calls and the route factory.
abstract final class AppRoutes {
  static const home = '/';
  static const customers = '/customers';
  static const customerForm = '/customers/form';
  static const customerDetail = '/customers/detail';
  static const debts = '/customers/debts';
  static const catalog = '/catalog';
  static const catalogForm = '/catalog/form';
  static const catalogDetail = '/catalog/detail';
  static const barcodeScanner = '/catalog/scanner';
  static const categories = '/categories';
  static const stock = '/stock';
  static const stockDetail = '/stock/detail';
  static const checkout = '/sales/checkout';
  static const salesHistory = '/sales/history';
  static const saleDetail = '/sales/detail';
  static const receipt = '/sales/receipt';
  static const saleReturn = '/sales/return';
  static const expenses = '/expenses';
  static const expenseForm = '/expenses/form';
  static const expenseCategories = '/expenses/categories';
  static const reports = '/reports';
  static const settings = '/settings';
  static const shopSettings = '/settings/shop';
  static const receiptSettings = '/settings/receipt';
  static const pinSetup = '/settings/pin/setup';
  static const pinSettings = '/settings/pin';
  static const backup = '/settings/backup';
  static const about = '/settings/about';
}

class CatalogFormArgs {
  const CatalogFormArgs(this.type, {this.item, this.initialBarcode});
  final ItemType type;
  final CatalogItem? item;
  final String? initialBarcode;
}

class ExpenseFormArgs {
  const ExpenseFormArgs({this.entry, this.onSaved});
  final ExpenseModel? entry;
  final ValueChanged<ExpenseModel>? onSaved;
}

class ReceiptArgs {
  const ReceiptArgs(this.saleId, {this.onNewSale});
  final int saleId;
  final VoidCallback? onNewSale;
}

class CheckoutArgs {
  const CheckoutArgs(this.cart);
  final CartCubit cart;
}
