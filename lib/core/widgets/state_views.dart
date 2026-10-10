import 'package:flutter/material.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.hint,
    this.action,
  });
  final IconData icon;
  final String title;
  final String hint;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Card(
        margin: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: theme.colorScheme.primaryContainer,
                child: Icon(icon, size: 30, color: theme.colorScheme.primary),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
              ),
              if (action != null) ...[const SizedBox(height: 20), action!],
              const SizedBox(height: 8),
              Text(
                hint,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.outline,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ErrorView extends StatelessWidget {
  const ErrorView({super.key, required this.message, required this.onRetry});
  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) => Center(
    child: Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              size: 32,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 12),
            FilledButton.tonal(
              onPressed: onRetry,
              child: Text(context.l10n.retry),
            ),
          ],
        ),
      ),
    ),
  );
}
