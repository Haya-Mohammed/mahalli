import 'package:mahalli/core/config/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:mahalli/core/config/theme/colors.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';
import 'package:mahalli/features/categories/domain/models/category_Model.dart';
import 'package:mahalli/features/sales/presentation/widgets/category_chip.dart';

class SalesHeader extends StatelessWidget {
  final TextEditingController search;
  final FocusNode searchFocus;
  final List<CategoryModel> categories;
  final int? selectedCategory;
  final VoidCallback onSearch, onScan;
  final ValueChanged<int?> onCategory;

  const SalesHeader({
    required this.search,
    required this.searchFocus,
    required this.categories,
    required this.selectedCategory,
    required this.onSearch,
    required this.onCategory,
    required this.onScan,
  });

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final theme = Theme.of(context);
    final surface = theme.colorScheme.surface;
    final border = theme.brightness == Brightness.dark
        ? AppDarkColors.border
        : const Color(0xFFE8E1D5);
    final background = theme.brightness == Brightness.dark
        ? AppDarkColors.background
        : const Color(0xFFF6F3ED);
    return Container(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 20, 16, 12),
      decoration: BoxDecoration(
        color: surface,
        border: Border(bottom: BorderSide(color: border)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  l.newSale,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              IconButton.filledTonal(
                tooltip: l.searchCatalog,
                icon: const Icon(Icons.search),
                onPressed: () => searchFocus.requestFocus(),
              ),
              const SizedBox(width: 6),
              IconButton.filled(
                tooltip: l.saleHistory,
                icon: const Icon(Icons.receipt_long_outlined),
                style: IconButton.styleFrom(
                  backgroundColor: theme.colorScheme.onSurface,
                  foregroundColor: surface,
                ),
                onPressed: () => Navigator.of(
                  context,
                ).pushNamed<void>(AppRoutes.salesHistory),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: search,
                  focusNode: searchFocus,
                  textInputAction: TextInputAction.search,
                  onChanged: (_) => onSearch(),
                  decoration: InputDecoration(
                    hintText: l.searchCatalog,
                    prefixIcon: const Icon(Icons.search),
                    isDense: true,
                    filled: true,
                    fillColor: background,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 11,
                    ),
                    suffixIcon: search.text.isEmpty
                        ? null
                        : IconButton(
                            tooltip: l.discard,
                            icon: const Icon(Icons.close, size: 18),
                            onPressed: () {
                              search.clear();
                              onSearch();
                            },
                          ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Material(
                color: theme.colorScheme.onSurface,
                borderRadius: BorderRadius.circular(14),
                child: InkWell(
                  onTap: onScan,
                  borderRadius: BorderRadius.circular(14),
                  child: SizedBox(
                    width: 48,
                    height: 48,
                    child: Icon(Icons.qr_code_scanner_rounded, color: surface),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 36,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CategoryChip(
                  label: l.stockAll,
                  selected: selectedCategory == null,
                  onTap: () => onCategory(null),
                ),
                for (final category in categories)
                  CategoryChip(
                    label: category.name,
                    selected: selectedCategory == category.id,
                    onTap: () => onCategory(category.id),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
