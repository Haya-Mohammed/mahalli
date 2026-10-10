import 'package:mahalli/core/error/failure.dart';
import 'package:mahalli/features/customers/domain/models/customer_details.dart';
import 'package:mahalli/features/customers/domain/repository/customer_repository.dart';

class RecordAdjustment {
  const RecordAdjustment(this.repository);
  final CustomerRepository repository;
  Future<CustomerDetails> call(int customerId, int deltaMinor, {required String reason}) {
    if (reason.trim().isEmpty) {
      throw const ValidationFailure('Adjustment reason required');
    }
    return repository.recordAdjustment(customerId, deltaMinor, reason: reason.trim());
  }
}
