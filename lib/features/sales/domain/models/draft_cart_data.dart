import 'package:mahalli/features/sales/domain/models/cart_line.dart';

class DraftCartData {
  final List<CartLine> lines;
  final int? customerId;

  const DraftCartData({required this.lines, this.customerId});
}
