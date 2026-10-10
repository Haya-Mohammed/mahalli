import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/core/config/theme/spacing.dart';
import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/core/money/currency.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';
import 'package:mahalli/core/widgets/app_button.dart';
import 'package:mahalli/core/widgets/app_card.dart';

import '../cubit/shop_cubit.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  BusinessType _type = BusinessType.grocery;
  String _currency = 'ILS';
  bool _showSaveError = false;

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _showSaveError = false);
    final saved = await context.read<ShopCubit>().submit(_name.text, _type, _currency);
    if (mounted && !saved) setState(() => _showSaveError = true);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final theme = Theme.of(context);
    final saving = context.select((ShopCubit c) => c.state.submitting);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        l.appName,
                        style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(width: 8),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: theme.colorScheme.primary,
                        child: const Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    l.onboardingHero,
                    style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w800),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    l.welcomeSubtitle,
                    style: theme.textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  AppCard(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            l.onboardingStep,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 18),
                          TextFormField(
                            controller: _name,
                            textInputAction: TextInputAction.next,
                            maxLength: 60,
                            decoration: InputDecoration(
                              labelText: l.shopName,
                              hintText: l.shopNameHint,
                            ),
                            validator: (value) {
                              final length = value?.trim().length ?? 0;
                              return length < 2 || length > 60 ? l.shopNameLength : null;
                            },
                          ),
                          const SizedBox(height: AppSpacing.md),
                          DropdownButtonFormField<BusinessType>(
                            initialValue: _type,
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
                                : (type) => setState(() => _type = type ?? _type),
                          ),
                          const SizedBox(height: AppSpacing.md),
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
                          if (_showSaveError) ...[
                            const SizedBox(height: AppSpacing.md),
                            Text(l.setupError, style: TextStyle(color: theme.colorScheme.error)),
                          ],
                          const SizedBox(height: AppSpacing.lg),
                          AppButton(label: l.getStarted, loading: saving, onPressed: _submit),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.lock_outline, size: 15, color: theme.colorScheme.primary),
                      const SizedBox(width: 5),
                      Text(l.onboardingLocal, style: theme.textTheme.bodySmall),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
