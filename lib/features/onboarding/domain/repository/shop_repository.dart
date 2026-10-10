import 'package:mahalli/features/onboarding/domain/models/shop_model.dart';

abstract class ShopRepository {
  Future<ShopModel?> getShop();
  Future<ShopModel> createShop(ShopModel details);
  Future<ShopModel> updateShop(ShopModel details);
}
