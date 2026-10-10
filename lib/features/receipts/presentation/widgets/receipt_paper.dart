import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mahalli/core/money/money.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';
import 'package:mahalli/features/receipts/domain/models/receipt.dart';
import 'package:mahalli/features/receipts/presentation/widgets/total_row.dart';

class ReceiptPaper extends StatelessWidget {
  const ReceiptPaper({required this.receipt});
  final Receipt receipt;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final theme = Theme.of(context);
    final r = receipt;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE8E1D5)),
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: const Color(0xFF1C1B17),
            child: Column(
              children: [
                Text(
                  r.shopName.isEmpty ? l.appName : r.shopName,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 2),
                Text(l.receipt, style: const TextStyle(color: Color(0xFFD3D1C7), fontSize: 11)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text('${l.saleNumber}${r.number}', style: theme.textTheme.bodySmall),
                    ),
                    Text(
                      DateFormat.yMd(
                        Localizations.localeOf(context).languageCode,
                      ).add_jm().format(r.createdAt.toLocal()),
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
                if (r.customerName != null) ...[
                  const SizedBox(height: 4),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      '${l.customer}: ${r.customerName}',
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                ],
                const Divider(height: 22, color: Color(0xFFE8E1D5)),
                for (final line in r.lines)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            '${line.name} ×${Quantity(line.quantityMilli).format()}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.labelMedium,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          context.money(Money(line.totalMinor)),
                          style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                const Divider(height: 24, color: Color(0xFFE8E1D5)),
                TotalRow(l.total, context.money(Money(r.totalMinor)), bold: true),
                TotalRow(
                  l.paidAmount,
                  context.money(Money(r.paidMinor)),
                  color: const Color(0xFF0E7A55),
                ),
                if (r.remainingMinor > 0)
                  TotalRow(
                    l.remaining,
                    context.money(Money(r.remainingMinor)),
                    color: const Color(0xFFFF6B2C),
                  ),
                const SizedBox(height: 10),
                ExcludeSemantics(
                  child: SizedBox(
                    height: 26,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        34,
                        (i) => Container(
                          width: ((i + r.number) % 5 == 0) ? 3 : 1.5,
                          height: i.isEven ? 26 : 20,
                          margin: const EdgeInsets.symmetric(horizontal: 1.5),
                          color: const Color(0xFF1C1B17),
                        ),
                      ),
                    ),
                  ),
                ),
                Text('#${r.number}', style: theme.textTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
