import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mahalli/core/config/locale/l10n/app_localizations.dart';
import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/core/di/injection_container.dart';
import 'package:mahalli/features/expenses/domain/models/expense_category_model.dart';
import 'package:mahalli/features/expenses/domain/models/expense_model.dart';
import 'package:mahalli/features/expenses/domain/repository/expense_repository.dart';
import 'package:mahalli/features/expenses/presentation/expenses_page.dart';
import 'package:mahalli/features/onboarding/domain/models/shop_model.dart';
import 'package:mahalli/features/onboarding/domain/repository/shop_repository.dart';
import 'package:mahalli/features/onboarding/domain/usecases/create_shop.dart';
import 'package:mahalli/features/onboarding/presentation/cubit/shop_cubit.dart';

class _ShopRepo implements ShopRepository {
  @override
  Future<ShopModel?> getShop() async =>
      const ShopModel(name: 'Test shop', businessType: BusinessType.grocery, currency: 'JOD');
  @override
  Future<ShopModel> createShop(ShopModel details) async => details;
  @override
  Future<ShopModel> updateShop(ShopModel details) async => details;
}

class _ExpenseRepo implements ExpenseRepository {
  final rows = <ExpenseModel>[];
  final categoryRows = <ExpenseCategoryModel>[];

  @override
  Future<List<ExpenseCategoryModel>> categories({bool includeInactive = false}) async =>
      categoryRows.where((row) => includeInactive || row.active).toList();
  @override
  Future<ExpenseCategoryModel> saveCategory(String name, {int? id}) async {
    final row = ExpenseCategoryModel(
      id: id ?? categoryRows.length + 1,
      name: name.trim(),
      active: true,
    );
    categoryRows.removeWhere((category) => category.id == row.id);
    categoryRows.add(row);
    return row;
  }

  @override
  Future<List<ExpenseModel>> list(DateTime from, DateTime to) async =>
      rows.where((row) => !row.date.isBefore(from) && !row.date.isAfter(to)).toList();
  @override
  Future<int> total(DateTime from, DateTime to) async =>
      (await list(from, to)).fold<int>(0, (sum, row) => sum + row.amountMinor);
  @override
  Future<ExpenseModel> save(ExpenseModel entry) async {
    final row = ExpenseModel(
      id: entry.id == 0 ? rows.length + 1 : entry.id,
      categoryId: entry.categoryId,
      amountMinor: entry.amountMinor,
      date: entry.date,
      description: entry.description,
    );
    rows.removeWhere((old) => old.id == row.id);
    rows.add(row);
    return row;
  }
}

void main() {
  testWidgets('owner can create a category, select it, and save an expense', (tester) async {
    final expenseRepo = _ExpenseRepo();
    final shopRepo = _ShopRepo();
    final shop = ShopCubit(shopRepo, CreateShop(shopRepo));
    await shop.load();
    sl.registerSingleton<ExpenseRepository>(expenseRepo);
    addTearDown(() async {
      await shop.close();
      await sl.unregister<ExpenseRepository>();
    });
    await tester.pumpWidget(
      BlocProvider<ShopCubit>.value(
        value: shop,
        child: const MaterialApp(
          locale: Locale('en'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: ExpensesPage(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(FilledButton, 'Add expense'));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(FilledButton, 'Save'));
    await tester.pump();
    expect(find.text('Select an expense category'), findsOneWidget);

    await tester.tap(find.text('Add category'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('expense_category_name')), 'Rent');
    await tester.tap(
      find.descendant(
        of: find.byType(AlertDialog),
        matching: find.widgetWithText(FilledButton, 'Save'),
      ),
    );
    await tester.pumpAndSettle();
    expect(expenseRepo.categoryRows.single.name, 'Rent');

    await tester.tap(find.text('Add category'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('expense_category_name')), 'Utilities');
    await tester.tap(
      find.descendant(
        of: find.byType(AlertDialog),
        matching: find.widgetWithText(FilledButton, 'Save'),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.byType(DropdownButtonFormField<int>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Rent').last);
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(const Key('expense_amount')), '1.250');
    await tester.tap(find.widgetWithText(FilledButton, 'Save'));
    await tester.pumpAndSettle();
    expect(expenseRepo.rows.single.categoryId, expenseRepo.categoryRows.first.id);
    expect(expenseRepo.rows.single.amountMinor, 1250);
    expect(find.byType(ExpensesPage), findsOneWidget);
    expect(find.text('Rent'), findsWidgets);

    await tester.tap(find.widgetWithText(ListTile, 'Rent'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('expense_amount')), '2.000');
    await tester.tap(find.widgetWithText(FilledButton, 'Save'));
    await tester.pumpAndSettle();
    expect(expenseRepo.rows.single.amountMinor, 2000);
  });
}
