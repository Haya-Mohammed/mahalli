import 'package:get_it/get_it.dart';
import 'package:isar_community/isar.dart';
import 'package:mahalli/core/database/transaction_runner.dart';
import 'package:mahalli/features/catalog/domain/repository/catalog_repository.dart';
import 'package:mahalli/features/customers/domain/repository/customer_repository.dart';
import 'package:mahalli/features/sales/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:mahalli/features/sales/presentation/cubits/checkout_cubit/checkout_cubit.dart';
import 'package:mahalli/features/sales/presentation/cubits/sales_history_cubit/sales_history_cubit.dart';
import 'package:mahalli/features/stock/domain/repositories/stock_repository.dart';

import 'data/isar_sales_repository.dart';
import 'domain/repositories/sales_repository.dart';

void registerSales(GetIt sl) {
  sl.registerLazySingleton<SalesRepository>(
    () => IsarSalesRepository(
      sl<Isar>(),
      sl<TransactionRunner>(),
      sl<CatalogRepository>(),
      sl<StockRepository>(),
      sl<CustomerRepository>(),
    ),
  );
  sl.registerFactory<CartCubit>(() => CartCubit(sl<SalesRepository>()));
  sl.registerFactory<CheckoutCubit>(() => CheckoutCubit(sl<SalesRepository>()));
  sl.registerFactory<SalesHistoryCubit>(() => SalesHistoryCubit(sl<SalesRepository>()));
}
