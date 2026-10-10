import 'package:mahalli/features/sales/domain/models/cart_line.dart';
import 'package:mahalli/features/sales/domain/models/sale_summary.dart';

class SaleDetails {
  final SaleSummary sale;
  final List<CartLine> lines;

  const SaleDetails({required this.sale, required this.lines});
}
