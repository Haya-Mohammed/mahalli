import 'package:flutter/material.dart';
import 'package:mahalli/core/money/money.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';
import 'package:mahalli/features/stock/domain/models/stock_enums.dart';
import 'package:mahalli/features/stock/domain/models/stock_product.dart';

class StockProductCard extends StatelessWidget {
  const StockProductCard({required this.product, required this.onTap});
  final StockProduct product;
  final VoidCallback onTap;

  String _statusLabel(BuildContext context, StockStatus status) {
    final l = context.l10n;
    return switch (status) {
      StockStatus.healthy => l.stockHealthy,
      StockStatus.low => l.stockLow,
      StockStatus.out => l.stockOut,
      StockStatus.negative => l.stockNegative,
    };
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final status = product.status;
    final colors = Theme.of(context).colorScheme;
    final statusColor = switch (status) {
      StockStatus.healthy => colors.primary,
      StockStatus.low => colors.secondary,
      StockStatus.out || StockStatus.negative => colors.error,
    };
    return Material(
      color: colors.surface,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: colors.outline),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: colors.surfaceContainerHighest,
                  border: Border.all(color: colors.outline),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.inventory_2_outlined, size: 22),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      '${Quantity(product.quantityMilli).format()} ${l.unitLabel(product.unit)}',
                      style: TextStyle(fontSize: 11, color: colors.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (product.sellingPriceMinor > 0)
                    Text(
                      context.money(Money(product.sellingPriceMinor)),
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w800),
                    ),
                  if (status != StockStatus.healthy)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: statusColor.withValues(alpha: .12),
                        borderRadius: BorderRadius.circular(99),
                      ),
                      child: Text(
                        _statusLabel(context, status),
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: statusColor,
                        ),
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
