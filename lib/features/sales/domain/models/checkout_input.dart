import 'package:mahalli/features/sales/domain/models/cart_line.dart';

class CheckoutInput {
  final List<CartLine> lines;
  final int paidAmount;
  final int? customerId;
  final String? attemptId;

  const CheckoutInput({
    required this.lines,
    required this.paidAmount,
    this.customerId,
    this.attemptId,
  });
}
