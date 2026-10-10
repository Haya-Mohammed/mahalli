import 'package:get_it/get_it.dart';
import 'package:isar_community/isar.dart';
import 'package:mahalli/core/database/transaction_runner.dart';
import 'package:mahalli/features/customers/domain/repository/customer_repository.dart';
import 'package:mahalli/features/stock/domain/repositories/stock_repository.dart';

import 'data/isar_returns_repository.dart';
import 'domain/repositories/returns_repository.dart';

void registerReturns(GetIt sl) => sl.registerLazySingleton<ReturnsRepository>(
  () => IsarReturnsRepository(
    sl<Isar>(),
    sl<TransactionRunner>(),
    sl<StockRepository>(),
    sl<CustomerRepository>(),
  ),
);
