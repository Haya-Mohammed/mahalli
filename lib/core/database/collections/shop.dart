import 'package:isar_community/isar.dart';

import 'enums.dart';

part 'shop.g.dart';

@collection
class Shop {
  Id id = Isar.autoIncrement;
  late String name;
  @Enumerated(EnumType.name)
  BusinessType businessType = BusinessType.other;
  String currency = 'ILS';
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
}
