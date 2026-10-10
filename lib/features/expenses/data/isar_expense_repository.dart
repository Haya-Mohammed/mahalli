import 'package:isar_community/isar.dart';
import 'package:mahalli/core/database/collections/category.dart';
import 'package:mahalli/core/database/collections/stock_expense.dart';
import 'package:mahalli/core/database/transaction_runner.dart';
import 'package:mahalli/core/error/failure.dart';
import 'package:mahalli/features/expenses/domain/models/expense_category_model.dart';
import 'package:mahalli/features/expenses/domain/models/expense_model.dart';
import 'package:mahalli/features/expenses/domain/repository/expense_repository.dart';

class IsarExpenseRepository implements ExpenseRepository {
  IsarExpenseRepository(this.isar, this.tx);
  final Isar isar;
  final TransactionRunner tx;

  @override
  Future<List<ExpenseCategoryModel>> categories({bool includeInactive = false}) async {
    var rows = await isar.expenseCategories.where().findAll();
    if (!includeInactive) rows = rows.where((r) => r.isActive).toList();
    final categories = rows
        .map((r) => ExpenseCategoryModel(id: r.id, name: r.name, active: r.isActive))
        .toList();
    categories.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    return categories;
  }

  @override
  Future<ExpenseCategoryModel> saveCategory(String name, {int? id}) => tx.run(() async {
    final clean = name.trim();
    if (clean.isEmpty || clean.length > 60) {
      throw const ValidationFailure('Invalid category name');
    }
    final existing = await isar.expenseCategories.where().findAll();
    if (existing.any(
      (category) => category.id != id && category.name.trim().toLowerCase() == clean.toLowerCase(),
    )) {
      throw DuplicateNameFailure(clean);
    }
    final row = id == null
        ? ExpenseCategory()
        : await isar.expenseCategories.get(id) ??
              (throw const NotFoundFailure('Category not found'));
    row.name = clean;
    row.id = await isar.expenseCategories.put(row);
    return ExpenseCategoryModel(id: row.id, name: row.name, active: row.isActive);
  });

  @override
  Future<List<ExpenseModel>> list(DateTime from, DateTime to) async =>
      (await isar.expenses
              .filter()
              .expenseDateBetween(from, to, includeUpper: true)
              .sortByExpenseDateDesc()
              .findAll())
          .map(_map)
          .toList();

  @override
  Future<int> total(DateTime from, DateTime to) async =>
      (await list(from, to)).fold<int>(0, (sum, item) => sum + item.amountMinor);

  @override
  Future<ExpenseModel> save(ExpenseModel Model) => tx.run(() async {
    if (Model.amountMinor <= 0 || Model.date.isAfter(DateTime.now())) {
      throw const ValidationFailure('Invalid expense');
    }
    final category = await isar.expenseCategories.get(Model.categoryId);
    if (category == null || !category.isActive) {
      throw const ValidationFailure('Invalid category');
    }
    final row = Model.id == 0
        ? Expense()
        : await isar.expenses.get(Model.id) ?? (throw const NotFoundFailure('Expense not found'));
    row
      ..categoryId = Model.categoryId
      ..amount = Model.amountMinor
      ..description = Model.description?.trim()
      ..expenseDate = Model.date;
    row.id = await isar.expenses.put(row);
    return _map(row);
  });

  ExpenseModel _map(Expense row) => ExpenseModel(
    id: row.id,
    categoryId: row.categoryId!,
    amountMinor: row.amount,
    date: row.expenseDate,
    description: row.description,
  );
}
