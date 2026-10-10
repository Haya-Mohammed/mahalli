import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/features/catalog/domain/models/catalog_item.dart';
import 'package:mahalli/features/catalog/domain/models/catalog_page_result.dart';
import 'package:mahalli/features/catalog/domain/models/product_input.dart';
import 'package:mahalli/features/catalog/domain/models/service_input.dart';

abstract class CatalogRepository {
  Future<CatalogPageResult> search({
    required ItemType type,
    required String query,
    required bool includeInactive,
    required int offset,
    required int limit,
  });
  Future<CatalogItem?> get(ItemType type, int id);
  Future<CatalogItem?> getByBarcode(String barcode);
  Future<CatalogItem> saveProduct(ProductInput input, {int? id});
  Future<CatalogItem> saveService(ServiceInput input, {int? id});
  Future<void> setActive(ItemType type, int id, bool active);
}
