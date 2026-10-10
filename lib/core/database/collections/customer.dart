import 'package:isar_community/isar.dart';

import 'enums.dart';

part 'customer.g.dart';

@collection
class Customer {
  Id id = Isar.autoIncrement;
  @Index(caseSensitive: false)
  late String name;
  @Index()
  String? phone;
  String? notes;
  bool isActive = true;
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
}

/// Immutable ledger. Balance is always derived from these rows.
@collection
class DebtTransaction {
  Id id = Isar.autoIncrement;
  @Index()
  late int customerId;
  int? saleId;
  int? returnId;
  @Enumerated(EnumType.name)
  late DebtTxType type;

  /// Signed effect on balance in minor units (+ owes more, - owes less).
  late int amount;
  String? note;
  @Index()
  DateTime createdAt = DateTime.now();
}
