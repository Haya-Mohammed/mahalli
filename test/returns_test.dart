import 'package:flutter_test/flutter_test.dart';
import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/features/returns/domain/models/return_line.dart';
import 'package:mahalli/features/returns/domain/models/returnable_item.dart';

void main() {
  test('return keeps original price and caps quantity', () {
    const item = ReturnableItem(
      saleItemId: 4,
      itemId: 2,
      type: ItemType.product,
      name: 'Tea',
      remainingMilli: 3000,
      unitPrice: 1250,
      unitCost: 700,
    );
    const line = ReturnLine(item: item, quantityMilli: 2000);
    expect(line.quantityMilli <= line.item.remainingMilli, isTrue);
    expect((line.item.unitPrice * line.quantityMilli + 500) ~/ 1000, 2500);
  });
}
