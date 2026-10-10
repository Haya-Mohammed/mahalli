import 'package:flutter_test/flutter_test.dart';
import 'package:mahalli/core/config/preferences/number_digits_storage_service.dart';
import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/core/money/number_digits.dart';
import 'package:mahalli/features/onboarding/domain/models/shop_model.dart';
import 'package:mahalli/features/onboarding/domain/repository/shop_repository.dart';
import 'package:mahalli/features/onboarding/domain/usecases/create_shop.dart';
import 'package:mahalli/features/onboarding/presentation/cubit/shop_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _ShopRepository implements ShopRepository {
  _ShopRepository(this.shop);
  ShopModel? shop;

  @override
  Future<ShopModel> createShop(ShopModel details) async {
    shop = details;
    return details;
  }

  @override
  Future<ShopModel?> getShop() async => shop;

  @override
  Future<ShopModel> updateShop(ShopModel details) async {
    shop = details;
    return details;
  }
}

void main() {
  test('number digit preference persists and formats Arabic-Indic digits', () async {
    SharedPreferences.setMockInitialValues({});
    final preferences = await SharedPreferences.getInstance();
    final storage = NumberDigitsStorageServiceImpl(preferences);

    expect(storage.getNumberDigits(), NumberDigits.western);
    await storage.saveNumberDigits(NumberDigits.arabicIndic);
    expect(storage.getNumberDigits(), NumberDigits.arabicIndic);
    expect(formatDigits('₪ 12.50', storage.getNumberDigits()), '₪ ١٢.٥٠');
  });

  test('shop settings update the persisted shop details', () async {
    final repository = _ShopRepository(
      const ShopModel(name: 'Old shop', businessType: BusinessType.grocery, currency: 'ILS'),
    );
    final cubit = ShopCubit(repository, CreateShop(repository));
    addTearDown(cubit.close);
    await cubit.load();

    final updated = await cubit.update('New shop', BusinessType.retail, 'JOD');

    expect(updated, isTrue);
    expect(repository.shop?.name, 'New shop');
    expect(repository.shop?.businessType, BusinessType.retail);
    expect(repository.shop?.currency, 'JOD');
  });
}
