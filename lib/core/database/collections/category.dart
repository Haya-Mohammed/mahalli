import 'package:isar_community/isar.dart';

import 'enums.dart';

part 'category.g.dart';

@Collection(accessor: 'categories')
class Category {
  Id id = Isar.autoIncrement;
  @Index(caseSensitive: false)
  late String name;
  @Enumerated(EnumType.name)
  ItemType type = ItemType.product;
  bool isActive = true;
  DateTime createdAt = DateTime.now();
}

@Collection(accessor: 'expenseCategories')
class ExpenseCategory {
  Id id = Isar.autoIncrement;
  @Index(caseSensitive: false)
  late String name;
  bool isActive = true;
  DateTime createdAt = DateTime.now();
}
