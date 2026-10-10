import 'package:isar_community/isar.dart';
import 'package:mahalli/core/database/collections/category.dart';
import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/core/error/failure.dart';
import 'package:mahalli/features/categories/domain/models/category_Model.dart';

import '../domain/repository/category_repository.dart';
import '../domain/usecases/category_name_policy.dart';

class IsarCategoryRepository implements CategoryRepository {
  const IsarCategoryRepository(this.isar);
  final Isar isar;

  @override
  Future<List<CategoryModel>> list() async {
    try {
      final rows = await isar.categories.where().findAll();
      rows.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
      return rows.map(_details).toList();
    } catch (_) {
      throw const DatabaseFailure('Unable to load categories');
    }
  }

  @override
  Future<CategoryModel> save({int? id, required String name, required ItemType type}) async {
    final trimmed = name.trim();
    if (trimmed.isEmpty) {
      throw const ValidationFailure('Category name required');
    }
    try {
      return await isar.writeTxn(() async {
        final existing = id == null ? null : await isar.categories.get(id);
        if (id != null && existing == null) {
          throw const NotFoundFailure('Category not found');
        }
        if (existing != null && existing.type != type) {
          throw const ValidationFailure('Category type cannot change');
        }
        final rows = await isar.categories.where().findAll();
        if (isCategoryNameTaken(rows.map(_details), name: trimmed, type: type, excludingId: id)) {
          throw DuplicateNameFailure(trimmed);
        }
        final category = existing ?? Category()
          ..type = type;
        category.name = trimmed;
        await isar.categories.put(category);
        return _details(category);
      });
    } on Failure {
      rethrow;
    } catch (_) {
      throw const DatabaseFailure('Unable to save category');
    }
  }

  @override
  Future<void> setActive(int id, bool active) async {
    try {
      await isar.writeTxn(() async {
        final category = await isar.categories.get(id);
        if (category == null) throw const NotFoundFailure('Category not found');
        category.isActive = active;
        await isar.categories.put(category);
      });
    } on Failure {
      rethrow;
    } catch (_) {
      throw const DatabaseFailure('Unable to update category');
    }
  }

  CategoryModel _details(Category row) =>
      CategoryModel(id: row.id, name: row.name, type: row.type, isActive: row.isActive);
}
