import 'package:mahalli/core/config/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';
import 'package:mahalli/core/widgets/app_button.dart';
import 'package:mahalli/features/security/data/pin_service.dart';

import '../cubit/pin_cubit.dart';

class PinOfferPage extends StatelessWidget {
  const PinOfferPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Icon(
                      Icons.lock_outline,
                      size: 64,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      l.pinOfferTitle,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Text(l.pinOfferBody, textAlign: TextAlign.center),
                    const SizedBox(height: 16),
                    Text(
                      l.pinNoRecovery,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 32),
                    AppButton(
                      label: l.setPin,
                      onPressed: () => Navigator.of(
                        context,
                      ).pushNamed<void>(AppRoutes.pinSetup),
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: context.read<PinCubit>().skipOffer,
                      child: Text(l.skipForNow),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PinSetupPage extends StatefulWidget {
  const PinSetupPage({super.key});
  @override
  State<PinSetupPage> createState() => _PinSetupPageState();
}

class _PinSetupPageState extends State<PinSetupPage> {
  final _form = GlobalKey<FormState>();
  final _pin = TextEditingController();
  final _confirm = TextEditingController();
  bool _failed = false;

  @override
  void dispose() {
    _pin.dispose();
    _confirm.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_form.currentState!.validate()) return;
    setState(() => _failed = false);
    final success = await context.read<PinCubit>().setPin(_pin.text);
    if (!mounted) return;
    if (success) {
      Navigator.pop(context);
    } else {
      setState(() => _failed = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final busy = context.select((PinCubit c) => c.state.busy);
    return Scaffold(
      appBar: AppBar(title: Text(l.setPin)),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Form(
                    key: _form,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(l.pinNoRecovery),
                        const SizedBox(height: 24),
                        _PinField(controller: _pin, label: l.pin),
                        const SizedBox(height: 16),
                        _PinField(
                          controller: _confirm,
                          label: l.confirmPin,
                          validator: (value) =>
                              PinService.normalizePin(value ?? '') ==
                                  PinService.normalizePin(_pin.text)
                              ? null
                              : l.pinMismatch,
                        ),
                        if (_failed) ...[
                          const SizedBox(height: 16),
                          Text(
                            l.pinError,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.error,
                            ),
                          ),
                        ],
                        const SizedBox(height: 24),
                        AppButton(
                          label: l.setPin,
                          loading: busy,
                          onPressed: _save,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PinLockPage extends StatefulWidget {
  const PinLockPage({super.key});
  @override
  State<PinLockPage> createState() => _PinLockPageState();
}

class _PinLockPageState extends State<PinLockPage> {
  final _pin = TextEditingController();
  @override
  void dispose() {
    _pin.dispose();
    super.dispose();
  }

  Future<void> _unlock() async {
    final success = await context.read<PinCubit>().unlock(_pin.text);
    if (mounted && !success) _pin.clear();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final state = context.watch<PinCubit>().state;
    final locked =
        state.lockedUntilUtc?.isAfter(DateTime.now().toUtc()) ?? false;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 440),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Icon(
                      Icons.lock_outline,
                      size: 64,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      l.pin,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    _PinField(
                      controller: _pin,
                      label: l.pin,
                      onSubmitted: (_) => _unlock(),
                    ),
                    if (state.error) ...[
                      const SizedBox(height: 12),
                      Text(
                        locked ? l.pinLocked : l.wrongPin,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ],
                    const SizedBox(height: 24),
                    AppButton(
                      label: l.unlock,
                      loading: state.busy,
                      onPressed: _unlock,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PinSettingsPage extends StatefulWidget {
  const PinSettingsPage({super.key});
  @override
  State<PinSettingsPage> createState() => _PinSettingsPageState();
}

class _PinSettingsPageState extends State<PinSettingsPage> {
  final _form = GlobalKey<FormState>();
  final _current = TextEditingController();
  final _replacement = TextEditingController();
  final _confirm = TextEditingController();
  bool _failed = false;

  @override
  void dispose() {
    _current.dispose();
    _replacement.dispose();
    _confirm.dispose();
    super.dispose();
  }

  Future<void> _submit({required bool disable}) async {
    if (disable) {
      if (!RegExp(
        r'^\d{4,6}$',
      ).hasMatch(PinService.normalizePin(_current.text))) {
        setState(() => _failed = true);
        return;
      }
    } else if (!_form.currentState!.validate()) {
      return;
    }
    setState(() => _failed = false);
    final cubit = context.read<PinCubit>();
    final success = disable
        ? await cubit.disablePin(_current.text)
        : await cubit.changePin(_current.text, _replacement.text);
    if (!mounted) return;
    if (success) {
      Navigator.pop(context);
    } else {
      setState(() => _failed = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final state = context.watch<PinCubit>().state;
    return Scaffold(
      appBar: AppBar(title: Text(l.pinSettings)),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Form(
                    key: _form,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _PinField(controller: _current, label: l.currentPin),
                        const SizedBox(height: 16),
                        _PinField(controller: _replacement, label: l.newPin),
                        const SizedBox(height: 16),
                        _PinField(
                          controller: _confirm,
                          label: l.confirmPin,
                          validator: (value) =>
                              PinService.normalizePin(value ?? '') ==
                                  PinService.normalizePin(_replacement.text)
                              ? null
                              : l.pinMismatch,
                        ),
                        if (_failed) ...[
                          const SizedBox(height: 12),
                          Text(
                            state.lockedUntilUtc?.isAfter(
                                      DateTime.now().toUtc(),
                                    ) ==
                                    true
                                ? l.pinLocked
                                : l.pinError,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.error,
                            ),
                          ),
                        ],
                        const SizedBox(height: 24),
                        AppButton(
                          label: l.changePin,
                          loading: state.busy,
                          onPressed: () => _submit(disable: false),
                        ),
                        const SizedBox(height: 16),
                        OutlinedButton(
                          onPressed: state.busy
                              ? null
                              : () => _submit(disable: true),
                          child: Text(l.disablePin),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PinField extends StatelessWidget {
  const _PinField({
    required this.controller,
    required this.label,
    this.validator,
    this.onSubmitted,
  });
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) => TextFormField(
    controller: controller,
    obscureText: true,
    maxLength: 6,
    keyboardType: TextInputType.number,
    autofillHints: const [AutofillHints.password],
    decoration: InputDecoration(labelText: label),
    validator: (value) {
      final normalized = PinService.normalizePin(value ?? '');
      if (!RegExp(r'^\d{4,6}$').hasMatch(normalized)) {
        return context.l10n.pinLengthError;
      }
      return validator?.call(value);
    },
    onFieldSubmitted: onSubmitted,
  );
}
