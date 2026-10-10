import 'package:flutter/material.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';

class LocalStatusPill extends StatelessWidget {
  const LocalStatusPill({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Semantics(
      label: context.l10n.workingLocally,
      child: Container(
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: colors.primaryContainer,
          border: Border.all(color: colors.primary.withValues(alpha: 0.35)),
          borderRadius: BorderRadius.circular(999),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.circle, size: 9, color: colors.primary),
            const SizedBox(width: 8),
            Text(
              context.l10n.workingLocally,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: colors.onPrimaryContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
