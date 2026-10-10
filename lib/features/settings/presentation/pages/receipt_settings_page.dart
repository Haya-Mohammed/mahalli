import 'package:flutter/material.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';

class ReceiptSettingsPage extends StatelessWidget {
  const ReceiptSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l.receiptSettings)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 23,
                    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                    child: Icon(Icons.print_outlined, color: Theme.of(context).colorScheme.primary),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    l.receiptSettings,
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 6),
                  Text(l.receiptSettingsHint),
                  const SizedBox(height: 10),
                  Text(l.printerSettingsUnavailable, style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
