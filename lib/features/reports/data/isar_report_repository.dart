import 'package:isar_community/isar.dart';
import 'package:mahalli/core/database/collections/customer.dart';
import 'package:mahalli/core/database/collections/product.dart';
import 'package:mahalli/core/database/collections/sale.dart';
import 'package:mahalli/core/database/collections/stock_expense.dart';
import 'package:mahalli/core/money/money.dart';
import 'package:mahalli/features/reports/domain/models/profit_report.dart';
import 'package:mahalli/features/reports/domain/models/report_period.dart';
import 'package:mahalli/features/reports/domain/models/sales_report.dart';

import '../domain/repository/report_repository.dart';

class IsarReportRepository implements ReportRepository {
  const IsarReportRepository(this.isar);
  final Isar isar;
  @override
  Future<SalesReport> sales(ReportPeriod p) async {
    final count = await isar.sales
        .where()
        .createdAtBetween(p.from, p.to, includeUpper: false)
        .count();
    final total = await isar.sales
        .where()
        .createdAtBetween(p.from, p.to, includeUpper: false)
        .totalAmountProperty()
        .sum();
    final returned = await isar.saleReturns
        .where()
        .createdAtBetween(p.from, p.to, includeUpper: false)
        .totalAmountProperty()
        .sum();
    return SalesReport(salesCount: count, revenueMinor: total - returned, returnsMinor: returned);
  }

  @override
  Future<ProfitReport> profit(ReportPeriod p) async {
    final sale = await sales(p);
    final sold = await isar.saleItems
        .filter()
        .createdAtBetween(p.from, p.to, includeUpper: false)
        .findAll();
    var cogs = 0;
    for (final row in sold) {
      cogs += Money(row.unitCost).times(Quantity(row.quantityMilli)).minor;
    }
    final returned = await isar.saleReturns
        .where()
        .createdAtBetween(p.from, p.to, includeUpper: false)
        .findAll();
    for (final receipt in returned) {
      for (final row in await isar.returnItems.where().returnIdEqualTo(receipt.id).findAll()) {
        cogs -= Money(row.unitCost).times(Quantity(row.quantityMilli)).minor;
      }
    }
    final expenses = await isar.expenses
        .where()
        .expenseDateBetween(p.from, p.to, includeUpper: false)
        .amountProperty()
        .sum();
    return ProfitReport(
      revenueMinor: sale.revenueMinor,
      cogsMinor: cogs,
      grossProfitMinor: sale.revenueMinor - cogs,
      expensesMinor: expenses,
    );
  }

  @override
  Future<int> outstandingDebt() async {
    final v = await isar.debtTransactions.where().amountProperty().sum();
    return v < 0 ? 0 : v;
  }

  @override
  Future<int> lowStockCount() async => (await isar.products.where().findAll())
      .where((p) => p.isActive && p.stockMilli <= p.lowStockThresholdMilli)
      .length;
}
