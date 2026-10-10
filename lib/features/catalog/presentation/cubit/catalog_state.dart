import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/features/catalog/domain/models/catalog_item.dart';

enum CatalogStatus { initial, loading, ready, failure }

class CatalogState {
  const CatalogState({
    this.status = CatalogStatus.initial,
    this.type = ItemType.product,
    this.query = '',
    this.includeInactive = false,
    this.items = const [],
    this.hasMore = false,
    this.loadingMore = false,
  });
  final CatalogStatus status;
  final ItemType type;
  final String query;
  final bool includeInactive;
  final List<CatalogItem> items;
  final bool hasMore;
  final bool loadingMore;
}
