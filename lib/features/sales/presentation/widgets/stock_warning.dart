import 'package:flutter/material.dart';
import 'package:mahalli/core/config/theme/colors.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';

class StockWarning extends StatelessWidget {
  const StockWarning({super.key});

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    margin: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: AppColors.warningBg,
      border: Border.all(color: AppColors.warningBorder.withValues(alpha: .4)),
      borderRadius: BorderRadius.circular(14),
    ),
    child: Row(
      children: [
        const Icon(Icons.warning_amber_rounded, color: AppColors.warningText, size: 19),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            context.l10n.lowStockSaleWarning,
            style: const TextStyle(fontSize: 12, color: AppColors.warningText),
          ),
        ),
      ],
    ),
  );
}
