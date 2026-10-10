import 'package:flutter/material.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';
import 'package:mahalli/features/sales/domain/models/cart_line.dart';
import 'package:mahalli/features/sales/presentation/widgets/cart_line_tile.dart';

class CartLines extends StatelessWidget {
  final List<CartLine> lines;
  final void Function(CartLine, int) onUpdate;
  final bool expanded;

  const CartLines({required this.lines, required this.onUpdate, required this.expanded});

  @override
  Widget build(BuildContext context) {
    if (lines.isEmpty) {
      final text = Text(
        context.l10n.emptyCart,
        textAlign: TextAlign.center,
        style: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
      );
      return expanded
          ? Center(child: text)
          : Padding(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10), child: text);
    }
    return Material(
      color: Theme.of(context).colorScheme.surfaceContainerLow,
      child: ListView.separated(
        shrinkWrap: !expanded,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        itemCount: lines.length,
        separatorBuilder: (_, _) => const Divider(height: 1),
        itemBuilder: (_, i) => CartLineTile(line: lines[i], onUpdate: onUpdate),
      ),
    );
  }
}
