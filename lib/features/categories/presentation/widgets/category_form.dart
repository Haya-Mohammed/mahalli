import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';
import 'package:mahalli/features/categories/domain/models/category_Model.dart';
import 'package:mahalli/features/categories/presentation/cubit/category_cubit.dart';

class CategoryForm extends StatefulWidget {
  const CategoryForm({required this.type, this.category});
  final ItemType type;
  final CategoryModel? category;

  @override
  State<CategoryForm> createState() => _CategoryFormState();
}

class _CategoryFormState extends State<CategoryForm> {
  late final TextEditingController _name = TextEditingController(text: widget.category?.name);
  String? _error;
  bool _saving = false;

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final l = context.l10n;
    if (_name.text.trim().isEmpty) {
      setState(() => _error = l.requiredField);
      return;
    }
    setState(() {
      _error = null;
      _saving = true;
    });
    final result = await context.read<CategoryCubit>().save(
      id: widget.category?.id,
      name: _name.text,
      type: widget.type,
    );
    if (!mounted) return;
    if (result == CategorySaveResult.saved) {
      Navigator.of(context).pop();
      return;
    }
    setState(() {
      _saving = false;
      _error = switch (result) {
        CategorySaveResult.duplicate => l.nameInUse,
        CategorySaveResult.invalid => l.invalidData,
        _ => l.genericError,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 24, 20, MediaQuery.viewInsetsOf(context).bottom + 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.category == null ? l.addCategory : l.editCategory,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _name,
            autofocus: true,
            maxLength: 60,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(labelText: l.categoryName, errorText: _error),
            onSubmitted: (_) => _saving ? null : _save(),
          ),
          const SizedBox(height: 12),
          FilledButton(onPressed: _saving ? null : _save, child: Text(l.save)),
        ],
      ),
    );
  }
}
