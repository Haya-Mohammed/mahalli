import 'package:mahalli/features/receipts/domain/models/receipt.dart';

abstract class ReceiptOutput {
  Future<void> share(Receipt receipt);
  Future<void> print(Receipt receipt);
}
