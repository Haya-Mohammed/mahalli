import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:mahalli/features/security/data/pin_service.dart';
import 'package:mahalli/features/security/domain/repositories/pin_hasher.dart';
import 'package:mahalli/features/security/presentation/cubit/pin_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/secure_pin_store.dart';
import 'domain/repositories/pin_store.dart';

void registerSecurity(GetIt sl) {
  sl.registerLazySingleton<FlutterSecureStorage>(() => const FlutterSecureStorage());
  sl.registerLazySingleton<PinStore>(() => SecurePinStore(sl()));
  sl.registerLazySingleton<PinHasher>(() => PinHasher());
  sl.registerLazySingleton<PinService>(() => PinService(sl<PinStore>(), sl<PinHasher>()));
  sl.registerFactory<PinCubit>(() => PinCubit(sl<PinService>(), sl<SharedPreferences>()));
}
