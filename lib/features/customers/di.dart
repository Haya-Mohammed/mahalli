import 'package:get_it/get_it.dart';
import 'package:isar_community/isar.dart';
import 'package:mahalli/core/database/transaction_runner.dart';
import 'package:mahalli/features/customers/domain/usecases/record_adjustment.dart';
import 'package:mahalli/features/customers/domain/usecases/record_payment.dart';
import 'package:mahalli/features/customers/domain/usecases/save_customer.dart';
import 'package:mahalli/features/customers/presentation/cubits/customer_detail/customer_detail_cubit.dart';
import 'package:mahalli/features/customers/presentation/cubits/customer_form/customer_form_cubits.dart';
import 'package:mahalli/features/customers/presentation/cubits/customer_list/customer_list_cubit.dart';

import 'data/isar_customer_repository.dart';
import 'domain/repository/customer_repository.dart';

void registerCustomers(GetIt sl) {
  sl.registerLazySingleton<CustomerRepository>(
    () => IsarCustomerRepository(sl<Isar>(), sl<TransactionRunner>()),
  );
  sl.registerLazySingleton<SaveCustomer>(() => SaveCustomer(sl<CustomerRepository>()));
  sl.registerLazySingleton<RecordPayment>(() => RecordPayment(sl<CustomerRepository>()));
  sl.registerLazySingleton<RecordAdjustment>(() => RecordAdjustment(sl<CustomerRepository>()));
  sl.registerFactory<CustomerListCubit>(() => CustomerListCubit(sl<CustomerRepository>()));
  sl.registerFactory<CustomerDetailCubit>(
    () =>
        CustomerDetailCubit(sl<CustomerRepository>(), sl<RecordPayment>(), sl<RecordAdjustment>()),
  );
  sl.registerFactory<CustomerFormCubit>(() => CustomerFormCubit(sl<SaveCustomer>()));
}
