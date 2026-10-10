import 'package:mahalli/features/sales/domain/models/sale_summary.dart';

class SalesPage {
  final List<SaleSummary> sales;
  final bool hasMore;

  const SalesPage(this.sales, this.hasMore);
}
