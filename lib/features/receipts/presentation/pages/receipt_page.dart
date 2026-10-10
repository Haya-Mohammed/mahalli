import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mahalli/core/di/injection_container.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';
import 'package:mahalli/core/widgets/state_views.dart';
import 'package:mahalli/features/receipts/domain/models/receipt.dart';
import 'package:mahalli/features/receipts/domain/repository/receipt_output.dart';
import 'package:mahalli/features/receipts/presentation/widgets/receipt_paper.dart';

import '../../domain/repository/receipt_repository.dart';

class ReceiptPage extends StatefulWidget {
  const ReceiptPage({super.key, required this.saleId, this.onNewSale});
  final int saleId;
  final VoidCallback? onNewSale;

  @override
  State<ReceiptPage> createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  late Future<Receipt?> _future = sl<ReceiptRepository>().build(widget.saleId);
  bool _busy = false;

  void _retry() => setState(() {
    _future = sl<ReceiptRepository>().build(widget.saleId);
  });

  Future<void> _run(Future<void> Function() action) async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      await action();
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(context.l10n.genericError)));
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final theme = Theme.of(context);
    final side = ((MediaQuery.sizeOf(context).width - 560) / 2).clamp(0.0, double.infinity);
    return Scaffold(
      backgroundColor: const Color(0xFFF6F3ED),
      appBar: widget.onNewSale == null ? AppBar(title: Text(l.receipt)) : null,
      body: SafeArea(
        child: FutureBuilder<Receipt?>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }
            final r = snapshot.data;
            if (snapshot.hasError || r == null) {
              return ErrorView(message: l.genericError, onRetry: _retry);
            }
            return ListView(
              padding: EdgeInsets.fromLTRB(side + 16, 16, side + 16, 24),
              children: [
                Center(
                  child: Container(
                    width: 62,
                    height: 62,
                    decoration: const BoxDecoration(
                      color: Color(0xFF0E7A55),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.check, color: Colors.white, size: 32),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  l.saleSuccessTitle,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 2),
                Text(
                  '${l.saleNumber}${r.number} • ${DateFormat.yMd(Localizations.localeOf(context).languageCode).add_jm().format(r.createdAt.toLocal())} • ${l.receiptSavedLocal}',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodySmall,
                ),
                const SizedBox(height: 20),
                ReceiptPaper(receipt: r),
                const SizedBox(height: 16),
                Row(
                  children: [
                    if (widget.onNewSale != null) ...[
                      Expanded(
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            backgroundColor: const Color(0xFF1C1B17),
                            minimumSize: const Size.fromHeight(48),
                          ),
                          onPressed: widget.onNewSale,
                          child: Text('${l.newSale} +'),
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                    Expanded(
                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size.fromHeight(48),
                          backgroundColor: Colors.white,
                        ),
                        onPressed: _busy ? null : () => _run(() => sl<ReceiptOutput>().share(r)),
                        icon: const Icon(Icons.share_outlined, size: 18),
                        label: Text(l.share),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size.fromHeight(48),
                          backgroundColor: Colors.white,
                        ),
                        onPressed: _busy ? null : () => _run(() => sl<ReceiptOutput>().print(r)),
                        icon: const Icon(Icons.print_outlined, size: 18),
                        label: Text(l.print),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  l.receiptPrintOptional,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodySmall,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
