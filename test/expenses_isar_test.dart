import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:isar_community/isar.dart';
import 'package:mahalli/core/database/schemas.dart';
import 'package:mahalli/core/database/transaction_runner.dart';
import 'package:mahalli/core/error/failure.dart';
import 'package:mahalli/features/expenses/data/isar_expense_repository.dart';
import 'package:mahalli/features/expenses/domain/models/expense_model.dart';

void main() {
  test('expense categories and entries persist and reject duplicate names', () async {
    if (!Platform.isWindows && !Platform.isLinux && !Platform.isMacOS) return;
    final config =
        jsonDecode(await File('.dart_tool/package_config.json').readAsString())
            as Map<String, dynamic>;
    final packages = (config['packages'] as List<dynamic>).cast<Map<String, dynamic>>();
    final dependency = packages.firstWhere(
      (package) => package['name'] == 'isar_community_flutter_libs',
    );
    final rootUri = (dependency['rootUri'] as String).replaceFirst(RegExp(r'/$'), '');
    final library = Platform.isWindows
        ? 'windows/libisar.dll'
        : Platform.isLinux
        ? 'linux/libisar.so'
        : 'macos/libisar.dylib';
    final path = Uri.parse('$rootUri/$library').toFilePath(windows: Platform.isWindows);
    await Isar.initializeIsarCore(libraries: {Abi.current(): path});
    final dir = await Directory.systemTemp.createTemp('mahalli-expense-test');
    final isar = await Isar.open(allSchemas, directory: dir.path, name: 'expense');
    try {
      final repo = IsarExpenseRepository(isar, TransactionRunner(isar));
      final category = await repo.saveCategory(' Rent ');
      expect(category.name, 'Rent');
      expect((await repo.categories()).single.id, category.id);
      await expectLater(repo.saveCategory('rent'), throwsA(isA<DuplicateNameFailure>()));

      final now = DateTime.now();
      final saved = await repo.save(
        ExpenseModel(
          id: 0,
          categoryId: category.id,
          amountMinor: 1250,
          date: now.subtract(const Duration(minutes: 1)),
          description: 'Monthly rent',
        ),
      );
      final updated = await repo.save(
        ExpenseModel(
          id: saved.id,
          categoryId: category.id,
          amountMinor: 1500,
          date: saved.date,
          description: saved.description,
        ),
      );
      expect(updated.id, saved.id);
      expect(await repo.total(now.subtract(const Duration(days: 1)), now), 1500);
    } finally {
      await isar.close(deleteFromDisk: true);
      await dir.delete(recursive: true);
    }
  });
}
