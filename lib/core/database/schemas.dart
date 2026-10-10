import 'package:isar_community/isar.dart';

import 'collections/category.dart';
import 'collections/customer.dart';
import 'collections/product.dart';
import 'collections/sale.dart';
import 'collections/shop.dart';
import 'collections/stock_expense.dart';

final List<CollectionSchema<dynamic>> allSchemas = [
  ShopSchema,
  CategorySchema,
  ExpenseCategorySchema,
  ProductSchema,
  ServiceSchema,
  CustomerSchema,
  DebtTransactionSchema,
  SaleSchema,
  SaleItemSchema,
  SaleReturnSchema,
  ReturnItemSchema,
  DraftCartSchema,
  StockMovementSchema,
  ExpenseSchema,
];
