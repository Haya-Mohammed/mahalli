import 'package:mahalli/core/database/collections/enums.dart';

class DebtEntry {
  const DebtEntry({
    required this.id,
    required this.customerId,
    required this.type,
    required this.amountMinor,
    required this.createdAt,
    this.note,
    this.saleId,
    this.returnId,
  });
  final int id;
  final int customerId;
  final DebtTxType type;
  final int amountMinor;
  final DateTime createdAt;
  final String? note;
  final int? saleId;
  final int? returnId;
}
