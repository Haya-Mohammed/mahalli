import 'package:equatable/equatable.dart';

/// Domain-level error. Repositories throw Failures; cubits catch them.
sealed class Failure extends Equatable implements Exception {
  const Failure(this.message);
  final String message;
  @override
  List<Object?> get props => [message];
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(super.message);
}

class ValidationFailure extends Failure {
  const ValidationFailure(super.message);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure(super.message);
}

class InsufficientStockFailure extends Failure {
  const InsufficientStockFailure(super.message);
}

class OverpaymentFailure extends Failure {
  const OverpaymentFailure(super.message);
}

class OutstandingDebtFailure extends Failure {
  const OutstandingDebtFailure(super.message);
}

class DuplicateBarcodeFailure extends Failure {
  const DuplicateBarcodeFailure(String barcode)
    : super('Barcode already in use: $barcode');
}

class DuplicateNameFailure extends Failure {
  const DuplicateNameFailure(String name) : super('Name already in use: $name');
}

class BackupFailure extends Failure {
  const BackupFailure(super.message);
}

class StorageFailure extends Failure {
  const StorageFailure(super.message);
}
