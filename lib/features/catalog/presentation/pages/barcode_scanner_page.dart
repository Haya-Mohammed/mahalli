import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({super.key});

  @override
  State<BarcodeScannerPage> createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  bool _handled = false;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(context.l10n.scanBarcode)),
    body: Stack(
      children: [
        MobileScanner(
          onDetect: (capture) {
            if (_handled || capture.barcodes.isEmpty) return;
            final value = capture.barcodes.first.rawValue?.trim();
            if (value == null || value.isEmpty) return;
            _handled = true;
            Navigator.of(context).pop(value);
          },
          errorBuilder: (context, error) => Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                error.errorCode == MobileScannerErrorCode.permissionDenied
                    ? context.l10n.cameraPermissionDenied
                    : context.l10n.genericError,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(16),
              color: Theme.of(context).colorScheme.surface,
              child: Text(context.l10n.scanHint),
            ),
          ),
        ),
      ],
    ),
  );
}
