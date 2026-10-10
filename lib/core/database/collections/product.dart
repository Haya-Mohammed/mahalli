import 'package:isar_community/isar.dart';

import 'enums.dart';

part 'product.g.dart';

/// Prices are in minor units (int); quantities in thousandths (int).
@collection
class Product {
  Id id = Isar.autoIncrement;
  @Index(caseSensitive: false)
  late String name;
  // Uniqueness is enforced in the repository: an Isar unique index would
  // treat `null` as a value and reject a second product without barcode.
  @Index()
  String? barcode;
  @Index()
  String? sku;
  @Index()
  int? categoryId;
  int purchasePrice = 0;
  int sellingPrice = 0;
  int stockMilli = 0;
  int lowStockThresholdMilli = 0;
  @Enumerated(EnumType.name)
  UnitType unit = UnitType.piece;
  bool isActive = true;
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
}

@collection
class Service {
  Id id = Isar.autoIncrement;
  @Index(caseSensitive: false)
  late String name;
  @Index()
  int? categoryId;
  int cost = 0;
  int sellingPrice = 0;
  bool isActive = true;
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
}
