import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/features/categories/domain/models/category_Model.dart';

abstract class CategoryRepository {
  Future<List<CategoryModel>> list();
  Future<CategoryModel> save({int? id, required String name, required ItemType type});
  Future<void> setActive(int id, bool active);
}
