import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mahalli/core/di/injection_container.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';
import 'package:mahalli/features/backup/domain/models/backup_info.dart';

import '../data/backup_service.dart';

class BackupPage extends StatefulWidget {
  const BackupPage({super.key});
  @override
  State<BackupPage> createState() => _BackupPageState();
}

class _BackupPageState extends State<BackupPage> {
  bool busy = false;
  Future<void> create() async {
    final l = context.l10n;
    setState(() => busy = true);
    try {
      final BackupInfo b = await sl<BackupService>().create();
      if (mounted) {
        showDialog(
          context: context,
          builder: (dialogContext) => AlertDialog(
            title: Text(l.backupCreated),
            content: Text(b.file.path),
            actions: [
              TextButton(
                onPressed: () async {
                  try {
                    await sl<BackupService>().share(b);
                  } catch (_) {
                    if (dialogContext.mounted) {
                      ScaffoldMessenger.of(
                        dialogContext,
                      ).showSnackBar(SnackBar(content: Text(l.genericError)));
                    }
                  }
                },
                child: Text(l.shareBackup),
              ),
              TextButton(onPressed: () => Navigator.pop(dialogContext), child: Text(l.ok)),
            ],
          ),
        );
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(context.l10n.backupFailed)));
      }
    } finally {
      if (mounted) {
        setState(() => busy = false);
      }
    }
  }

  Future<void> restore() async {
    final picked = await FilePicker.pickFiles(type: FileType.custom, allowedExtensions: ['zip']);
    if (picked.isEmpty) return;
    final path = picked.single.path;
    if (path == null) return;
    setState(() => busy = true);
    try {
      await sl<BackupService>().restore(File(path));
      if (mounted) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text(context.l10n.restoreComplete),
            content: Text(context.l10n.restartToFinishRestore),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context), child: Text(context.l10n.ok)),
            ],
          ),
        );
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(context.l10n.invalidBackup)));
      }
    } finally {
      if (mounted) {
        setState(() => busy = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(context.l10n.backupAndRestore)),
    body: ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                  child: Icon(Icons.shield_outlined, color: Theme.of(context).colorScheme.primary),
                ),
                const SizedBox(width: 12),
                Expanded(child: Text(context.l10n.backupWarning)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(Icons.backup_outlined, size: 34, color: Theme.of(context).colorScheme.primary),
                const SizedBox(height: 12),
                Text(
                  context.l10n.createBackup,
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 4),
                Text(context.l10n.backupSettingsHint),
                const SizedBox(height: 14),
                FilledButton.icon(
                  onPressed: busy ? null : create,
                  icon: const Icon(Icons.backup_outlined),
                  label: Text(busy ? '…' : context.l10n.createBackup),
                ),
              ],
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  Icons.settings_backup_restore_outlined,
                  size: 34,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 12),
                Text(
                  context.l10n.restoreBackup,
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 14),
                OutlinedButton.icon(
                  onPressed: busy ? null : restore,
                  icon: const Icon(Icons.restore),
                  label: Text(context.l10n.restoreBackup),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
