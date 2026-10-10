import 'package:mahalli/core/error/failure.dart';

int balanceFromAmounts(Iterable<int> amounts) =>
    amounts.fold(0, (balance, amount) => balance + amount);

int paymentDelta(int balanceMinor, int paymentMinor) {
  if (paymentMinor <= 0) {
    throw const ValidationFailure('Payment must be positive');
  }
  if (paymentMinor > balanceMinor) {
    throw const OverpaymentFailure('Payment exceeds debt');
  }
  return -paymentMinor;
}

int adjustmentDelta(int balanceMinor, int deltaMinor) {
  if (deltaMinor == 0) {
    throw const ValidationFailure('Adjustment cannot be zero');
  }
  if (balanceMinor + deltaMinor < 0) {
    throw const OverpaymentFailure('Adjustment would create a credit balance');
  }
  return deltaMinor;
}
