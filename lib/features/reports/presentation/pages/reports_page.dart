import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mahalli/core/di/injection_container.dart';
import 'package:mahalli/core/money/money.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';
import 'package:mahalli/core/widgets/state_views.dart';
import 'package:mahalli/features/reports/domain/models/profit_report.dart';
import 'package:mahalli/features/reports/domain/models/report_period.dart';
import 'package:mahalli/features/reports/domain/models/sales_report.dart';
import 'package:mahalli/features/reports/presentation/widgets/profit_line.dart';
import 'package:mahalli/features/reports/presentation/widgets/stat_card.dart';

import '../../domain/repository/report_repository.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});
  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

typedef _ReportData = (ProfitReport, SalesReport, int, int, List<int>);

class _ReportsPageState extends State<ReportsPage> {
  int _period = 0;
  late Future<_ReportData> _report = _load();

  ReportPeriod _range() {
    final now = DateTime.now();
    final day = DateTime(now.year, now.month, now.day);
    return switch (_period) {
      0 => ReportPeriod(day, day.add(const Duration(days: 1))),
      1 => ReportPeriod(day.subtract(const Duration(days: 1)), day),
      2 => ReportPeriod(day.subtract(const Duration(days: 6)), day.add(const Duration(days: 1))),
      _ => ReportPeriod(DateTime(now.year, now.month, 1), DateTime(now.year, now.month + 1)),
    };
  }

  Future<_ReportData> _load() async {
    final repo = sl<ReportRepository>();
    final range = _range();
    final today = DateTime.now();
    final day = DateTime(today.year, today.month, today.day);
    final results = await Future.wait<dynamic>([
      repo.profit(range),
      repo.sales(range),
      repo.outstandingDebt(),
      repo.lowStockCount(),
      ...List.generate(7, (i) {
        final from = day.subtract(Duration(days: 6 - i));
        return repo.sales(ReportPeriod(from, from.add(const Duration(days: 1))));
      }),
    ]);
    return (
      results[0] as ProfitReport,
      results[1] as SalesReport,
      results[2] as int,
      results[3] as int,
      results.skip(4).cast<SalesReport>().map((r) => r.revenueMinor).toList(),
    );
  }

  void _refresh() => setState(() {
    _report = _load();
  });

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l.profitQuestion)),
      body: FutureBuilder<_ReportData>(
        future: _report,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorView(message: l.genericError, onRetry: _refresh);
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final (profit, sales, debt, lowStock, days) = snapshot.data!;
          return RefreshIndicator(
            onRefresh: () async {
              _refresh();
              await _report;
            },
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 28),
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      children: List.generate(4, (index) {
                        final labels = [l.today, l.yesterday, l.week, l.month];
                        return Expanded(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () => setState(() {
                              _period = index;
                              _report = _load();
                            }),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: _period == index ? const Color(0xFF1D1C19) : null,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                labels[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: _period == index
                                      ? Colors.white
                                      : theme.colorScheme.onSurface,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1D1C19),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(l.netProfit, style: const TextStyle(color: Colors.white70)),
                      const SizedBox(height: 4),
                      Text(
                        context.money(Money(profit.netProfitMinor)),
                        style: theme.textTheme.headlineMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFF33312F),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            ProfitLine(l.revenue, profit.revenueMinor),
                            ProfitLine(l.costOfGoods, -profit.cogsMinor),
                            ProfitLine(l.grossProfit, profit.grossProfitMinor),
                            ProfitLine(l.expenses, -profit.expensesMinor),
                            const Divider(color: Colors.white30),
                            ProfitLine(l.netProfit, profit.netProfitMinor, bold: true),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          l.weeklySales,
                          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 128,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: List.generate(7, (index) {
                              final maxValue = days.fold<int>(1, (a, b) => b > a ? b : a);
                              final barHeight = 12.0 + 82.0 * days[index] / maxValue;
                              final date = DateTime.now().subtract(Duration(days: 6 - index));
                              return Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: barHeight,
                                      margin: const EdgeInsets.symmetric(horizontal: 4),
                                      decoration: BoxDecoration(
                                        color: index == 6
                                            ? const Color(0xFFFF722E)
                                            : const Color(0xFFE1EFE7),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      DateFormat.E(
                                        Localizations.localeOf(context).languageCode,
                                      ).format(date).characters.first,
                                      style: theme.textTheme.labelSmall,
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: StatCard(
                        l.salesCountReport,
                        '${sales.salesCount}',
                        Icons.receipt_long_outlined,
                      ),
                    ),
                    Expanded(
                      child: StatCard(
                        l.outstandingDebt,
                        context.money(Money(debt)),
                        Icons.account_balance_wallet_outlined,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: StatCard(
                        l.returns,
                        context.money(Money(sales.returnsMinor)),
                        Icons.assignment_return_outlined,
                      ),
                    ),
                    Expanded(
                      child: StatCard(l.lowStockCount, '$lowStock', Icons.inventory_2_outlined),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
