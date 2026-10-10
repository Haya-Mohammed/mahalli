import 'package:flutter_test/flutter_test.dart';
import 'package:mahalli/features/expenses/domain/models/expense_category_model.dart';
import 'package:mahalli/features/expenses/domain/models/expense_model.dart';
import 'package:mahalli/features/expenses/domain/repository/expense_repository.dart';

class _MemoryExpenses implements ExpenseRepository {
  final rows = <ExpenseModel>[];
  @override
  Future<List<ExpenseCategoryModel>> categories({bool includeInactive = false}) async => const [
    ExpenseCategoryModel(id: 1, name: 'Rent', active: true),
  ];
  @override
  Future<List<ExpenseModel>> list(DateTime from, DateTime to) async =>
      rows.where((row) => !row.date.isBefore(from) && !row.date.isAfter(to)).toList();
  @override
  Future<ExpenseModel> save(ExpenseModel entry) async {
    final saved = ExpenseModel(
      id: rows.length + 1,
      categoryId: entry.categoryId,
      amountMinor: entry.amountMinor,
      date: entry.date,
      description: entry.description,
    );
    rows.add(saved);
    return saved;
  }

  @override
  Future<ExpenseCategoryModel> saveCategory(String name, {int? id}) async =>
      ExpenseCategoryModel(id: id ?? 1, name: name, active: true);
  @override
  Future<int> total(DateTime from, DateTime to) async =>
      (await list(from, to)).fold<int>(0, (sum, row) => sum + row.amountMinor);
}

void main() {
  test('expense total is constrained to its reporting period', () async {
    final repo = _MemoryExpenses();
    await repo.save(
      ExpenseModel(id: 0, categoryId: 1, amountMinor: 1250, date: DateTime(2026, 10, 2)),
    );
    await repo.save(
      ExpenseModel(id: 0, categoryId: 1, amountMinor: 800, date: DateTime(2026, 9, 30)),
    );
    expect(await repo.total(DateTime(2026, 10), DateTime(2026, 10, 31)), 1250);
  });
}
