import 'package:flutter/material.dart';

class StepButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;
  final bool primary;

  const StepButton({
    required this.icon,
    required this.tooltip,
    required this.onTap,
    this.primary = false,
  });
  @override
  Widget build(BuildContext context) => IconButton(
    tooltip: tooltip,
    onPressed: onTap,
    visualDensity: VisualDensity.compact,
    constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
    padding: EdgeInsets.zero,
    style: IconButton.styleFrom(
      backgroundColor: primary ? Theme.of(context).colorScheme.primary : null,
      foregroundColor: primary ? Colors.white : Theme.of(context).colorScheme.onSurface,
    ),
    icon: Icon(icon, size: 16),
  );
}
