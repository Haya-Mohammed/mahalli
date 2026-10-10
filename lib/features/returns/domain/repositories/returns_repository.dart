import 'package:mahalli/features/returns/domain/models/return_line.dart';
import 'package:mahalli/features/returns/domain/models/return_result.dart';
import 'package:mahalli/features/returns/domain/models/returnable_item.dart';

abstract class ReturnsRepository {
  Future<List<ReturnableItem>> returnableItems(int saleId);
  Future<ReturnResult> create(int saleId, List<ReturnLine> lines);
}
