import 'package:mahalli/features/expenses/domain/models/expense_category_model.dart';
import 'package:mahalli/features/expenses/domain/models/expense_model.dart';

abstract class ExpenseRepository {
  Future<List<ExpenseModel>> list(DateTime from, DateTime to);
  Future<int> total(DateTime from, DateTime to);
  Future<ExpenseModel> save(ExpenseModel entry);

  Future<List<ExpenseCategoryModel>> categories({bool includeInactive = false});
  Future<ExpenseCategoryModel> saveCategory(String name, {int? id});
}
