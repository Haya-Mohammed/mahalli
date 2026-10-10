import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/core/money/money.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';
import 'package:mahalli/features/customers/presentation/cubits/customer_detail/customer_detail_cubit.dart';
import 'package:mahalli/features/customers/presentation/cubits/customer_detail/customer_detail_state.dart';
import 'package:mahalli/features/onboarding/presentation/cubit/shop_cubit.dart';

enum DebtAction { payment, adjustment }

class DebtActionSheet extends StatefulWidget {
  const DebtActionSheet({required this.action});
  final DebtAction action;

  @override
  State<DebtActionSheet> createState() => _DebtActionSheetState();
}

class _DebtActionSheetState extends State<DebtActionSheet> {
  final _formKey = GlobalKey<FormState>();
  final _amount = TextEditingController();
  final _note = TextEditingController();
  bool _increase = true;
  String? _error;

  @override
  void dispose() {
    _amount.dispose();
    _note.dispose();
    super.dispose();
  }

  String get _currency => context.read<ShopCubit>().state.shop?.currency ?? 'ILS';

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    final amount = Money.tryParse(_amount.text, currency: _currency)!.minor;
    final cubit = context.read<CustomerDetailCubit>();
    final result = widget.action == DebtAction.payment
        ? await cubit.payment(amount, note: _note.text)
        : await cubit.adjustment(_increase ? amount : -amount, reason: _note.text);
    if (!mounted) return;
    if (result == CustomerActionResult.success) {
      Navigator.of(context).pop();
    } else {
      setState(
        () => _error = switch (result) {
          CustomerActionResult.overpayment => context.l10n.overpaymentError,
          CustomerActionResult.invalid => context.l10n.invalidData,
          _ => context.l10n.saveFailed,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final busy = context.watch<CustomerDetailCubit>().state.busy;
    final adjustment = widget.action == DebtAction.adjustment;
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 24, 20, MediaQuery.viewInsetsOf(context).bottom + 24),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                adjustment ? l.recordAdjustment : l.recordPayment,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              if (adjustment) ...[
                const SizedBox(height: 12),
                SegmentedButton<bool>(
                  segments: [
                    ButtonSegment(value: true, label: Text(l.adjustmentIncrease)),
                    ButtonSegment(value: false, label: Text(l.adjustmentDecrease)),
                  ],
                  selected: {_increase},
                  onSelectionChanged: (value) => setState(() => _increase = value.first),
                ),
              ],
              const SizedBox(height: 16),
              TextFormField(
                key: const Key('debt_amount'),
                controller: _amount,
                autofocus: true,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: adjustment ? l.adjustmentAmount : l.paymentAmount,
                ),
                validator: (value) {
                  final parsed = Money.tryParse(value, currency: _currency);
                  if (parsed == null) return l.invalidNumber;
                  if (parsed.minor <= 0) return l.stockPositiveRequired;
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                key: const Key('debt_note'),
                controller: _note,
                maxLength: 200,
                decoration: InputDecoration(
                  labelText: adjustment ? l.adjustmentReason : l.paymentNote,
                ),
                validator: (value) => adjustment && (value == null || value.trim().isEmpty)
                    ? l.adjustmentReasonRequired
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
