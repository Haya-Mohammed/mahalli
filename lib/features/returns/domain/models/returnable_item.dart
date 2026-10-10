import 'package:mahalli/core/database/collections/enums.dart';

class ReturnableItem {
  final int saleItemId;
  final int itemId;
  final ItemType type;
  final String name;
  final int remainingMilli;
  final int unitPrice;
  final int unitCost;

  const ReturnableItem({
    required this.saleItemId,
    required this.itemId,
    required this.type,
    required this.name,
    required this.remainingMilli,
    required this.unitPrice,
    required this.unitCost,
  });
}
