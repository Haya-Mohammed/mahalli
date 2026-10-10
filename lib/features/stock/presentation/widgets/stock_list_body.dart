import 'package:mahalli/core/config/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';
import 'package:mahalli/core/widgets/state_views.dart';
import 'package:mahalli/features/stock/domain/models/stock_enums.dart';
import 'package:mahalli/features/stock/domain/models/stock_product.dart';
import 'package:mahalli/features/stock/presentation/cubits/stock_details/stock_details_state.dart';
import 'package:mahalli/features/stock/presentation/cubits/stock_list/stock_list_cubit.dart';
import 'package:mahalli/features/stock/presentation/widgets/stock_product_card.dart';

class StockListBody extends StatelessWidget {
  const StockListBody();

  Future<void> _openDetails(BuildContext context, StockProduct product) async {
    await Navigator.of(
      context,
    ).pushNamed<void>(AppRoutes.stockDetail, arguments: product.id);
    if (context.mounted) context.read<StockListCubit>().load();
  }

  Future<void> _addProduct(BuildContext context) async {
    final changed = await Navigator.of(context).pushNamed<bool>(
      AppRoutes.catalogForm,
      arguments: CatalogFormArgs(ItemType.product),
    );
    if (changed == true && context.mounted) {
      context.read<StockListCubit>().load();
    }
  }

  Future<void> _openCatalog(BuildContext context, ItemType type) async {
    await Navigator.of(
      context,
    ).pushNamed<void>(AppRoutes.catalog, arguments: type);
    if (context.mounted) context.read<StockListCubit>().load();
  }

  Future<void> _openCategories(BuildContext context) async {
    await Navigator.of(context).pushNamed<void>(AppRoutes.categories);
    if (context.mounted) context.read<StockListCubit>().load();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final colors = Theme.of(context).colorScheme;
    final dark = Theme.of(context).brightness == Brightness.dark;
    final cubit = context.read<StockListCubit>();
    final state = context.watch<StockListCubit>().state;
    final products = state.visibleProducts;
    final active = state.products.where((p) => p.isActive).toList();
    int count(StockFilter filter) => filter == StockFilter.all
        ? active.length
        : active.where((p) => matchesStockFilter(p, filter)).length;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 18, 16, 8),
            child: Row(
              children: [
                if (Navigator.of(context).canPop()) const BackButton(),
                Expanded(
                  child: Text(
                    l.tabInventory,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                PopupMenuButton<String>(
                  tooltip: l.tabMore,
                  onSelected: (value) {
                    if (value == 'services') {
                      _openCatalog(context, ItemType.service);
                    }
                    if (value == 'catalog') {
                      _openCatalog(context, ItemType.product);
                    }
                    if (value == 'categories') _openCategories(context);
                  },
                  itemBuilder: (_) => [
                    PopupMenuItem(value: 'catalog', child: Text(l.products)),
                    PopupMenuItem(value: 'services', child: Text(l.services)),
                    PopupMenuItem(
                      value: 'categories',
                      child: Text(l.categories),
                    ),
                  ],
                ),
                const SizedBox(width: 4),
                FilledButton(
                  onPressed: () => _addProduct(context),
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(0, 40),
                    backgroundColor: colors.primary,
                  ),
                  child: Text('${l.addProduct} +'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: l.searchCatalog,
                filled: true,
                fillColor: colors.surfaceContainerHighest,
              ),
              onChanged: cubit.search,
            ),
          ),
          SizedBox(
            height: 48,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: StockFilter.values.map((filter) {
                final label = switch (filter) {
                  StockFilter.all => l.stockAll,
                  StockFilter.low => l.stockLow,
                  StockFilter.out => l.stockOut,
                  StockFilter.negative => l.stockNegative,
                };
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ChoiceChip(
                    label: Text('$label ${count(filter)}'),
                    selected: state.filter == filter,
                    onSelected: (_) => cubit.filter(filter),
                    selectedColor: dark
                        ? colors.primaryContainer
                        : const Color(0xFF1C1B17),
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: state.filter == filter
                          ? (dark ? colors.onPrimaryContainer : Colors.white)
                          : colors.onSurface,
                    ),
                    backgroundColor: colors.surface,
                    side: BorderSide(color: colors.outline),
                  ),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 10, 16, 8),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    l.stock,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => _openCatalog(context, ItemType.product),
                  child: Text(l.categories),
                ),
              ],
            ),
          ),
          Expanded(
            child:
                state.status == StockLoadStatus.loading &&
                    state.products.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : state.status == StockLoadStatus.failure &&
                      state.products.isEmpty
                ? ErrorView(message: l.genericError, onRetry: cubit.load)
                : products.isEmpty
                ? EmptyState(
                    icon: Icons.inventory_2_outlined,
                    title: l.stockNoMatches,
                    hint: l.noProductsHint,
                  )
                : RefreshIndicator(
                    onRefresh: cubit.load,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: products.length + 1,
                      itemBuilder: (context, index) {
                        if (index == products.length) {
                          final low = active
                              .where(
                                (p) =>
                                    p.status == StockStatus.low ||
                                    p.status == StockStatus.out,
                              )
                              .toList();
                          if (low.isEmpty) return const SizedBox(height: 16);
                          return Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 20),
                            child: OutlinedButton.icon(
                              onPressed: () => _openDetails(context, low.first),
                              icon: const Icon(Icons.fact_check_outlined),
                              label: Text(
                                '${l.inventoryQuickCount} • ${low.first.name}',
                              ),
                            ),
                          );
                        }
                        final product = products[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: StockProductCard(
                            product: product,
                            onTap: () => _openDetails(context, product),
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
