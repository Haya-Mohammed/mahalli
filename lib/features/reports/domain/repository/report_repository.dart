import 'package:mahalli/features/reports/domain/models/profit_report.dart';
import 'package:mahalli/features/reports/domain/models/report_period.dart';
import 'package:mahalli/features/reports/domain/models/sales_report.dart';

abstract class ReportRepository {
  Future<SalesReport> sales(ReportPeriod period);
  Future<ProfitReport> profit(ReportPeriod period);
  Future<int> outstandingDebt();
  Future<int> lowStockCount();
}
