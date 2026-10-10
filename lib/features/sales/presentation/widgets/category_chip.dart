import 'package:flutter/material.dart';
import 'package:mahalli/core/config/theme/colors.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const CategoryChip({required this.label, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final border = theme.brightness == Brightness.dark
        ? AppDarkColors.border
        : const Color(0xFFE8E1D5);
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 8),
      child: Material(
        color: selected ? theme.colorScheme.onSurface : theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(99),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(99),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
            decoration: BoxDecoration(
              border: selected ? null : Border.all(color: border),
              borderRadius: BorderRadius.circular(99),
            ),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: selected ? theme.colorScheme.surface : theme.colorScheme.onSurface,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
