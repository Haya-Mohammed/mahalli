import 'package:mahalli/core/database/collections/enums.dart';

class CatalogItem {
  const CatalogItem({
    required this.id,
    required this.type,
    required this.name,
    required this.sellingPrice,
    required this.cost,
    required this.isActive,
    this.categoryId,
    this.barcode,
    this.sku,
    this.unit = UnitType.piece,
    this.stockMilli = 0,
    this.lowStockThresholdMilli = 0,
  });

  final int id;
  final ItemType type;
  final String name;
  final int sellingPrice;
  final int cost;
  final bool isActive;
  final int? categoryId;
  final String? barcode;
  final String? sku;
  final UnitType unit;
  final int stockMilli;
  final int lowStockThresholdMilli;
}
