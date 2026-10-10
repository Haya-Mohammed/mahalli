class DashboardSummary {
  const DashboardSummary({
    required this.todaySalesMinor,
    required this.todayProfitMinor,
    required this.todaySaleCount,
    required this.outstandingDebtMinor,
    required this.lowStockCount,
    required this.productCount,
    this.todayExpensesMinor = 0,
    this.outOfStockCount = 0,
    this.stockAlerts = const [],
    this.recentSales = const [],
  });

  final int todaySalesMinor;
  final int todayProfitMinor;
  final int todaySaleCount;
  final int outstandingDebtMinor;
  final int lowStockCount;
  final int productCount;
  final int todayExpensesMinor;
  final int outOfStockCount;
  final List<DashboardStockAlert> stockAlerts;
  final List<DashboardRecentSale> recentSales;

  static const empty = DashboardSummary(
    todaySalesMinor: 0,
    todayProfitMinor: 0,
    todaySaleCount: 0,
    outstandingDebtMinor: 0,
    lowStockCount: 0,
    productCount: 0,
  );
}

class DashboardStockAlert {
  const DashboardStockAlert({
    required this.productId,
    required this.name,
    required this.stockMilli,
    required this.thresholdMilli,
  });
  final int productId;
  final String name;
  final int stockMilli;
  final int thresholdMilli;
}

class DashboardRecentSale {
  const DashboardRecentSale({
    required this.id,
    required this.createdAt,
    required this.totalMinor,
    required this.remainingMinor,
    this.customerName,
  });
  final int id;
  final DateTime createdAt;
  final int totalMinor;
  final int remainingMinor;
  final String? customerName;
}
