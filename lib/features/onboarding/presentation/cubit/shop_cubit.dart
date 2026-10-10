import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/core/money/currency.dart';
import 'package:mahalli/features/onboarding/domain/models/shop_model.dart';
import 'package:mahalli/features/onboarding/domain/repository/shop_repository.dart';
import 'package:mahalli/features/onboarding/presentation/cubit/shop_state.dart';

import '../../domain/usecases/create_shop.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit(this.repository, this.createShop) : super(const ShopState());
  final ShopRepository repository;
  final CreateShop createShop;

  Future<void> load() async {
    emit(const ShopState());
    try {
      final shop = await repository.getShop();
      emit(ShopState(status: shop == null ? ShopStatus.missing : ShopStatus.ready, shop: shop));
    } catch (_) {
      emit(const ShopState(status: ShopStatus.failure));
    }
  }

  Future<bool> submit(String name, BusinessType type, String currency) async {
    if (state.submitting) return false;
    emit(const ShopState(status: ShopStatus.missing, submitting: true));
    try {
      final shop = await createShop(ShopModel(name: name, businessType: type, currency: currency));
      emit(ShopState(status: ShopStatus.ready, shop: shop));
      return true;
    } catch (_) {
      // Any error (not only Failure) must release the "submitting" lock.
      emit(const ShopState(status: ShopStatus.missing));
      return false;
    }
  }

  Future<bool> update(String name, BusinessType type, String currency) async {
    if (state.submitting) return false;
    final normalizedName = name.trim();
    if (normalizedName.length < 2 ||
        normalizedName.length > 60 ||
        !CurrencyCatalog.isSupported(currency)) {
      return false;
    }
    final current = state.shop;
    emit(ShopState(status: ShopStatus.ready, shop: current, submitting: true));
    try {
      final shop = await repository.updateShop(
        ShopModel(name: normalizedName, businessType: type, currency: currency),
      );
      emit(ShopState(status: ShopStatus.ready, shop: shop));
      return true;
    } catch (_) {
      emit(ShopState(status: ShopStatus.ready, shop: current));
      return false;
    }
  }
}
