import 'package:mahalli/core/config/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/core/money/money.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';
import 'package:mahalli/core/widgets/state_views.dart';
import 'package:mahalli/features/customers/domain/models/customer_details.dart';
import 'package:mahalli/features/customers/presentation/cubits/customer_list/customer_list_cubit.dart';
import 'package:mahalli/features/customers/presentation/cubits/customer_list/customer_list_state.dart';

class CustomerListBody extends StatelessWidget {
  const CustomerListBody();

  Future<void> _openForm(BuildContext context) async {
    final changed = await Navigator.of(
      context,
    ).pushNamed<bool>(AppRoutes.customerForm);
    if (changed == true && context.mounted) {
      context.read<CustomerListCubit>().load();
    }
  }

  Future<void> _openCustomer(
    BuildContext context,
    CustomerDetails customer,
  ) async {
    await Navigator.of(
      context,
    ).pushNamed<void>(AppRoutes.customerDetail, arguments: customer.id);
    if (context.mounted) context.read<CustomerListCubit>().load();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final cubit = context.read<CustomerListCubit>();
    final state = context.watch<CustomerListCubit>().state;
    final customers = state.visible;
    return Scaffold(
      appBar: AppBar(
        title: Text(l.customers),
        actions: [
          IconButton(
            tooltip: l.debtsOverview,
            onPressed: () =>
                Navigator.of(context).pushNamed<void>(AppRoutes.debts),
            icon: const Icon(Icons.account_balance_wallet_outlined),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _openForm(context),
        icon: const Icon(Icons.person_add_alt_1),
        label: Text(l.addCustomer),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: l.searchCustomers,
              ),
              onChanged: cubit.search,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: SwitchListTile(
                  title: Text(l.showInactive),
                  value: state.showInactive,
                  onChanged: cubit.showInactive,
                ),
              ),
              PopupMenuButton<CustomerSort>(
                tooltip: state.sort == CustomerSort.name
                    ? l.sortByName
                    : l.sortByDebt,
                icon: const Icon(Icons.sort),
                onSelected: cubit.sortBy,
                itemBuilder: (_) => [
                  PopupMenuItem(
                    value: CustomerSort.name,
                    child: Text(l.sortByName),
                  ),
                  PopupMenuItem(
                    value: CustomerSort.debt,
                    child: Text(l.sortByDebt),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child:
                state.status == CustomerLoadStatus.loading &&
                    state.customers.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : state.status == CustomerLoadStatus.failure &&
                      state.customers.isEmpty
                ? ErrorView(message: l.genericError, onRetry: cubit.load)
                : customers.isEmpty
                ? EmptyState(
                    icon: Icons.people_outline,
                    title: l.noCustomers,
                    hint: l.noCustomersHint,
                  )
                : RefreshIndicator(
                    onRefresh: cubit.load,
                    child: ListView.builder(
                      itemCount: customers.length,
                      itemBuilder: (context, index) {
                        final customer = customers[index];
                        return Card(
                          child: ListTile(
                            leading: const CircleAvatar(
                              child: Icon(Icons.person_outline),
                            ),
                            title: Text(customer.name),
                            subtitle: Text(
                              [
                                if (customer.phone != null) customer.phone!,
                                if (!customer.isActive) l.inactive,
                              ].join(' • '),
                            ),
                            trailing: customer.balanceMinor > 0
                                ? Text(
                                    context.money(Money(customer.balanceMinor)),
                                    style: TextStyle(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.error,
                                    ),
                                  )
                                : null,
                            onTap: () => _openCustomer(context, customer),
                          ),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
