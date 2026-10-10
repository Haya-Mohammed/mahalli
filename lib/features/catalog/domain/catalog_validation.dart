import 'package:mahalli/core/error/failure.dart';
import 'package:mahalli/features/catalog/domain/models/product_input.dart';
import 'package:mahalli/features/catalog/domain/models/service_input.dart';

void validateProduct(ProductInput input) {
  if (input.name.trim().isEmpty || input.name.trim().length > 100) {
    throw const ValidationFailure('Product name required (up to 100 characters)');
  }
  if (input.sellingPrice <= 0 ||
      input.purchasePrice < 0 ||
      input.lowStockThresholdMilli < 0 ||
      input.openingStockMilli < 0) {
    throw const ValidationFailure('Invalid product amount or quantity');
  }
}

void validateService(ServiceInput input) {
  if (input.name.trim().isEmpty || input.name.trim().length > 100) {
    throw const ValidationFailure('Service name required (up to 100 characters)');
  }
  if (input.sellingPrice <= 0 || input.cost < 0) {
    throw const ValidationFailure('Invalid service price or cost');
  }
}
