import 'package:isar_community/isar.dart';

import 'enums.dart';

part 'stock_expense.g.dart';

@collection
class StockMovement {
  Id id = Isar.autoIncrement;
  @Index()
  late int productId;
  @Enumerated(EnumType.name)
  late StockMovementType type;

  /// Signed quantity in thousandths.
  late int quantityMilli;
  int? referenceId;
  String? note;
  @Index()
  DateTime createdAt = DateTime.now();
}

@collection
class Expense {
  Id id = Isar.autoIncrement;
  @Index()
  int? categoryId;
  late int amount;
  String? description;
  @Index()
  late DateTime expenseDate;
  DateTime createdAt = DateTime.now();
}
