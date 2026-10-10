import 'package:mahalli/features/receipts/domain/models/receipt.dart';

abstract class ReceiptRepository {
  Future<Receipt?> build(int saleId);
}
