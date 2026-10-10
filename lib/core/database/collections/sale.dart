import 'package:isar_community/isar.dart';

import 'enums.dart';

part 'sale.g.dart';

@collection
class Sale {
  Id id = Isar.autoIncrement;

  int? customerId;
  int subtotal = 0;
  int totalAmount = 0;
  int paidAmount = 0;
  int remainingAmount = 0;
  @Enumerated(EnumType.name)
  PaymentStatus paymentStatus = PaymentStatus.paid;
  @Index()
  DateTime createdAt = DateTime.now();
}

/// Snapshots price, cost and name at sale time (BR-09).
@collection
class SaleItem {
  Id id = Isar.autoIncrement;
  @Index()
  late int saleId;
  late int itemId;
  @Enumerated(EnumType.name)
  late ItemType itemType;
  late String itemNameSnapshot;
  late int quantityMilli;
  late int unitPrice;
  late int unitCost;
  late int totalPrice;
  DateTime createdAt = DateTime.now();
}

@collection
class SaleReturn {
  Id id = Isar.autoIncrement;
  @Index()
  late int saleId;
  int? customerId;
  int totalAmount = 0;
  int refundAmount = 0;
  @Index()
  DateTime createdAt = DateTime.now();
}

@collection
class ReturnItem {
  Id id = Isar.autoIncrement;
  @Index()
  late int returnId;
  late int saleItemId;
  late int quantityMilli;
  late int unitPrice;
  late int unitCost;
  late int totalAmount;
}

/// Persisted cart so an interrupted sale can be resumed (Section 8.5).
@collection
class DraftCart {
  Id id = Isar.autoIncrement;
  int? customerId;

  /// JSON-encoded cart lines.
  late String payload;
  DateTime updatedAt = DateTime.now();
}
