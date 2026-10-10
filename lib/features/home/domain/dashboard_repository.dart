import 'dashboard_summary.dart';

abstract class DashboardRepository {
  Future<DashboardSummary> loadForDay(DateTime startLocal, DateTime endLocal);
}
