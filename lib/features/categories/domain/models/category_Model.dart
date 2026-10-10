import 'package:mahalli/core/database/collections/enums.dart';

class CategoryModel {
  const CategoryModel({
    required this.id,
    required this.name,
    required this.type,
    required this.isActive,
  });

  final int id;
  final String name;
  final ItemType type;
  final bool isActive;
}
