import 'package:mahalli/core/config/routes/routes.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/core/config/theme/colors.dart';
import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/core/di/injection_container.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';
import 'package:mahalli/core/widgets/state_views.dart';
import 'package:mahalli/features/catalog/domain/models/catalog_item.dart';
import 'package:mahalli/features/catalog/domain/repository/catalog_repository.dart';
import 'package:mahalli/features/categories/domain/models/category_Model.dart';
import 'package:mahalli/features/categories/domain/repository/category_repository.dart';
import 'package:mahalli/features/sales/domain/models/cart_line.dart';
import 'package:mahalli/features/sales/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:mahalli/features/sales/presentation/cubits/cart_cubit/cart_state.dart';
import 'package:mahalli/features/sales/presentation/widgets/cart_lines.dart';
import 'package:mahalli/features/sales/presentation/widgets/catalog_row.dart';
import 'package:mahalli/features/sales/presentation/widgets/checkout_bar.dart';
import 'package:mahalli/features/sales/presentation/widgets/sales_header.dart';
import 'package:mahalli/features/sales/presentation/widgets/stock_warning.dart';

const _wideBreakpoint = 840.0;

class SalesBody extends StatefulWidget {
  final VoidCallback onOpenInventory;
  final int refreshToken;

  const SalesBody({required this.onOpenInventory, required this.refreshToken});

  @override
  State<SalesBody> createState() => _SalesBodyState();
}

class _SalesBodyState extends State<SalesBody> {
  final _search = TextEditingController();
  final _searchFocus = FocusNode();
  List<CatalogItem> _items = const [];
  List<CategoryModel> _categories = const [];
  int? _selectedCategory;
  bool _loadingCatalog = true;
  bool _catalogFailed = false;
  int _catalogRequest = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _recoverDraft());
    _loadCatalog();
  }

  @override
  void didUpdateWidget(covariant SalesBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.refreshToken != widget.refreshToken) {
      // Refresh prices and stock after visiting other tabs.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _search.clear();
        _loadCatalog();
      });
    }
  }

  Future<List<CatalogItem>> _loadType(ItemType type) async {
    final repository = sl<CatalogRepository>();
    final items = <CatalogItem>[];
    var offset = 0;
    while (true) {
      final page = await repository.search(
        type: type,
        query: '',
        includeInactive: false,
        offset: offset,
        limit: 100,
      );
      items.addAll(page.items);
      if (!page.hasMore) return items;
      offset += page.items.length;
    }
  }

  Future<void> _loadCatalog() async {
    final ticket = ++_catalogRequest;
    setState(() {
      _loadingCatalog = true;
      _catalogFailed = false;
    });
    final loaded = <CatalogItem>[];
    var failed = false;
    for (final type in ItemType.values) {
      try {
        loaded.addAll(await _loadType(type));
      } catch (error, stackTrace) {
        failed = true;
        debugPrint(
          'Sales catalog ${type.name} load failed: $error\n$stackTrace',
        );
      }
    }
    try {
      List<CategoryModel> categories;
      try {
        categories = await sl<CategoryRepository>().list();
      } catch (_) {
        categories = const [];
      }
      if (!mounted || ticket != _catalogRequest) return;
      setState(() {
        _items = loaded..sort((a, b) => a.name.compareTo(b.name));
        _categories = categories.where((c) => c.isActive).toList();
        _loadingCatalog = false;
        _catalogFailed = failed;
      });
    } catch (error, stackTrace) {
      debugPrint('Sales catalog categories load failed: $error\n$stackTrace');
      if (!mounted || ticket != _catalogRequest) return;
      setState(() {
        _loadingCatalog = false;
        _catalogFailed = failed;
        _items = loaded;
      });
    }
  }

  List<CatalogItem> get _visibleItems {
    final query = _search.text.trim().toLowerCase();
    return _items.where((item) {
      if (_selectedCategory != null && item.categoryId != _selectedCategory) {
        return false;
      }
      if (query.isEmpty) return true;
      return item.name.toLowerCase().contains(query) ||
          (item.barcode?.toLowerCase().contains(query) ?? false) ||
          (item.sku?.toLowerCase().contains(query) ?? false);
    }).toList();
  }

  Future<void> _scanBarcode() async {
    final barcode = await Navigator.of(
      context,
    ).pushNamed<String>(AppRoutes.barcodeScanner);
    if (!mounted || barcode == null) return;
    try {
      final item = await sl<CatalogRepository>().getByBarcode(barcode);
      if (!mounted) return;
      if (item == null || !item.isActive) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(context.l10n.barcodeNotFound)));
      } else {
        context.read<CartCubit>().add(item);
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(context.l10n.genericError)));
      }
    }
  }

  Future<void> _recoverDraft() async {
    if (!mounted) return;
    final cart = context.read<CartCubit>();
    final draft = await cart.loadDraft();
    if (!mounted || draft == null || draft.lines.isEmpty) return;
    final restore = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => AlertDialog(
        title: Text(dialogContext.l10n.restoreDraft),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(dialogContext.l10n.discard),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: Text(dialogContext.l10n.restore),
          ),
        ],
      ),
    );
    if (restore == true) {
      cart.restore(draft);
    } else {
      await cart.discardDraft();
    }
  }

  void _persistDraft(CartState state) {
    final cart = context.read<CartCubit>();
    final Future<void> write = state.lines.isEmpty
        ? cart.discardDraft()
        : cart.saveDraft();
    unawaited(write.catchError((_) {}));
  }

  Future<void> _checkout() async {
    final cart = context.read<CartCubit>();
    final saleId = await Navigator.of(
      context,
    ).pushNamed<int>(AppRoutes.checkout, arguments: CheckoutArgs(cart));
    if (saleId == null || !mounted) return;
    cart.clear();
    // Show the receipt right away instead of dropping the user back on an
    // empty cart with no confirmation.
    await Navigator.of(context).pushNamed<void>(
      AppRoutes.receipt,
      arguments: ReceiptArgs(
        saleId,
        onNewSale: () =>
            Navigator.of(context).popUntil((route) => route.isFirst),
      ),
    );
    if (mounted) _loadCatalog();
  }

  @override
  void dispose() {
    _search.dispose();
    _searchFocus.dispose();
    super.dispose();
  }

  Widget _catalogPane(BuildContext context, List<CatalogItem> items) {
    final l = context.l10n;
    return Column(
      children: [
        SalesHeader(
          search: _search,
          searchFocus: _searchFocus,
          categories: _categories,
          selectedCategory: _selectedCategory,
          onSearch: () => setState(() {}),
          onCategory: (id) => setState(() => _selectedCategory = id),
          onScan: _scanBarcode,
        ),
        Expanded(
          child: _loadingCatalog && _items.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : _catalogFailed && _items.isEmpty
              ? ErrorView(message: l.genericError, onRetry: _loadCatalog)
              : items.isEmpty
              ? EmptyState(
                  icon: Icons.search_off,
                  title: _search.text.isNotEmpty || _selectedCategory != null
                      ? l.stockNoMatches
                      : l.noProducts,
                  hint: l.searchCatalog,
                  action: _items.isEmpty
                      ? OutlinedButton.icon(
                          onPressed: widget.onOpenInventory,
                          icon: const Icon(Icons.inventory_2_outlined),
                          label: Text(l.tabInventory),
                        )
                      : null,
                )
              : ListView.builder(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 20),
                  itemCount: items.length,
                  itemBuilder: (_, index) {
                    final item = items[index];
                    CartLine? line;
                    for (final candidate
                        in context.read<CartCubit>().state.lines) {
                      if (candidate.item.id == item.id &&
                          candidate.item.type == item.type) {
                        line = candidate;
                        break;
                      }
                    }
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: CatalogRow(
                        item: item,
                        line: line,
                        onAdd: () => context.read<CartCubit>().add(item),
                        onUpdate: context.read<CartCubit>().update,
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartCubit>().state;
    final cartCubit = context.read<CartCubit>();

    return BlocListener<CartCubit, CartState>(
      listener: (_, state) => _persistDraft(state),
      child: ColoredBox(
        color: Theme.of(context).brightness == Brightness.dark
            ? AppDarkColors.background
            : const Color(0xFFF6F3ED),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final pane = _catalogPane(context, _visibleItems);
            final bar = CheckoutBar(
              cart: cart,
              onPressed: _checkout,
              onClear: cartCubit.clear,
            );

            // Tablet / landscape: catalog on one side, cart on the other.
            if (constraints.maxWidth >= _wideBreakpoint) {
              return Row(
                children: [
                  Expanded(child: pane),
                  const VerticalDivider(width: 1),
                  SizedBox(
                    width: 380,
                    child: Column(
                      children: [
                        Expanded(
                          child: CartLines(
                            lines: cart.lines,
                            onUpdate: cartCubit.update,
                            expanded: true,
                          ),
                        ),
                        bar,
                      ],
                    ),
                  ),
                ],
              );
            }

            return Column(
              children: [
                Expanded(child: pane),
                if (_stockWarning(cart.lines)) const StockWarning(),
                bar,
              ],
            );
          },
        ),
      ),
    );
  }
}

bool _stockWarning(List<CartLine> lines) => lines.any(
  (line) =>
      line.item.type == ItemType.product &&
      line.quantityMilli > line.item.stockMilli,
);
