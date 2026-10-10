import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/core/di/injection_container.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';
import 'package:mahalli/core/widgets/state_views.dart';
import 'package:mahalli/features/categories/domain/models/category_Model.dart';
import 'package:mahalli/features/categories/presentation/widgets/category_form.dart';

import '../cubit/category_cubit.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocProvider(create: (_) => sl<CategoryCubit>()..load(), child: const _CategoryView());
}

class _CategoryView extends StatefulWidget {
  const _CategoryView();

  @override
  State<_CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<_CategoryView> {
  ItemType _type = ItemType.product;
  bool _showInactive = false;

  Future<void> _openForm([CategoryModel? category]) async {
    final cubit = context.read<CategoryCubit>();
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => BlocProvider.value(
        value: cubit,
        child: CategoryForm(type: _type, category: category),
      ),
    );
  }

  Future<void> _setActive(CategoryModel category) async {
    final success = await context.read<CategoryCubit>().setActive(category.id, !category.isActive);
    if (mounted && !success) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.l10n.genericError)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final state = context.watch<CategoryCubit>().state;
    final items = state.items
        .where((item) => item.type == _type && (_showInactive || item.isActive))
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text(l.categories)),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: state.busy ? null : _openForm,
        icon: const Icon(Icons.add),
        label: Text(l.addCategory),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: SegmentedButton<ItemType>(
              segments: [
                ButtonSegment(value: ItemType.product, label: Text(l.products)),
                ButtonSegment(value: ItemType.service, label: Text(l.services)),
              ],
              selected: {_type},
              onSelectionChanged: (value) => setState(() => _type = value.first),
            ),
          ),
          SwitchListTile(
            title: Text(l.showInactive),
            value: _showInactive,
            onChanged: (value) => setState(() => _showInactive = value),
          ),
          Expanded(
            child: state.status == CategoryStatus.loading && state.items.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : state.status == CategoryStatus.failure && state.items.isEmpty
                ? ErrorView(message: l.genericError, onRetry: context.read<CategoryCubit>().load)
                : RefreshIndicator(
                    onRefresh: context.read<CategoryCubit>().load,
                    child: items.isEmpty
                        ? ListView(
                            children: [
                              SizedBox(
                                height: 320,
                                child: EmptyState(
                                  icon: Icons.category_outlined,
                                  title: l.noCategories,
                                  hint: l.noCategoriesHint,
                                ),
                              ),
                            ],
                          )
                        : ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              final item = items[index];
                              return Card(
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                                    child: Icon(
                                      item.type == ItemType.product
                                          ? Icons.inventory_2_outlined
                                          : Icons.design_services_outlined,
                                      color: Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                  title: Text(item.name),
                                  subtitle: item.isActive ? null : Text(l.inactive),
                                  trailing: PopupMenuButton<String>(
                                    onSelected: (action) {
                                      if (action == 'edit') {
                                        _openForm(item);
                                      } else {
                                        _setActive(item);
                                      }
                                    },
                                    itemBuilder: (_) => [
                                      PopupMenuItem(value: 'edit', child: Text(l.edit)),
                                      PopupMenuItem(
                                        value: 'active',
                                        child: Text(item.isActive ? l.deactivate : l.activate),
                                      ),
                                    ],
                                  ),
                                  onTap: () => _openForm(item),
                                ),
                              );
                            },
                          ),
                  ),
          ),
        ],
      ),
    );
  }
}
