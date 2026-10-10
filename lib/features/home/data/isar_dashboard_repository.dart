import 'package:flutter/foundation.dart';
import 'package:isar_community/isar.dart';
import 'package:mahalli/core/database/collections/customer.dart';
import 'package:mahalli/core/database/collections/product.dart';
import 'package:mahalli/core/database/collections/sale.dart';
import 'package:mahalli/core/database/collections/stock_expense.dart';
import 'package:mahalli/core/error/failure.dart';
import 'package:mahalli/core/money/money.dart';
import '../domain/dashboard_repository.dart';
import '../domain/dashboard_summary.dart';

class IsarDashboardRepository implements DashboardRepository {
  const IsarDashboardRepository(this.isar);
  final Isar isar;

  @override
  Future<DashboardSummary> loadForDay(
    DateTime startLocal,
    DateTime endLocal,
  ) async {
    try {
      final salesQuery = isar.sales.where().createdAtBetween(
        startLocal,
        endLocal,
        includeUpper: false,
      );
      final saleCount = await salesQuery.count();
      final grossSales = await isar.sales
          .where()
          .createdAtBetween(startLocal, endLocal, includeUpper: false)
          .totalAmountProperty()
          .sum();
      final saleItems = await isar.saleItems
          .filter()
          .createdAtBetween(startLocal, endLocal, includeUpper: false)
          .findAll();
      var grossProfit = 0;
      for (final item in saleItems) {
        grossProfit +=
            item.totalPrice -
            Money(item.unitCost).times(Quantity(item.quantityMilli)).minor;
      }

      final returns = await isar.saleReturns
          .where()
          .createdAtBetween(startLocal, endLocal, includeUpper: false)
          .findAll();
      var returnAmount = 0;
      var returnProfit = 0;
      for (final saleReturn in returns) {
        returnAmount += saleReturn.totalAmount;
        final items = await isar.returnItems
            .where()
            .returnIdEqualTo(saleReturn.id)
            .findAll();
        for (final item in items) {
          returnProfit +=
              item.totalAmount -
              Money(item.unitCost).times(Quantity(item.quantityMilli)).minor;
        }
      }

      final expenses = await isar.expenses
          .where()
          .expenseDateBetween(startLocal, endLocal, includeUpper: false)
          .amountProperty()
          .sum();
      final debt = await isar.debtTransactions.where().amountProperty().sum();
      final products = await isar.products.where().findAll();
      final activeProducts = products.where((p) => p.isActive).toList();
      final lowStock =
          activeProducts
              .where((p) => p.stockMilli <= p.lowStockThresholdMilli)
              .toList()
            ..sort((a, b) {
              final aOut = a.stockMilli <= 0 ? 0 : 1;
              final bOut = b.stockMilli <= 0 ? 0 : 1;
              return aOut != bOut
                  ? aOut.compareTo(bOut)
                  : a.stockMilli.compareTo(b.stockMilli);
            });
      List<Sale> recentSales = [];
      final customerNames = <int, String>{};
      try {
        recentSales = await isar.sales
            .where()
            .sortByCreatedAtDesc()
            .limit(3)
            .findAll();
        final customerIds = recentSales
            .map((s) => s.customerId)
            .whereType<int>()
            .toList();
        if (customerIds.isNotEmpty) {
          final customers = await isar.customers.getAll(customerIds);
          for (var i = 0; i < customerIds.length; i++) {
            final customer = customers[i];
            if (customer != null) customerNames[customerIds[i]] = customer.name;
          }
        }
      } catch (error, stackTrace) {
        debugPrint('Dashboard recent sales lookup failed: $error\n$stackTrace');
      }

      return DashboardSummary(
        todaySalesMinor: grossSales - returnAmount,
        todayProfitMinor: grossProfit - returnProfit - expenses,
        todaySaleCount: saleCount,
        outstandingDebtMinor: debt > 0 ? debt : 0,
        lowStockCount: lowStock.length,
        productCount: activeProducts.length,
        todayExpensesMinor: expenses,
        outOfStockCount: lowStock.where((p) => p.stockMilli <= 0).length,
        stockAlerts: lowStock
            .map(
              (p) => DashboardStockAlert(
                productId: p.id,
                name: p.name,
                stockMilli: p.stockMilli,
                thresholdMilli: p.lowStockThresholdMilli,
              ),
            )
            .toList(),
        recentSales: recentSales
            .map(
              (s) => DashboardRecentSale(
                id: s.id,
                createdAt: s.createdAt,
                totalMinor: s.totalAmount,
                remainingMinor: s.remainingAmount,
                customerName: customerNames[s.customerId],
              ),
            )
            .toList(),
      );
    } catch (error, stackTrace) {
      debugPrint('Dashboard summary load failed: $error\n$stackTrace');
      throw const DatabaseFailure('Unable to load dashboard');
    }
  }
}
