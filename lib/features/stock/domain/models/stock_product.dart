import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/features/stock/domain/models/stock_enums.dart';

class StockProduct {
  const StockProduct({
    required this.id,
    required this.name,
    required this.quantityMilli,
    required this.thresholdMilli,
    required this.unit,
    required this.isActive,
    this.sellingPriceMinor = 0,
    this.barcode,
    this.sku,
  });
  final int id;
  final String name;
  final int quantityMilli;
  final int thresholdMilli;
  final UnitType unit;
  final bool isActive;
  final int sellingPriceMinor;
  final String? barcode;
  final String? sku;

  StockStatus get status => stockStatus(quantityMilli, thresholdMilli);
}
