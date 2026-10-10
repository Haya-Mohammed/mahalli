import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/features/categories/domain/models/category_Model.dart';

bool isCategoryNameTaken(
  Iterable<CategoryModel> categories, {
  required String name,
  required ItemType type,
  int? excludingId,
}) {
  final normalized = name.trim().toLowerCase();
  return categories.any(
    (category) =>
        category.id != excludingId &&
        category.type == type &&
        category.name.trim().toLowerCase() == normalized,
  );
}
