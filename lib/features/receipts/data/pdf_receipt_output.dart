import 'dart:typed_data';

import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/intl.dart';
import 'package:mahalli/core/money/money.dart';
import 'package:mahalli/features/receipts/domain/models/receipt.dart';
import 'package:mahalli/features/receipts/domain/repository/receipt_output.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfReceiptOutput implements ReceiptOutput {
  const PdfReceiptOutput();

  static final _arabic = RegExp(r'[\u0600-\u06FF]');

  /// The default PDF font has no Arabic glyphs, so Arabic shop / item names
  /// printed as blanks. Bundle Amiri (see pubspec note) and use it everywhere.
  Future<(pw.Font?, pw.Font?)> _fonts() async {
    try {
      final regular = pw.Font.ttf(await rootBundle.load('assets/fonts/Amiri-Regular.ttf'));
      final bold = pw.Font.ttf(await rootBundle.load('assets/fonts/Amiri-Bold.ttf'));
      return (regular, bold);
    } catch (_) {
      return (null, null);
    }
  }

  Future<Uint8List> _pdf(Receipt r) async {
    final (regular, bold) = await _fonts();
    final rtl = _arabic.hasMatch(
      r.shopName + r.lines.map((l) => l.name).join() + (r.customerName ?? ''),
    );
    final labels = rtl
        ? (receipt: 'إيصال', total: 'الإجمالي', paid: 'المدفوع', due: 'المتبقي')
        : (receipt: 'Receipt', total: 'Total', paid: 'Paid', due: 'Remaining');
    final doc = pw.Document(
      theme: regular == null ? null : pw.ThemeData.withFont(base: regular, bold: bold ?? regular),
    );

    pw.Widget row(String a, String b, {bool strong = false}) => pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 2),
      child: pw.Row(
        children: [
          pw.Expanded(
            child: pw.Text(a, style: strong ? pw.TextStyle(fontWeight: pw.FontWeight.bold) : null),
          ),
          pw.Text(b, style: strong ? pw.TextStyle(fontWeight: pw.FontWeight.bold) : null),
        ],
      ),
    );

    final date = DateFormat('yyyy-MM-dd HH:mm').format(r.createdAt.toLocal());
    doc.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a5,
        margin: const pw.EdgeInsets.all(24),
        textDirection: rtl ? pw.TextDirection.rtl : pw.TextDirection.ltr,
        build: (_) => [
          if (r.shopName.isNotEmpty)
            pw.Center(
              child: pw.Text(
                r.shopName,
                style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
              ),
            ),
          pw.SizedBox(height: 4),
          pw.Center(child: pw.Text('${labels.receipt} #${r.number}  $date')),
          if (r.customerName != null) pw.Center(child: pw.Text(r.customerName!)),
          pw.Divider(),
          ...r.lines.map(
            (line) => row(
              '${line.name}  ×${Quantity(line.quantityMilli).format()}',
              Money(line.totalMinor).format(),
            ),
          ),
          pw.Divider(),
          row(labels.total, Money(r.totalMinor).format(), strong: true),
          row(labels.paid, Money(r.paidMinor).format()),
          if (r.remainingMinor > 0) row(labels.due, Money(r.remainingMinor).format()),
        ],
      ),
    );
    return doc.save();
  }

  @override
  Future<void> share(Receipt receipt) async =>
      Printing.sharePdf(bytes: await _pdf(receipt), filename: 'receipt-${receipt.number}.pdf');

  @override
  Future<void> print(Receipt receipt) async => Printing.layoutPdf(onLayout: (_) => _pdf(receipt));
}
