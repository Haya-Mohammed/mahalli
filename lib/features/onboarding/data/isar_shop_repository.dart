import 'package:isar_community/isar.dart';
import 'package:mahalli/core/database/collections/shop.dart';
import 'package:mahalli/core/error/failure.dart';
import 'package:mahalli/features/onboarding/domain/models/shop_model.dart';

import '../domain/repository/shop_repository.dart';

class IsarShopRepository implements ShopRepository {
  const IsarShopRepository(this.isar);
  final Isar isar;

  @override
  Future<ShopModel?> getShop() async {
    final shop = await isar.shops.where().findFirst();
    return shop == null
        ? null
        : ShopModel(name: shop.name, businessType: shop.businessType, currency: shop.currency);
  }

  @override
  Future<ShopModel> createShop(ShopModel details) async {
    try {
      await isar.writeTxn(() async {
        if (await isar.shops.where().findFirst() != null) {
          throw const ValidationFailure('Shop already configured');
        }
        final shop = Shop()
          ..id = 1
          ..name = details.name
          ..businessType = details.businessType
          ..currency = details.currency;
        await isar.shops.put(shop);
      });
      return details;
    } on Failure {
      rethrow;
    } catch (_) {
      throw const DatabaseFailure('Unable to save shop');
    }
  }

  @override
  Future<ShopModel> updateShop(ShopModel details) async {
    try {
      await isar.writeTxn(() async {
        final shop = await isar.shops.where().findFirst();
        if (shop == null) throw const NotFoundFailure('Shop not configured');
        shop
          ..name = details.name
          ..businessType = details.businessType
          ..currency = details.currency
          ..updatedAt = DateTime.now();
        await isar.shops.put(shop);
      });
      return details;
    } on Failure {
      rethrow;
    } catch (_) {
      throw const DatabaseFailure('Unable to update shop');
    }
  }
}
