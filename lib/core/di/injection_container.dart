import 'package:get_it/get_it.dart';
import 'package:isar_community/isar.dart';
import 'package:logger/logger.dart';
import 'package:mahalli/core/database/isar_service.dart';
import 'package:mahalli/features/onboarding/di.dart';
import 'package:mahalli/features/home/di.dart';
import 'package:mahalli/features/categories/di.dart';
import 'package:mahalli/features/catalog/di.dart';
import 'package:mahalli/features/stock/di.dart';
import 'package:mahalli/features/customers/di.dart';
import 'package:mahalli/features/security/di.dart';
import 'package:mahalli/features/sales/di.dart';
import 'package:mahalli/features/returns/di.dart';
import 'package:mahalli/features/expenses/di.dart';
import 'package:mahalli/features/reports/di.dart';
import 'package:mahalli/features/receipts/di.dart';
import 'package:mahalli/features/backup/di.dart';
import 'package:mahalli/core/config/locale/locale_cubit.dart';
import 'package:mahalli/core/config/locale/locale_storage_service.dart';
import 'package:mahalli/core/config/theme/theme_cubit.dart';
import 'package:mahalli/core/config/theme/theme_storage_service.dart';
import 'package:mahalli/core/config/preferences/number_digits_cubit.dart';
import 'package:mahalli/core/config/preferences/number_digits_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../database/transaction_runner.dart';

final GetIt sl = GetIt.instance;

Future<void> initDependencies() async {
  sl.registerSingleton<Logger>(Logger());
  sl.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );
  sl.registerLazySingleton<LocaleStorageService>(
    () => LocaleStorageServiceImpl(sl()),
  );
  sl.registerFactory<LocaleCubit>(() => LocaleCubit(sl()));
  sl.registerLazySingleton<ThemeStorageService>(
    () => ThemeStorageServiceImpl(sl()),
  );
  sl.registerFactory<ThemeCubit>(() => ThemeCubit(sl()));
  sl.registerLazySingleton<NumberDigitsStorageService>(
    () => NumberDigitsStorageServiceImpl(sl()),
  );
  sl.registerFactory<NumberDigitsCubit>(() => NumberDigitsCubit(sl()));

  final db = await IsarService.open();
  sl.registerSingleton<IsarService>(db);
  sl.registerSingleton<Isar>(db.isar);
  sl.registerLazySingleton<TransactionRunner>(
    () => TransactionRunner(sl<Isar>()),
  );

  registerOnboarding(sl);
  registerSecurity(sl);
  registerHome(sl);
  registerCategories(sl);
  registerCatalog(sl);
  registerStock(sl);
  registerCustomers(sl);
  registerSales(sl);
  registerReturns(sl);
  registerExpenses(sl);
  registerReports(sl);
  registerReceipts(sl);
  registerBackup(sl);
}
