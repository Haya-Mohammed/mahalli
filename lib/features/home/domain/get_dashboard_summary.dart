import 'dashboard_repository.dart';
import 'dashboard_summary.dart';

class GetDashboardSummary {
  const GetDashboardSummary(this.repository, {this.now});

  final DashboardRepository repository;
  final DateTime Function()? now;

  Future<DashboardSummary> call() {
    final current = now?.call() ?? DateTime.now();
    final start = DateTime(current.year, current.month, current.day);
    final end = DateTime(current.year, current.month, current.day + 1);
    return repository.loadForDay(start, end);
  }
}
