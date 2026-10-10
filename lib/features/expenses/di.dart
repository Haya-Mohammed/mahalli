import 'package:get_it/get_it.dart';
import 'package:isar_community/isar.dart';
import 'package:mahalli/core/database/transaction_runner.dart';
import 'package:mahalli/features/expenses/domain/repository/expense_repository.dart';

import 'data/isar_expense_repository.dart';

void registerExpenses(GetIt sl) => sl.registerLazySingleton<ExpenseRepository>(
  () => IsarExpenseRepository(sl<Isar>(), sl<TransactionRunner>()),
);
