import 'package:mahalli/core/database/collections/enums.dart';

class StockMovementEntry {
  const StockMovementEntry({
    required this.id,
    required this.productId,
    required this.type,
    required this.quantityMilli,
    required this.createdAt,
    this.note,
    this.referenceId,
  });
  final int id;
  final int productId;
  final StockMovementType type;
  final int quantityMilli;
  final DateTime createdAt;
  final String? note;
  final int? referenceId;
}
