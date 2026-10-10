import 'package:flutter/material.dart';
import 'package:mahalli/core/money/money.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';
import 'package:mahalli/features/sales/domain/models/cart_line.dart';

class CartLineTile extends StatelessWidget {
  final CartLine line;
  final void Function(CartLine, int) onUpdate;

  const CartLineTile({required this.line, required this.onUpdate});

  Future<void> _editQuantity(BuildContext context) async {
    final controller = TextEditingController(text: Quantity(line.quantityMilli).format());
    final milli = await showDialog<int>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(line.item.name),
        content: TextField(
          controller: controller,
          autofocus: true,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(labelText: dialogContext.l10n.stockQuantity),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(dialogContext.l10n.discard),
          ),
          FilledButton(
            onPressed: () =>
                Navigator.pop(dialogContext, Quantity.tryParse(controller.text)?.milli),
            child: Text(dialogContext.l10n.save),
          ),
        ],
      ),
    );
    controller.dispose();
    if (milli != null && milli > 0) onUpdate(line, milli);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final single = line.quantityMilli <= 1000;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  line.item.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleSmall,
                ),
                Text(context.money(Money(line.totalMinor)), style: theme.textTheme.bodySmall),
              ],
            ),
          ),
          IconButton(
            tooltip: single ? context.l10n.discard : null,
            onPressed: () => onUpdate(line, line.quantityMilli - 1000),
            icon: Icon(single ? Icons.delete_outline : Icons.remove),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () => _editQuantity(context),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 40),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  Quantity(line.quantityMilli).format(),
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleSmall,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () => onUpdate(line, line.quantityMilli + 1000),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
