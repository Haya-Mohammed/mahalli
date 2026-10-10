import 'package:mahalli/core/config/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/core/di/injection_container.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';
import 'package:mahalli/features/customers/presentation/pages/debts_overview_page.dart';
import 'package:mahalli/features/home/presentation/home_cubit.dart';
import 'package:mahalli/features/home/presentation/screens/home_screen.dart';
import 'package:mahalli/features/sales/presentation/pages/sales_page.dart';
import 'package:mahalli/features/shell/presentation/inventory_tab.dart';
import 'package:mahalli/features/shell/presentation/more_tab.dart';

/// Five-tab shell with the primary shop workflows always one tap away.
/// Bottom bar on phones, navigation rail on tablets / landscape.
class ShellPage extends StatefulWidget {
  const ShellPage({super.key});
  @override
  State<ShellPage> createState() => _ShellPageState();
}

class _ShellPageState extends State<ShellPage> {
  static const _wideBreakpoint = 840.0;
  static const _tabCount = 5;

  int _index = 0;
  int _inventoryVersion = 0;
  int _debtsVersion = 0;
  int _moreVersion = 0;
  int _salesRefresh = 0;

  /// Tabs are built lazily on first visit, then kept alive by IndexedStack so
  /// a half-finished sale, scroll position, search text etc. survive tab
  /// switches.
  final Set<int> _visited = {0};
  late final HomeCubit _homeCubit = sl<HomeCubit>()..load();

  @override
  void dispose() {
    _homeCubit.close();
    super.dispose();
  }

  void _selectTab(int index) {
    if (index == _index) {
      return;
    }
    setState(() {
      _index = index;
      _visited.add(index);
      // Tabs are kept alive, so refresh the data-driven ones when entered:
      // sales change stock (Inventory) and debts (Debts); new products must
      // appear in the Sales catalog. Sales keeps its cart (token, no rebuild).
      if (index == 1) _salesRefresh++;
      if (index == 2) _inventoryVersion++;
      if (index == 3) _debtsVersion++;
      if (index == 4) _moreVersion++;
    });
    if (index == 0) _homeCubit.load(refresh: true);
  }

  void _openCustomers() {
    Navigator.of(context).pushNamed<void>(AppRoutes.customers);
  }

  Future<void> _openCustomerForm() async {
    final changed = await Navigator.of(
      context,
    ).pushNamed<bool>(AppRoutes.customerForm);
    if (changed == true) _homeCubit.load(refresh: true);
  }

  Future<void> _openExpenseForm() async {
    final changed = await Navigator.of(
      context,
    ).pushNamed<bool>(AppRoutes.expenseForm);
    if (changed == true) _homeCubit.load(refresh: true);
  }

  void _openReports() =>
      Navigator.of(context).pushNamed<void>(AppRoutes.reports);

  void _openSalesHistory() =>
      Navigator.of(context).pushNamed<void>(AppRoutes.salesHistory);

  void _openSaleDetail(int saleId) => Navigator.of(
    context,
  ).pushNamed<void>(AppRoutes.saleDetail, arguments: saleId);

  Future<void> _openStock() async {
    await Navigator.of(context).pushNamed<void>(AppRoutes.stock);
    _homeCubit.load(refresh: true);
  }

  Future<void> _addProduct() async {
    final created = await Navigator.of(context).pushNamed<bool>(
      AppRoutes.catalogForm,
      arguments: CatalogFormArgs(ItemType.product),
    );
    if (!mounted || created != true) return;
    setState(() {
      _visited.add(2);
      _inventoryVersion++;
      _salesRefresh++;
      _index = 2;
    });
    _homeCubit.load(refresh: true);
  }

  Widget _buildTab(int i) {
    if (!_visited.contains(i)) return const SizedBox.shrink();
    switch (i) {
      case 0:
        return HomeScreen(
          onNewSale: () => _selectTab(1),
          onAddProduct: _addProduct,
          onReceivePayment: _openCustomers,
          onAddCustomer: _openCustomerForm,
          onAddExpense: _openExpenseForm,
          onViewDebts: () => _selectTab(3),
          onViewInventory: _openStock,
          onViewReports: _openReports,
          onViewSales: _openSalesHistory,
          onViewSale: _openSaleDetail,
        );
      case 1:
        return SalesPage(
          onOpenInventory: () => _selectTab(2),
          refreshToken: _salesRefresh,
        );
      case 2:
        return InventoryTab(key: ValueKey(_inventoryVersion));
      case 3:
        return DebtsOverviewPage(key: ValueKey(_debtsVersion));
      default:
        return MoreTab(key: ValueKey(_moreVersion));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final labels = [
      l.tabHome,
      l.tabSales,
      l.tabInventory,
      l.debtsOverview,
      l.tabMore,
    ];

    // Keeping every tab mounted (no AnimatedSwitcher keyed by index, which
    // used to rebuild the whole stack and throw away all tab state).
    final body = IndexedStack(
      index: _index,
      children: List.generate(_tabCount, _buildTab),
    );

    return BlocProvider<HomeCubit>.value(
      value: _homeCubit,
      // Back from any tab goes to Home first instead of closing the app.
      child: PopScope(
        canPop: _index == 0,
        onPopInvokedWithResult: (didPop, _) {
          if (!didPop) _selectTab(0);
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            final wide = constraints.maxWidth >= _wideBreakpoint;
            return Scaffold(
              body: SafeArea(
                bottom: false,
                child: wide
                    ? Row(
                        children: [
                          NavigationRail(
                            selectedIndex: _index,
                            onDestinationSelected: _selectTab,
                            labelType: NavigationRailLabelType.all,
                            destinations: [
                              NavigationRailDestination(
                                icon: const Icon(Icons.home_outlined),
                                selectedIcon: const Icon(Icons.home),
                                label: Text(labels[0]),
                              ),
                              NavigationRailDestination(
                                icon: const Icon(Icons.point_of_sale_outlined),
                                selectedIcon: const Icon(Icons.point_of_sale),
                                label: Text(labels[1]),
                              ),
                              NavigationRailDestination(
                                icon: const Icon(Icons.inventory_2_outlined),
                                selectedIcon: const Icon(Icons.inventory_2),
                                label: Text(labels[2]),
                              ),
                              NavigationRailDestination(
                                icon: const Icon(
                                  Icons.account_balance_wallet_outlined,
                                ),
                                selectedIcon: const Icon(
                                  Icons.account_balance_wallet,
                                ),
                                label: Text(labels[3]),
                              ),
                              NavigationRailDestination(
                                icon: const Icon(Icons.more_horiz),
                                label: Text(labels[4]),
                              ),
                            ],
                          ),
                          const VerticalDivider(width: 1),
                          Expanded(child: body),
                        ],
                      )
                    : body,
              ),
              bottomNavigationBar: wide
                  ? null
                  : NavigationBar(
                      selectedIndex: _index,
                      onDestinationSelected: _selectTab,
                      destinations: [
                        NavigationDestination(
                          icon: const Icon(Icons.home_outlined),
                          selectedIcon: const Icon(Icons.home),
                          label: labels[0],
                        ),
                        NavigationDestination(
                          icon: const Icon(Icons.point_of_sale_outlined),
                          selectedIcon: const Icon(Icons.point_of_sale),
                          label: labels[1],
                        ),
                        NavigationDestination(
                          icon: const Icon(Icons.inventory_2_outlined),
                          selectedIcon: const Icon(Icons.inventory_2),
                          label: labels[2],
                        ),
                        NavigationDestination(
                          icon: const Icon(
                            Icons.account_balance_wallet_outlined,
                          ),
                          selectedIcon: const Icon(
                            Icons.account_balance_wallet,
                          ),
                          label: labels[3],
                        ),
                        NavigationDestination(
                          icon: const Icon(Icons.more_horiz),
                          label: labels[4],
                        ),
                      ],
                    ),
            );
          },
        ),
      ),
    );
  }
}
