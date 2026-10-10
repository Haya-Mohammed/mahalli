import 'package:mahalli/features/customers/domain/models/customer_details.dart';
import 'package:mahalli/features/customers/domain/repository/customer_repository.dart';

class RecordPayment {
  const RecordPayment(this.repository);
  final CustomerRepository repository;
  Future<CustomerDetails> call(int customerId, int amountMinor, {String? note}) =>
      repository.recordPayment(customerId, amountMinor, note: note);
}
