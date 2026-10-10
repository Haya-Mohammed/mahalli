import 'package:mahalli/features/receipts/domain/models/receipt_line.dart';

class Receipt {
  final String shopName;
  final int number;
  final DateTime createdAt;
  final List<ReceiptLine> lines;
  final int totalMinor;
  final int paidMinor;
  final int remainingMinor;
  final String? customerName;

  const Receipt({
    required this.shopName,
    required this.number,
    required this.createdAt,
    required this.lines,
    required this.totalMinor,
    required this.paidMinor,
    required this.remainingMinor,
    this.customerName,
  });
}
