import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/core/money/currency.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';
import 'package:mahalli/features/onboarding/presentation/cubit/shop_cubit.dart';

class ShopSettingsPage extends StatefulWidget {
  const ShopSettingsPage({super.key});

  @override
  State<ShopSettingsPage> createState() => _ShopSettingsPageState();
}

class _ShopSettingsPageState extends State<ShopSettingsPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _name;
  late BusinessType _businessType;
  late String _currency;
  bool _failed = false;

  @override
  void initState() {
    super.initState();
    final shop = context.read<ShopCubit>().state.shop!;
    _name = TextEditingController(text: shop.name);
    _businessType = shop.businessType;
    _currency = shop.currency;
  }

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _failed = false);
    final saved = await context.read<ShopCubit>().update(_name.text, _businessType, _currency);
    if (!mounted) return;
    if (!saved) {
      setState(() => _failed = true);
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(context.l10n.shopUpdated)));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final saving = context.select((ShopCubit cubit) => cubit.state.submitting);
    final sidePad = ((MediaQuery.sizeOf(context).width - 640) / 2).clamp(0.0, double.infinity);
    return Scaffold(
      appBar: AppBar(title: Text(l.shopSettings)),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.fromLTRB(sidePad + 16, 8, sidePad + 16, 32),
          children: [
            Icon(Icons.storefront_outlined, size: 42, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 10),
            Text(
              l.shopSettings,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(l.shopSettingsHint, textAlign: TextAlign.center),
            const SizedBox(height: 18),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: _name,
                        maxLength: 60,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(labelText: l.shopName),
                        validator: (value) {
                          final length = value?.trim().length ?? 0;
                          return length < 2 || length > 60 ? l.shopNameLength : null;
                        },
                      ),
                      const SizedBox(height: 16),
                      DropdownButtonFormField<BusinessType>(
                        initialValue: _businessType,
                        decoration: InputDecoration(labelText: l.businessType),
                        items: BusinessType.values
                            .map(
                              (type) => DropdownMenuItem(
                                value: type,
                                child: Text(l.businessTypeLabel(type)),
                              ),
                            )
                            .toList(),
                        onChanged: saving
                            ? null
                            : (type) => setState(() => _businessType = type ?? _businessType),
                      ),
                      const SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        initialValue: _currency,
                        decoration: InputDecoration(labelText: l.currency),
                        items: CurrencyCatalog.decimals.keys
                            .map(
                              (code) => DropdownMenuItem(
                                value: code,
                                child: Text('${CurrencyCatalog.symbol(code)} $code'),
                              ),
                            )
                            .toList(),
                        onChanged: saving
                            ? null
                            : (code) => setState(() => _currency = code ?? _currency),
                      ),
                      if (_failed) ...[
                        const SizedBox(height: 16),
                        Text(
                          l.shopUpdateFailed,
                          style: TextStyle(color: Theme.of(context).colorScheme.error),
                        ),
                      ],
                      const SizedBox(height: 24),
                      FilledButton(onPressed: saving ? null : _save, child: Text(l.saveChanges)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
