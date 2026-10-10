class ProfitReport {
  final int revenueMinor;
  final int cogsMinor;
  final int grossProfitMinor;
  final int expensesMinor;
  int get netProfitMinor => grossProfitMinor - expensesMinor;

  const ProfitReport({
    required this.revenueMinor,
    required this.cogsMinor,
    required this.grossProfitMinor,
    required this.expensesMinor,
  });
}
