import 'package:mahalli/core/config/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/core/money/money.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';
import 'package:mahalli/core/widgets/state_views.dart';
import 'package:mahalli/features/customers/domain/models/customer_details.dart';
import 'package:mahalli/features/customers/presentation/cubits/customer_detail/customer_detail_cubit.dart';
import 'package:mahalli/features/customers/presentation/cubits/customer_detail/customer_detail_state.dart';
import 'package:mahalli/features/customers/presentation/cubits/customer_list/customer_list_state.dart';
import 'package:mahalli/features/customers/presentation/widgets/debt_action_sheet.dart';

class CustomerDetailBody extends StatelessWidget {
  const CustomerDetailBody({required this.customerId});
  final int customerId;

  String _entryLabel(BuildContext context, DebtTxType type) {
    final l = context.l10n;
    return switch (type) {
      DebtTxType.saleCredit => l.ledgerSaleCredit,
      DebtTxType.payment => l.ledgerPayment,
      DebtTxType.returnCredit => l.ledgerReturn,
      DebtTxType.adjustment => l.ledgerAdjustment,
    };
  }

  Future<void> _openAction(BuildContext context, DebtAction action) async {
    final cubit = context.read<CustomerDetailCubit>();
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => BlocProvider.value(
        value: cubit,
        child: DebtActionSheet(action: action),
      ),
    );
  }

  Future<void> _edit(BuildContext context, CustomerDetails customer) async {
    final changed = await Navigator.of(
      context,
    ).pushNamed<bool>(AppRoutes.customerForm, arguments: customer);
    if (changed == true && context.mounted) {
      context.read<CustomerDetailCubit>().load(customer.id);
    }
  }

  Future<void> _toggle(BuildContext context, CustomerDetails customer) async {
    var allowDebt = false;
    if (customer.isActive && customer.balanceMinor != 0) {
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (dialogContext) => AlertDialog(
          title: Text(dialogContext.l10n.outstandingDebtWarning),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, false),
              child: Text(dialogContext.l10n.cancel),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(dialogContext, true),
              child: Text(dialogContext.l10n.deactivate),
            ),
          ],
        ),
      );
      if (confirmed != true || !context.mounted) return;
      allowDebt = true;
    }
    if (!context.mounted) return;
    final result = await context.read<CustomerDetailCubit>().setActive(
      !customer.isActive,
      allowOutstandingDebt: allowDebt,
    );
    if (result != CustomerActionResult.success && context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.l10n.genericError)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final cubit = context.read<CustomerDetailCubit>();
    final state = context.watch<CustomerDetailCubit>().state;
    final customer = state.customer;
    return Scaffold(
      appBar: AppBar(
        title: Text(customer?.name ?? l.customer),
        actions: [
          if (customer != null)
            IconButton(
              tooltip: l.edit,
              icon: const Icon(Icons.edit_outlined),
              onPressed: () => _edit(context, customer),
            ),
        ],
      ),
      body: customer == null
          ? state.status == CustomerLoadStatus.failure
                ? ErrorView(
                    message: l.genericError,
                    onRetry: () => cubit.load(customerId),
                  )
                : const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () => cubit.load(customerId),
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l.customerBalance,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            context.money(Money(customer.balanceMinor)),
                            style: Theme.of(context).textTheme.headlineLarge
                                ?.copyWith(
                                  color: customer.balanceMinor > 0
                                      ? Theme.of(context).colorScheme.error
                                      : null,
                                ),
                          ),
                          if (customer.phone != null) Text(customer.phone!),
                          if (customer.notes != null) Text(customer.notes!),
                          if (!customer.isActive) Text(l.inactive),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      FilledButton.icon(
                        onPressed: state.busy
                            ? null
                            : () => _openAction(context, DebtAction.payment),
                        icon: const Icon(Icons.payments_outlined),
                        label: Text(l.recordPayment),
                      ),
                      OutlinedButton.icon(
                        onPressed: state.busy
                            ? null
                            : () => _openAction(context, DebtAction.adjustment),
                        icon: const Icon(Icons.tune),
                        label: Text(l.recordAdjustment),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton(
                    onPressed: state.busy
                        ? null
                        : () => _toggle(context, customer),
                    child: Text(customer.isActive ? l.deactivate : l.activate),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    l.debtHistory,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  if (state.entries.isEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 32),
                      child: Text(l.noDebtHistory, textAlign: TextAlign.center),
                    ),
                  ...state.entries.map(
                    (entry) => Card(
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(_entryLabel(context, entry.type)),
                        subtitle: Text(
                          [
                            DateFormat.yMd(
                              Localizations.localeOf(context).languageCode,
                            ).add_jm().format(entry.createdAt),
                            if (entry.note != null) entry.note!,
                          ].join(' • '),
                        ),
                        trailing: Text(
                          '${entry.amountMinor > 0 ? '+' : ''}${context.money(Money(entry.amountMinor))}',
                        ),
                      ),
                    ),
                  ),
                  if (state.hasMore)
                    OutlinedButton(
                      onPressed: state.loadingMore ? null : cubit.loadMore,
                      child: Text(l.loadMore),
                    ),
                ],
              ),
            ),
    );
  }
}
