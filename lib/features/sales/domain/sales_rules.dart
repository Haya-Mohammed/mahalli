import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/core/error/failure.dart';
import 'package:mahalli/features/sales/domain/models/cart_line.dart';
import 'package:mahalli/features/sales/domain/models/checkout_input.dart';

int cartTotal(Iterable<CartLine> lines) => lines.fold(0, (sum, line) => sum + line.totalMinor);

PaymentStatus paymentStatusFor(int total, int paid) {
  if (paid == total) return PaymentStatus.paid;
  if (paid == 0) return PaymentStatus.credit;
  return PaymentStatus.partial;
}

void validateCheckout(CheckoutInput input) {
  if (input.lines.isEmpty || input.lines.any((line) => line.quantityMilli <= 0)) {
    throw const ValidationFailure('Cart must contain positive quantities');
  }
  final total = cartTotal(input.lines);
  if (input.paidAmount < 0 || input.paidAmount > total) {
    throw const ValidationFailure('Invalid paid amount');
  }
  if (total - input.paidAmount > 0 && input.customerId == null) {
    throw const ValidationFailure('Customer required for credit');
  }
}
