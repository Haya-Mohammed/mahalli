import 'package:mahalli/features/catalog/domain/models/catalog_item.dart';

class CartLine {
  final CatalogItem item;
  final int quantityMilli;

  const CartLine({required this.item, required this.quantityMilli});

  int get totalMinor => (item.sellingPrice * quantityMilli + 500) ~/ 1000;
  CartLine copyWith({int? quantityMilli}) =>
      CartLine(item: item, quantityMilli: quantityMilli ?? this.quantityMilli);
}
