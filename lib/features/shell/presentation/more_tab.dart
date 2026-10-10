import 'package:mahalli/core/config/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mahalli/core/di/injection_container.dart';
import 'package:mahalli/core/money/money.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';
import 'package:mahalli/features/customers/domain/models/customer_details.dart';
import 'package:mahalli/features/customers/domain/repository/customer_repository.dart';
import 'package:mahalli/features/expenses/domain/models/expense_category_model.dart';
import 'package:mahalli/features/expenses/domain/models/expense_model.dart';
import 'package:mahalli/features/expenses/domain/repository/expense_repository.dart';

typedef _MoreData = (
  List<CustomerDetails>,
  List<ExpenseModel>,
  List<ExpenseCategoryModel>,
);

class MoreTab extends StatefulWidget {
  const MoreTab({super.key});
  @override
  State<MoreTab> createState() => _MoreTabState();
}

class _MoreTabState extends State<MoreTab> {
  late Future<_MoreData> _data = _load();

  Future<_MoreData> _load() async {
    final now = DateTime.now();
    final from = DateTime(now.year, now.month, 1);
    final results = await Future.wait<dynamic>([
      sl<CustomerRepository>().list(),
      sl<ExpenseRepository>().list(from, now),
      sl<ExpenseRepository>().categories(includeInactive: true),
    ]);
    return (
      results[0] as List<CustomerDetails>,
      results[1] as List<ExpenseModel>,
      results[2] as List<ExpenseCategoryModel>,
    );
  }

  void _reload() => setState(() {
    _data = _load();
  });

  Future<void> _open(String route) async {
    await Navigator.of(context).pushNamed<void>(route);
    if (mounted) _reload();
  }

  Future<void> _addExpense() async {
    final changed = await Navigator.of(
      context,
    ).pushNamed<bool>(AppRoutes.expenseForm);
    if (changed == true && mounted) _reload();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final theme = Theme.of(context);
    final sidePad = ((MediaQuery.sizeOf(context).width - 640) / 2).clamp(
      0.0,
      double.infinity,
    );
    return FutureBuilder<_MoreData>(
      future: _data,
      builder: (context, snapshot) {
        final customers = snapshot.data?.$1 ?? const <CustomerDetails>[];
        final entries = snapshot.data?.$2 ?? const <ExpenseModel>[];
        final categories = snapshot.data?.$3 ?? const <ExpenseCategoryModel>[];
        final now = DateTime.now();
        final today = entries.where(
          (e) =>
              e.date.year == now.year &&
              e.date.month == now.month &&
              e.date.day == now.day,
        );
        final todayTotal = today.fold<int>(0, (sum, e) => sum + e.amountMinor);
        final debtTotal = customers
            .where((c) => c.balanceMinor > 0)
            .fold<int>(0, (sum, c) => sum + c.balanceMinor);
        final recent = entries.toList()
          ..sort((a, b) => b.date.compareTo(a.date));
        final names = {
          for (final category in categories) category.id: category.name,
        };
        return RefreshIndicator(
          onRefresh: () async {
            _reload();
            await _data;
          },
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: sidePad + 16,
              vertical: 18,
            ),
            children: [
              Text(
                l.tabMore,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _MoreTile(
                      Icons.people_outline,
                      l.customers,
                      '${customers.length}',
                      () => _open(AppRoutes.debts),
                    ),
                  ),
                  Expanded(
                    child: _MoreTile(
                      Icons.account_balance_wallet_outlined,
                      l.debtsOverview,
                      context.money(Money(debtTotal)),
                      () => _open(AppRoutes.debts),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: _MoreTile(
                      Icons.bar_chart_outlined,
                      l.reports,
                      l.netProfit,
                      () => _open(AppRoutes.reports),
                    ),
                  ),
                  Expanded(
                    child: _MoreTile(
                      Icons.receipt_long_outlined,
                      l.expenses,
                      context.money(Money(todayTotal)),
                      () => _open(AppRoutes.expenses),
                      highlighted: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      l.todayExpenses,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Text(
                    context.money(Money(todayTotal)),
                    style: TextStyle(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(width: 8),
                  FilledButton.tonalIcon(
                    onPressed: _addExpense,
                    icon: const Icon(Icons.add, size: 18),
                    label: Text(l.addExpense),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  child: snapshot.hasError
                      ? ListTile(
                          title: Text(l.genericError),
                          trailing: IconButton(
                            onPressed: _reload,
                            icon: const Icon(Icons.refresh),
                          ),
                        )
                      : snapshot.connectionState != ConnectionState.done
                      ? const Padding(
                          padding: EdgeInsets.all(20),
                          child: Center(child: CircularProgressIndicator()),
                        )
                      : recent.isEmpty
                      ? ListTile(
                          title: Text(l.none),
                          leading: const Icon(Icons.receipt_long_outlined),
                        )
                      : Column(
                          children: recent
                              .take(3)
                              .map(
                                (entry) => Column(
                                  children: [
                                    ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      leading: CircleAvatar(
                                        backgroundColor:
                                            theme.colorScheme.primaryContainer,
                                        child: Icon(
                                          Icons.receipt_long_outlined,
                                          color: theme.colorScheme.primary,
                                          size: 20,
                                        ),
                                      ),
                                      title: Text(
                                        entry.description?.trim().isNotEmpty ==
                                                true
                                            ? entry.description!
                                            : names[entry.categoryId] ??
                                                  l.expenses,
                                      ),
                                      subtitle: Text(
                                        '${names[entry.categoryId] ?? l.expenses} • ${DateFormat.yMd(Localizations.localeOf(context).languageCode).format(entry.date)}',
                                      ),
                                      trailing: Text(
                                        context.money(Money(entry.amountMinor)),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      onTap: () => _open(AppRoutes.expenses),
                                    ),
                                    if (entry != recent.take(3).last)
                                      const Divider(height: 1),
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                ),
              ),
              const SizedBox(height: 10),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.assignment_return_outlined),
                      title: Text(l.returns),
                      subtitle: Text(l.saleHistory),
                      trailing: const Icon(Icons.chevron_left),
                      onTap: () => _open(AppRoutes.salesHistory),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.backup_outlined),
                      title: Text(l.backupAndRestore),
                      subtitle: Text(l.backupSettingsHint),
                      trailing: const Icon(Icons.chevron_left),
                      onTap: () => _open(AppRoutes.backup),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.inventory_2_outlined),
                      title: Text(l.stockHistory),
                      trailing: const Icon(Icons.chevron_left),
                      onTap: () => _open(AppRoutes.stock),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.print_outlined),
                      title: Text(l.receiptSettings),
                      trailing: const Icon(Icons.chevron_left),
                      onTap: () => _open(AppRoutes.receiptSettings),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.settings_outlined),
                      title: Text(l.settings),
                      trailing: const Icon(Icons.chevron_left),
                      onTap: () => _open(AppRoutes.settings),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _MoreTile extends StatelessWidget {
  const _MoreTile(
    this.icon,
    this.title,
    this.subtitle,
    this.onTap, {
    this.highlighted = false,
  });
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Card(
      color: highlighted ? color.primary : null,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: highlighted
                    ? Colors.white24
                    : color.primaryContainer,
                child: Icon(
                  icon,
                  color: highlighted ? Colors.white : color.primary,
                  size: 20,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: highlighted ? Colors.white : color.onSurface,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: highlighted
                            ? Colors.white70
                            : color.onSurfaceVariant,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
