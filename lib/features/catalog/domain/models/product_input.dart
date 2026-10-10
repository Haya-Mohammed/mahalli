import 'package:mahalli/core/database/collections/enums.dart';

class ProductInput {
  const ProductInput({
    required this.name,
    required this.sellingPrice,
    required this.purchasePrice,
    required this.unit,
    required this.lowStockThresholdMilli,
    this.categoryId,
    this.barcode,
    this.sku,
    this.openingStockMilli = 0,
  });
  final String name;
  final int sellingPrice;
  final int purchasePrice;
  final UnitType unit;
  final int lowStockThresholdMilli;
  final int? categoryId;
  final String? barcode;
  final String? sku;
  final int openingStockMilli;
}
