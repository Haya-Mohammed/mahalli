import 'package:mahalli/core/error/failure.dart';
import 'package:mahalli/core/money/currency.dart';
import 'package:mahalli/features/onboarding/domain/models/shop_model.dart';

import '../repository/shop_repository.dart';

class CreateShop {
  const CreateShop(this.repository);
  final ShopRepository repository;

  Future<ShopModel> call(ShopModel details) {
    final name = details.name.trim();
    if (name.length < 2 || name.length > 60) {
      throw const ValidationFailure('Shop name must have 2 to 60 characters');
    }
    if (!CurrencyCatalog.isSupported(details.currency)) {
      throw const ValidationFailure('Unsupported currency');
    }
    return repository.createShop(
      ShopModel(name: name, businessType: details.businessType, currency: details.currency),
    );
  }
}
