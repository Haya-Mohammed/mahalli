import 'package:flutter/material.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l.aboutMahalli)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    Icons.storefront_outlined,
                    size: 52,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    l.appName,
                    textAlign: TextAlign.center,
                    style: Theme.of(
                      context,
                    ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
                  ),
                  Text('${l.appVersion} 1.0.0', textAlign: TextAlign.center),
                  const SizedBox(height: 18),
                  Text(l.offlineFirst),
                  const SizedBox(height: 8),
                  Text(l.privacyStatement),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: () => showLicensePage(
              context: context,
              applicationName: l.appName,
              applicationVersion: '1.0.0',
            ),
            icon: const Icon(Icons.description_outlined),
            label: Text(l.openSourceLicenses),
          ),
        ],
      ),
    );
  }
}
