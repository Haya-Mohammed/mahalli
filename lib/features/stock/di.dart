import 'package:get_it/get_it.dart';
import 'package:isar_community/isar.dart';
import 'package:mahalli/core/database/transaction_runner.dart';
import 'package:mahalli/features/stock/presentation/cubits/stock_details/stock_details_cubit.dart';
import 'package:mahalli/features/stock/presentation/cubits/stock_list/stock_list_cubit.dart';

import 'data/isar_stock_repository.dart';
import 'domain/repositories/stock_repository.dart';
import 'domain/usecases/stock_use_cases.dart';

void registerStock(GetIt sl) {
  sl.registerLazySingleton<StockRepository>(
    () => IsarStockRepository(sl<Isar>(), sl<TransactionRunner>()),
  );
  sl.registerLazySingleton<AddStock>(() => AddStock(sl<StockRepository>()));
  sl.registerLazySingleton<AdjustStock>(() => AdjustStock(sl<StockRepository>()));
  sl.registerLazySingleton<RecordDamage>(() => RecordDamage(sl<StockRepository>()));
  sl.registerLazySingleton<GetMovements>(() => GetMovements(sl<StockRepository>()));
  sl.registerFactory<StockListCubit>(() => StockListCubit(sl<StockRepository>()));
  sl.registerFactory<StockDetailCubit>(
    () => StockDetailCubit(
      sl<StockRepository>(),
      sl<AddStock>(),
      sl<AdjustStock>(),
      sl<RecordDamage>(),
    ),
  );
}
