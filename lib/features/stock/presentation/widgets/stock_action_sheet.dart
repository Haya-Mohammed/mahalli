import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/core/money/money.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';
import 'package:mahalli/features/stock/presentation/cubits/stock_details/stock_details_cubit.dart';
import 'package:mahalli/features/stock/presentation/cubits/stock_details/stock_details_state.dart';

enum StockAction { add, adjust, damage }

class StockActionSheet extends StatefulWidget {
  const StockActionSheet({required this.action});
  final StockAction action;

  @override
  State<StockActionSheet> createState() => _StockActionSheetState();
}

class _StockActionSheetState extends State<StockActionSheet> {
  final _formKey = GlobalKey<FormState>();
  final _quantity = TextEditingController();
  final _note = TextEditingController();
  String? _error;

  @override
  void initState() {
    super.initState();
    if (widget.action == StockAction.adjust) {
      final current = context.read<StockDetailCubit>().state.product?.quantityMilli ?? 0;
      _quantity.text = Quantity(current < 0 ? 0 : current).format();
    }
  }

  @override
  void dispose() {
    _quantity.dispose();
    _note.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    final quantity = Quantity.tryParse(_quantity.text)!.milli;
    final cubit = context.read<StockDetailCubit>();
    final result = switch (widget.action) {
      StockAction.add => await cubit.add(quantity, note: _note.text),
      StockAction.adjust => await cubit.adjust(quantity, note: _note.text),
      StockAction.damage => await cubit.damage(quantity, reason: _note.text),
    };
    if (!mounted) return;
    if (result == StockActionResult.success) {
      Navigator.of(context).pop();
    } else {
      setState(
        () => _error = switch (result) {
          StockActionResult.insufficient => context.l10n.damageExceedsStock,
          StockActionResult.invalid => context.l10n.invalidData,
          _ => context.l10n.saveFailed,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final busy = context.watch<StockDetailCubit>().state.busy;
    final title = switch (widget.action) {
      StockAction.add => l.addStock,
      StockAction.adjust => l.adjustStock,
      StockAction.damage => l.recordDamage,
    };
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 24, 20, MediaQuery.viewInsetsOf(context).bottom + 24),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 16),
              TextFormField(
                key: const Key('stock_quantity'),
                controller: _quantity,
                autofocus: true,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: widget.action == StockAction.adjust ? l.countedStock : l.stockQuantity,
                ),
                validator: (value) {
                  final parsed = Quantity.tryParse(value);
                  if (parsed == null) return l.invalidNumber;
                  if (widget.action != StockAction.adjust && parsed.milli <= 0) {
                    return l.stockPositiveRequired;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                key: const Key('stock_note'),
                controller: _note,
                maxLength: 200,
                decoration: InputDecoration(
                  labelText: widget.action == StockAction.damage ? l.stockReason : l.stockNote,
                ),
                validator: (value) =>
                    widget.action == StockAction.damage && (value == null || value.trim().isEmpty)
                    ? l.damageReasonRequired
                    : null,
              ),
              if (_error != null)
                Text(_error!, style: TextStyle(color: Theme.of(context).colorScheme.error)),
              const SizedBox(height: 16),
              FilledButton(onPressed: busy ? null : _submit, child: Text(l.save)),
            ],
          ),
        ),
      ),
    );
  }
}
