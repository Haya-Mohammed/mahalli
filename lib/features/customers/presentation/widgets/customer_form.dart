import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/core/di/injection_container.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';
import 'package:mahalli/features/customers/domain/models/customer_details.dart';
import 'package:mahalli/features/customers/domain/models/customer_input.dart';
import 'package:mahalli/features/customers/domain/repository/customer_repository.dart';
import 'package:mahalli/features/customers/presentation/cubits/customer_detail/customer_detail_state.dart';
import 'package:mahalli/features/customers/presentation/cubits/customer_form/customer_form_cubits.dart';

class CustomerForm extends StatefulWidget {
  const CustomerForm({this.customer});
  final CustomerDetails? customer;

  @override
  State<CustomerForm> createState() => _CustomerFormState();
}

class _CustomerFormState extends State<CustomerForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _name = TextEditingController(text: widget.customer?.name);
  late final TextEditingController _phone = TextEditingController(text: widget.customer?.phone);
  late final TextEditingController _notes = TextEditingController(text: widget.customer?.notes);
  String? _error;

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    _notes.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _error = null);
    try {
      final duplicate = await sl<CustomerRepository>().nameExists(
        _name.text,
        excludingId: widget.customer?.id,
      );
      if (!mounted) return;
      if (duplicate) {
        final confirmed = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(context.l10n.duplicateCustomerWarning),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(context.l10n.cancel),
              ),
              FilledButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text(context.l10n.confirm),
              ),
            ],
          ),
        );
        if (confirmed != true || !mounted) return;
      }
      final result = await context.read<CustomerFormCubit>().save(
        CustomerInput(name: _name.text, phone: _phone.text, notes: _notes.text),
        id: widget.customer?.id,
      );
      if (!mounted) return;
      if (result == CustomerActionResult.success) {
        Navigator.of(context).pop(true);
      } else {
        setState(
          () => _error = result == CustomerActionResult.invalid
              ? context.l10n.invalidData
              : context.l10n.saveFailed,
        );
      }
    } catch (_) {
      if (mounted) setState(() => _error = context.l10n.saveFailed);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final busy = context.watch<CustomerFormCubit>().state.busy;
    return Scaffold(
      appBar: AppBar(title: Text(widget.customer == null ? l.addCustomer : l.editCustomer)),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Icon(
                      Icons.person_add_alt_1_outlined,
                      size: 36,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.customer == null ? l.addCustomer : l.editCustomer,
                      textAlign: TextAlign.center,
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 18),
                    TextFormField(
                      key: const Key('customer_name'),
                      controller: _name,
                      maxLength: 100,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(labelText: l.customerName),
                      validator: (value) =>
                          value == null || value.trim().isEmpty ? l.requiredField : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      key: const Key('customer_phone'),
                      controller: _phone,
                      maxLength: 30,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(labelText: l.customerPhone),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _notes,
                      maxLength: 500,
                      maxLines: 3,
                      decoration: InputDecoration(labelText: l.customerNotes),
                    ),
                    if (_error != null)
                      Text(_error!, style: TextStyle(color: Theme.of(context).colorScheme.error)),
                    const SizedBox(height: 20),
                    FilledButton(onPressed: busy ? null : _save, child: Text(l.save)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
