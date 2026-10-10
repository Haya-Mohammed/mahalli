import 'package:mahalli/core/error/failure.dart';
import 'package:mahalli/features/customers/domain/models/customer_details.dart';
import 'package:mahalli/features/customers/domain/models/customer_input.dart';
import 'package:mahalli/features/customers/domain/repository/customer_repository.dart';

class SaveCustomer {
  const SaveCustomer(this.repository);
  final CustomerRepository repository;

  Future<CustomerDetails> call(CustomerInput input, {int? id}) {
    if (input.name.trim().isEmpty || input.name.trim().length > 100) {
      throw const ValidationFailure('Customer name required (up to 100 characters)');
    }
    if ((input.phone?.trim().length ?? 0) > 30) {
      throw const ValidationFailure('Phone number too long');
    }
    return repository.save(input, id: id);
  }
}
