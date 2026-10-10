import 'package:mahalli/core/config/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:mahalli/core/di/injection_container.dart';
import 'package:mahalli/core/helpers/formatter.dart';
import 'package:mahalli/core/helpers/sizes.dart';
import 'package:mahalli/core/money/money.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';
import 'package:mahalli/core/widgets/app_card.dart';
import 'package:mahalli/core/widgets/state_views.dart';
import 'package:mahalli/features/sales/domain/models/sale_summary.dart';
import 'package:mahalli/features/sales/domain/repositories/sales_repository.dart';

class SalesHistoryPage extends StatefulWidget {
  const SalesHistoryPage({super.key});
  @override
  State<SalesHistoryPage> createState() => _SalesHistoryPageState();
}

class _SalesHistoryPageState extends State<SalesHistoryPage> {
  static const _pageSize = 30;
  final List<SaleSummary> _sales = [];
  bool _loading = true;
  bool _loadingMore = false;
  bool _hasMore = false;
  bool _failed = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _failed = false;
    });
    try {
      final page = await sl<SalesRepository>().list(
        offset: 0,
        limit: _pageSize,
      );
      if (!mounted) return;
      setState(() {
        _sales
          ..clear()
          ..addAll(page.sales);
        _hasMore = page.hasMore;
        _loading = false;
      });
    } catch (_) {
      if (mounted) {
        setState(() {
          _failed = true;
          _loading = false;
        });
      }
    }
  }

  Future<void> _loadMore() async {
    if (_loadingMore) return;
    setState(() => _loadingMore = true);
    try {
      final page = await sl<SalesRepository>().list(
        offset: _sales.length,
        limit: _pageSize,
      );
      if (!mounted) return;
      setState(() {
        _sales.addAll(page.sales);
        _hasMore = page.hasMore;
      });
    } catch (_) {
      // Keep what we have; the button stays so the user can retry.
    } finally {
      if (mounted) setState(() => _loadingMore = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final theme = Theme.of(context);
    Widget body;
    if (_loading) {
      body = const Center(child: CircularProgressIndicator());
    } else if (_failed && _sales.isEmpty) {
      body = ErrorView(message: l.genericError, onRetry: _load);
    } else if (_sales.isEmpty) {
      body = Center(child: Text(l.noSales));
    } else {
      body = RefreshIndicator(
        onRefresh: _load,
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: AppSizes.pagePadding(context),
          itemCount: _sales.length + (_hasMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == _sales.length) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: OutlinedButton(
                  onPressed: _loadingMore ? null : _loadMore,
                  child: _loadingMore
                      ? const SizedBox.square(
                          dimension: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(l.loadMore),
                ),
              );
            }
            final sale = _sales[index];
            return AppCard(
              onTap: () => Navigator.of(
                context,
              ).pushNamed<void>(AppRoutes.saleDetail, arguments: sale.id),
              child: ListTile(
                title: Text('${l.saleNumber}${sale.saleNumber}'),
                subtitle: Text(AppFormatter.fmtDate(context, sale.createdAt)),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      context.money(Money(sale.totalAmount)),
                      style: theme.textTheme.titleSmall,
                    ),
                    if (sale.remainingAmount > 0)
                      Text(
                        '${l.remaining}: ${context.money(Money(sale.remainingAmount))}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.error,
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(l.saleHistory),
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 8),
            child: FilledButton.tonalIcon(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.add_shopping_cart_outlined),
              label: Text(l.newSale),
            ),
          ),
        ],
      ),
      body: body,
    );
  }
}
