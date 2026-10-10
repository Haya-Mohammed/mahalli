import 'package:mahalli/core/database/collections/enums.dart';

class ShopModel {
  final String name;
  final BusinessType businessType;
  final String currency;

  const ShopModel({required this.name, required this.businessType, required this.currency});
}
