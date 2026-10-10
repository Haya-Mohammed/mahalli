import 'package:mahalli/core/error/failure.dart';

int adjustmentDelta(int currentMilli, int targetMilli) {
  if (targetMilli < 0) {
    throw const ValidationFailure('Counted stock cannot be negative');
  }
  return targetMilli - currentMilli;
}

int damageDelta(int currentMilli, int quantityMilli) {
  if (quantityMilli <= 0) {
    throw const ValidationFailure('Damage quantity must be positive');
  }
  if (quantityMilli > currentMilli) {
    throw const InsufficientStockFailure('Damage exceeds current stock');
  }
  return -quantityMilli;
}
