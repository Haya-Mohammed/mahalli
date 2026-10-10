import 'package:flutter/material.dart';
import 'package:mahalli/core/config/theme/colors.dart';
import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/core/money/money.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';
import 'package:mahalli/features/catalog/domain/models/catalog_item.dart';
import 'package:mahalli/features/sales/domain/models/cart_line.dart';
import 'package:mahalli/features/sales/presentation/widgets/step_button.dart';

class CatalogRow extends StatelessWidget {
  final CatalogItem item;
  final CartLine? line;
  final VoidCallback onAdd;
  final void Function(CartLine, int) onUpdate;

  const CatalogRow({
    required this.item,
    required this.line,
    required this.onAdd,
    required this.onUpdate,
  });

  Future<void> _editQuantity(BuildContext context) async {
    final current = line;
    if (current == null) return;
    final controller = TextEditingController(text: Quantity(current.quantityMilli).format());
    final milli = await showDialog<int>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(item.name),
        content: TextField(
          controller: controller,
          autofocus: true,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(labelText: dialogContext.l10n.quantity),
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
    if (milli != null && milli > 0) onUpdate(current, milli);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l = context.l10n;
    final isService = item.type == ItemType.service;
    final low = !isService && item.stockMilli <= item.lowStockThresholdMilli;
    final shortage = !isService && (line?.quantityMilli ?? 0) > item.stockMilli;
    final muted = theme.colorScheme.onSurfaceVariant;
    final background = theme.brightness == Brightness.dark
        ? AppDarkColors.background
        : const Color(0xFFF6F3ED);
    final border = theme.brightness == Brightness.dark
        ? AppDarkColors.border
        : const Color(0xFFE8E1D5);
    return Material(
      color: theme.colorScheme.surface,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onAdd,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: border),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: background,
                  border: Border.all(color: border),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  isService ? Icons.content_cut : Icons.inventory_2_outlined,
                  size: 23,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      isService
                          ? '${l.services} • ${l.salesNoStock}'
                          : '${l.unitLabel(item.unit)} • ${l.salesAvailable(Quantity(item.stockMilli).format())}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 11, color: muted),
                    ),
                    if (low) ...[
                      const SizedBox(height: 3),
                      Text(
                        shortage
                            ? l.lowStockSaleWarning
                            : item.stockMilli <= 0
                            ? l.stockOut
                            : l.stockLow,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: AppColors.dangerText,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    context.money(Money(item.sellingPrice)),
                    style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 4),
                  if (line == null)
                    TextButton(
                      onPressed: onAdd,
                      style: TextButton.styleFrom(
                        backgroundColor: theme.colorScheme.primaryContainer,
                        foregroundColor: theme.colorScheme.primary,
                        visualDensity: VisualDensity.compact,
                      ),
                      child: Text(
                        '${l.salesAdd} +',
                        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
                      ),
                    )
                  else
                    Container(
                      decoration: BoxDecoration(
                        color: background,
                        border: Border.all(color: border),
                        borderRadius: BorderRadius.circular(99),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          StepButton(
                            icon: line!.quantityMilli <= 1000 ? Icons.delete_outline : Icons.remove,
                            tooltip: l.discard,
                            onTap: () => onUpdate(line!, line!.quantityMilli - 1000),
                          ),
                          InkWell(
                            onTap: () => _editQuantity(context),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                              child: Text(
                                Quantity(line!.quantityMilli).format(),
                                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w800),
                              ),
                            ),
                          ),
                          StepButton(
                            icon: Icons.add,
                            tooltip: l.salesAdd,
                            onTap: onAdd,
                            primary: true,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
