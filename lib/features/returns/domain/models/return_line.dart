import 'package:mahalli/features/returns/domain/models/returnable_item.dart';

class ReturnLine {
  final ReturnableItem item;
  final int quantityMilli;

  const ReturnLine({required this.item, required this.quantityMilli});
}
