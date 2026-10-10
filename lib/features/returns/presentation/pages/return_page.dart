import 'package:flutter/material.dart';
import 'package:mahalli/core/di/injection_container.dart';
import 'package:mahalli/core/money/money.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';
import 'package:mahalli/core/widgets/state_views.dart';
import 'package:mahalli/features/returns/domain/models/return_line.dart';
import 'package:mahalli/features/returns/domain/models/returnable_item.dart';

import '../../domain/repositories/returns_repository.dart';

class ReturnPage extends StatefulWidget {
  const ReturnPage({super.key, required this.saleId});
  final int saleId;
  @override
  State<ReturnPage> createState() => _ReturnPageState();
}

class _ReturnPageState extends State<ReturnPage> {
  late Future<List<ReturnableItem>> _items = sl<ReturnsRepository>().returnableItems(widget.saleId);
  final _quantities = <int, int>{};
  bool _busy = false;
  Future<void> _submit(List<ReturnableItem> items) async {
    final lines = items
        .where((item) => (_quantities[item.saleItemId] ?? 0) > 0)
        .map((item) => ReturnLine(item: item, quantityMilli: _quantities[item.saleItemId]!))
        .toList();
    if (lines.isEmpty) {
      return;
    }
    setState(() => _busy = true);
    try {
      await sl<ReturnsRepository>().create(widget.saleId, lines);
      if (mounted) {
        Navigator.pop(context, true);
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(context.l10n.genericError)));
      }
    } finally {
      if (mounted) {
        setState(() => _busy = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(context.l10n.returnItems)),
    body: FutureBuilder<List<ReturnableItem>>(
      future: _items,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorView(
            message: context.l10n.genericError,
            onRetry: () =>
                setState(() => _items = sl<ReturnsRepository>().returnableItems(widget.saleId)),
          );
        }
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final items = snapshot.data!;
        if (items.isEmpty) {
          return EmptyState(
            icon: Icons.assignment_return_outlined,
            title: context.l10n.none,
            hint: context.l10n.returnItems,
          );
        }
        return Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: items.map((item) {
                  final amount = _quantities[item.saleItemId] ?? 0;
                  return Card(
                    child: ListTile(
                      title: Text(item.name),
                      subtitle: Text(
                        '${Quantity(amount).format()} / ${Quantity(item.remainingMilli).format()}',
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: amount <= 0
                                ? null
                                : () =>
                                      setState(() => _quantities[item.saleItemId] = amount - 1000),
                            icon: const Icon(Icons.remove),
                          ),
                          IconButton(
                            onPressed: amount >= item.remainingMilli
                                ? null
                                : () => setState(
                                    () => _quantities[item.saleItemId] = (amount + 1000).clamp(
                                      0,
                                      item.remainingMilli,
                                    ),
                                  ),
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: FilledButton(
                  onPressed: _busy ? null : () => _submit(items),
                  child: Text(context.l10n.confirmReturn),
                ),
              ),
            ),
          ],
        );
      },
    ),
  );
}
