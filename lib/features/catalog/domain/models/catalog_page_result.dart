import 'package:mahalli/features/catalog/domain/models/catalog_item.dart';

class CatalogPageResult {
  const CatalogPageResult(this.items, this.hasMore);
  final List<CatalogItem> items;
  final bool hasMore;
}
