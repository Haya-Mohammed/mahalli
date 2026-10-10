import 'package:mahalli/core/config/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/core/di/injection_container.dart';
import 'package:mahalli/core/money/money.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';
import 'package:mahalli/core/widgets/state_views.dart';
import 'package:mahalli/features/customers/domain/models/customer_details.dart';
import 'package:mahalli/features/customers/domain/models/debt_page.dart';

import '../../domain/repository/customer_repository.dart';

class DebtsOverviewPage extends StatefulWidget {
  const DebtsOverviewPage({super.key});
  @override
  State<DebtsOverviewPage> createState() => _DebtsOverviewPageState();
}

class _DebtsOverviewPageState extends State<DebtsOverviewPage> {
  late Future<List<CustomerDetails>> _customers = sl<CustomerRepository>()
      .list();
  String _query = '';
  int? _expandedId;

  void _reload() => setState(() {
    _customers = sl<CustomerRepository>().list();
  });

  Future<void> _openCustomer(CustomerDetails customer) async {
    await Navigator.of(
      context,
    ).pushNamed<void>(AppRoutes.customerDetail, arguments: customer.id);
    if (mounted) _reload();
  }

  Future<void> _addCustomer() async {
    final changed = await Navigator.of(
      context,
    ).pushNamed<bool>(AppRoutes.customerForm);
    if (changed == true && mounted) _reload();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final color = Theme.of(context).colorScheme;
    final openedAsPage = Navigator.of(context).canPop();
    return Scaffold(
      appBar: openedAsPage
          ? AppBar(
              leading: const BackButton(),
              title: Text(l.customersAndDebts),
              actions: [
                IconButton(
                  tooltip: l.addCustomer,
                  onPressed: _addCustomer,
                  icon: const Icon(Icons.person_add_alt_1_outlined),
                ),
              ],
            )
          : null,
      body: FutureBuilder<List<CustomerDetails>>(
        future: _customers,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorView(message: l.genericError, onRetry: _reload);
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final customers = snapshot.data!;
          final owing = customers.where((c) => c.balanceMinor > 0).toList();
          final total = owing.fold<int>(0, (sum, c) => sum + c.balanceMinor);
          final visible = customers
              .where(
                (c) =>
                    c.name.toLowerCase().contains(_query) ||
                    (c.phone?.toLowerCase().contains(_query) ?? false),
              )
              .toList();
          return RefreshIndicator(
            onRefresh: () async {
              _reload();
              await _customers;
            },
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 28),
              children: [
                if (!openedAsPage)
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          l.customersAndDebts,
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.w800),
                        ),
                      ),
                      TextButton.icon(
                        onPressed: _addCustomer,
                        icon: const Icon(Icons.add, size: 18),
                        label: Text(l.addCustomer),
                      ),
                    ],
                  ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1D1C19),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l.debtTotal,
                              style: const TextStyle(color: Colors.white70),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              context.money(Money(total)),
                              style: Theme.of(context).textTheme.headlineMedium
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                  ),
                            ),
                            Text(
                              l.debtCustomerCount(owing.length),
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.account_balance_wallet_outlined,
                        color: Color(0xFFFF722E),
                        size: 34,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                TextField(
                  decoration: InputDecoration(
                    hintText: l.searchCustomers,
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: color.surface,
                  ),
                  onChanged: (value) =>
                      setState(() => _query = value.trim().toLowerCase()),
                ),
                const SizedBox(height: 18),
                Text(
                  l.allCustomers,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8),
                if (visible.isEmpty)
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      customers.isEmpty ? l.noCustomersHint : l.noCustomers,
                    ),
                  ),
                ...visible.map(
                  (customer) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Card(
                      margin: EdgeInsets.zero,
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () => setState(
                              () => _expandedId = _expandedId == customer.id
                                  ? null
                                  : customer.id,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(13),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: color.primaryContainer,
                                    child: Text(
                                      customer.name.isEmpty
                                          ? '?'
                                          : customer.name.characters.first,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          customer.name,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        if (customer.phone != null)
                                          Text(
                                            customer.phone!,
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodySmall,
                                          ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    context.money(Money(customer.balanceMinor)),
                                    style: TextStyle(
                                      color: customer.balanceMinor > 0
                                          ? color.error
                                          : color.primary,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Icon(
                                    _expandedId == customer.id
                                        ? Icons.expand_less
                                        : Icons.expand_more,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (_expandedId == customer.id) ...[
                            const Divider(height: 1),
                            FutureBuilder<DebtPage>(
                              future: sl<CustomerRepository>().ledger(
                                customer.id,
                                offset: 0,
                                limit: 4,
                              ),
                              builder: (context, ledger) {
                                if (ledger.hasError) {
                                  return Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Text(l.genericError),
                                  );
                                }
                                if (!ledger.hasData) {
                                  return const Padding(
                                    padding: EdgeInsets.all(16),
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                if (ledger.data!.entries.isEmpty) {
                                  return Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Text(l.noDebtHistory),
                                  );
                                }
                                return Column(
                                  children: ledger.data!.entries
                                      .map(
                                        (entry) => ListTile(
                                          dense: true,
                                          title: Text(switch (entry.type) {
                                            DebtTxType.saleCredit =>
                                              l.ledgerSaleCredit,
                                            DebtTxType.payment =>
                                              l.ledgerPayment,
                                            DebtTxType.returnCredit =>
                                              l.ledgerReturn,
                                            DebtTxType.adjustment =>
                                              l.ledgerAdjustment,
                                          }),
                                          subtitle: Text(
                                            DateFormat.yMd(
                                              Localizations.localeOf(
                                                context,
                                              ).languageCode,
                                            ).format(entry.createdAt),
                                          ),
                                          trailing: Text(
                                            '${entry.amountMinor > 0 ? '+' : ''}${context.money(Money(entry.amountMinor))}',
                                          ),
                                        ),
                                      )
                                      .toList(),
                                );
                              },
                            ),
                            TextButton.icon(
                              onPressed: () => _openCustomer(customer),
                              icon: const Icon(Icons.open_in_new, size: 18),
                              label: Text(l.debtHistory),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
