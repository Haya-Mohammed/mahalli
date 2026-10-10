import 'package:mahalli/core/database/collections/enums.dart';

class SaleSummary {
  final int id;
  final int saleNumber;
  final int totalAmount;
  final int paidAmount;
  final int remainingAmount;
  final PaymentStatus paymentStatus;
  final DateTime createdAt;
  final int? customerId;

  const SaleSummary({
    required this.id,
    required this.saleNumber,
    required this.totalAmount,
    required this.paidAmount,
    required this.remainingAmount,
    required this.paymentStatus,
    required this.createdAt,
    this.customerId,
  });
}
