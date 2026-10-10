import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/features/customers/domain/models/customer_details.dart';
import 'package:mahalli/features/customers/domain/models/customer_input.dart';
import 'package:mahalli/features/customers/domain/models/debt_page.dart';
import 'package:mahalli/features/customers/domain/models/debt_summary.dart';

abstract class CustomerRepository {
  Future<List<CustomerDetails>> list();
  Future<CustomerDetails?> get(int id);
  Future<bool> nameExists(String name, {int? excludingId});
  Future<CustomerDetails> save(CustomerInput input, {int? id});
  Future<void> setActive(int id, bool active, {bool allowOutstandingDebt = false});
  Future<DebtPage> ledger(int customerId, {required int offset, required int limit});
  Future<DebtSummary> debtSummary({int topCount = 10});
  Future<CustomerDetails> recordPayment(int customerId, int amountMinor, {String? note});
  Future<CustomerDetails> recordAdjustment(
    int customerId,
    int deltaMinor, {
    required String reason,
  });

  /// Called from the sale/return transaction. Caller owns the write transaction.
  Future<void> recordInTxn({
    required int customerId,
    required DebtTxType type,
    required int deltaMinor,
    int? saleId,
    int? returnId,
    String? note,
  });
}
