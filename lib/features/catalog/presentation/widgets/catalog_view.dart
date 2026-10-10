import 'package:mahalli/core/config/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/core/di/injection_container.dart';
import 'package:mahalli/core/money/money.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';
import 'package:mahalli/core/widgets/app_section_header.dart';
import 'package:mahalli/core/widgets/state_views.dart';
import 'package:mahalli/features/catalog/domain/models/catalog_item.dart';
import 'package:mahalli/features/catalog/presentation/cubit/catalog_state.dart';

import '../../domain/repository/catalog_repository.dart';
import '../cubit/catalog_cubit.dart';

class CatalogView extends StatelessWidget {
  const CatalogView({super.key, this.initialType = ItemType.product});
  final ItemType initialType;

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) {
      final cubit = sl<CatalogCubit>();
      if (initialType == ItemType.product) {
        cubit.load();
      } else {
        cubit.selectType(initialType);
      }
      return cubit;
    },
    child: const _CatalogBody(),
  );
}

class _CatalogBody extends StatefulWidget {
  const _CatalogBody();

  @override
  State<_CatalogBody> createState() => _CatalogBodyState();
}

class _CatalogBodyState extends State<_CatalogBody> {
  final _search = TextEditingController();

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  Future<void> _openForm({
    CatalogItem? item,
    String? barcode,
    ItemType? type,
  }) async {
    final selectedType =
        type ?? item?.type ?? context.read<CatalogCubit>().state.type;
    final changed = await Navigator.of(context).pushNamed<bool>(
      AppRoutes.catalogForm,
      arguments: CatalogFormArgs(
        selectedType,
        item: item,
        initialBarcode: barcode,
      ),
    );
    if (changed == true && mounted) context.read<CatalogCubit>().load();
  }

  Future<void> _scan() async {
    final barcode = await Navigator.of(
      context,
    ).pushNamed<String>(AppRoutes.barcodeScanner);
    if (!mounted || barcode == null) return;
    try {
      final item = await context.read<CatalogCubit>().lookupBarcode(barcode);
      if (!mounted) return;
      if (item != null) {
        await _openDetails(item);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.l10n.barcodeNotFound),
            action: SnackBarAction(
              label: context.l10n.addWithBarcode,
              onPressed: () =>
                  _openForm(barcode: barcode, type: ItemType.product),
            ),
          ),
        );
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(context.l10n.genericError)));
      }
    }
  }

  Future<void> _openDetails(CatalogItem item) async {
    await Navigator.of(
      context,
    ).pushNamed<void>(AppRoutes.catalogDetail, arguments: item);
    if (mounted) context.read<CatalogCubit>().load();
  }

  Future<void> _openStock() async {
    await Navigator.of(context).pushNamed<void>(AppRoutes.stock);
    if (mounted) context.read<CatalogCubit>().load();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final cubit = context.read<CatalogCubit>();
    final state = context.watch<CatalogCubit>().state;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openForm,
        icon: const Icon(Icons.add),
        label: Text(
          state.type == ItemType.product ? l.addProduct : l.addService,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: AppSectionHeader(
              title: l.tabInventory,
              subtitle: state.type == ItemType.product
                  ? l.products
                  : l.services,
              action: IconButton.filledTonal(
                tooltip: l.scanBarcode,
                onPressed: _scan,
                icon: const Icon(Icons.qr_code_scanner),
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.inventory_outlined),
              title: Text(l.stock),
              trailing: const Icon(Icons.chevron_right),
              onTap: _openStock,
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.category_outlined),
              title: Text(l.categories),
              trailing: const Icon(Icons.chevron_right),
              onTap: () =>
                  Navigator.of(context).pushNamed<void>(AppRoutes.categories),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: SegmentedButton<ItemType>(
              segments: [
                ButtonSegment(value: ItemType.product, label: Text(l.products)),
                ButtonSegment(value: ItemType.service, label: Text(l.services)),
              ],
              selected: {state.type},
              onSelectionChanged: (value) => cubit.selectType(value.first),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _search,
                    onChanged: cubit.search,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: l.searchCatalog,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SwitchListTile(
            title: Text(l.showInactive),
            value: state.includeInactive,
            onChanged: cubit.showInactive,
          ),
          Expanded(child: _results(context, state, cubit)),
        ],
      ),
    );
  }

  Widget _results(
    BuildContext context,
    CatalogState state,
    CatalogCubit cubit,
  ) {
    final l = context.l10n;
    if (state.status == CatalogStatus.loading && state.items.isEmpty) {
      return const _CatalogSkeleton();
    }
    if (state.status == CatalogStatus.failure && state.items.isEmpty) {
      return ErrorView(message: l.genericError, onRetry: cubit.load);
    }
    if (state.items.isEmpty) {
      return EmptyState(
        icon: state.type == ItemType.product
            ? Icons.inventory_2_outlined
            : Icons.design_services_outlined,
        title: state.type == ItemType.product ? l.noProducts : l.noServices,
        hint: state.type == ItemType.product
            ? l.noProductsHint
            : l.noServicesHint,
        action: FilledButton.icon(
          onPressed: _openForm,
          icon: const Icon(Icons.add),
          label: Text(
            state.type == ItemType.product ? l.addProduct : l.addService,
          ),
        ),
      );
    }
    return RefreshIndicator(
      onRefresh: cubit.load,
      child: ListView.builder(
        itemCount: state.items.length + (state.hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == state.items.length) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: OutlinedButton(
                onPressed: state.loadingMore ? null : cubit.loadMore,
                child: Text(state.loadingMore ? '…' : l.loadMore),
              ),
            );
          }
          final item = state.items[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                child: Icon(
                  item.type == ItemType.product
                      ? Icons.inventory_2_outlined
                      : Icons.design_services_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              title: Text(item.name),
              subtitle: Text(
                [
                  if (!item.isActive) l.inactive,
                  if (item.type == ItemType.product)
                    '${l.currentStock}: ${Quantity(item.stockMilli).format()} ${l.unitLabel(item.unit)}',
                ].join(' • '),
              ),
              trailing: Text(
                context.money(Money(item.sellingPrice)),
                style: const TextStyle(fontWeight: FontWeight.w800),
              ),
              onTap: () => _openDetails(item),
            ),
          );
        },
      ),
    );
  }
}

class _CatalogSkeleton extends StatelessWidget {
  const _CatalogSkeleton();

  @override
  Widget build(BuildContext context) => ListView.separated(
    padding: const EdgeInsets.all(16),
    itemCount: 5,
    separatorBuilder: (_, _) => const SizedBox(height: 10),
    itemBuilder: (_, _) => Container(
      height: 68,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  );
}

class CatalogDetailPage extends StatefulWidget {
  const CatalogDetailPage({super.key, required this.item});
  final CatalogItem item;

  @override
  State<CatalogDetailPage> createState() => _CatalogDetailPageState();
}

class _CatalogDetailPageState extends State<CatalogDetailPage> {
  late CatalogItem _item = widget.item;

  Future<void> _edit() async {
    final changed = await Navigator.of(context).pushNamed<bool>(
      AppRoutes.catalogForm,
      arguments: CatalogFormArgs(_item.type, item: _item),
    );
    if (changed != true || !mounted) return;
    final fresh = await sl<CatalogRepository>().get(_item.type, _item.id);
    if (fresh != null && mounted) setState(() => _item = fresh);
  }

  Future<void> _toggle() async {
    try {
      await sl<CatalogRepository>().setActive(
        _item.type,
        _item.id,
        !_item.isActive,
      );
      final fresh = await sl<CatalogRepository>().get(_item.type, _item.id);
      if (fresh != null && mounted) setState(() => _item = fresh);
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(context.l10n.genericError)));
      }
    }
  }

  Future<void> _manageStock() async {
    await Navigator.of(
      context,
    ).pushNamed<void>(AppRoutes.stockDetail, arguments: _item.id);
    if (!mounted) return;
    final fresh = await sl<CatalogRepository>().get(_item.type, _item.id);
    if (fresh != null && mounted) setState(() => _item = fresh);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l.catalogDetails)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFF1D1C19),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _item.name,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  context.money(Money(_item.sellingPrice)),
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Column(
              children: [
                ListTile(
                  title: Text(l.sellingPrice),
                  trailing: Text(context.money(Money(_item.sellingPrice))),
                ),
                if (_item.type == ItemType.product) ...[
                  ListTile(
                    title: Text(l.barcode),
                    trailing: Text(_item.barcode ?? l.none),
                  ),
                  ListTile(
                    title: Text(l.sku),
                    trailing: Text(_item.sku ?? l.none),
                  ),
                  ListTile(
                    title: Text(l.currentStock),
                    trailing: Text(Quantity(_item.stockMilli).format()),
                  ),
                ],
                ListTile(
                  title: Text(l.inactive),
                  trailing: Text(_item.isActive ? l.none : l.inactive),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          FilledButton(onPressed: _edit, child: Text(l.edit)),
          if (_item.type == ItemType.product)
            OutlinedButton(onPressed: _manageStock, child: Text(l.stock)),
          OutlinedButton(
            onPressed: _toggle,
            child: Text(_item.isActive ? l.deactivate : l.activate),
          ),
        ],
      ),
    );
  }
}
