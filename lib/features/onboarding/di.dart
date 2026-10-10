import 'package:get_it/get_it.dart';
import 'package:isar_community/isar.dart';
import 'package:mahalli/features/onboarding/presentation/cubit/shop_cubit.dart';

import 'data/isar_shop_repository.dart';
import 'domain/repository/shop_repository.dart';
import 'domain/usecases/create_shop.dart';

void registerOnboarding(GetIt sl) {
  sl.registerLazySingleton<ShopRepository>(() => IsarShopRepository(sl<Isar>()));
  sl.registerLazySingleton<CreateShop>(() => CreateShop(sl<ShopRepository>()));
  sl.registerFactory<ShopCubit>(() => ShopCubit(sl<ShopRepository>(), sl<CreateShop>()));
}
