import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';
import 'package:mahalli/core/widgets/state_views.dart';
import 'package:mahalli/features/onboarding/presentation/cubit/shop_cubit.dart';
import 'package:mahalli/features/onboarding/presentation/cubit/shop_state.dart';
import 'package:mahalli/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:mahalli/features/security/presentation/cubit/pin_cubit.dart';
import 'package:mahalli/features/security/presentation/pages/pin_pages.dart';
import 'package:mahalli/features/shell/presentation/shell_page.dart';

/// No internet check: if the shop isn't configured, onboarding runs first.
class AppGate extends StatelessWidget {
  const AppGate({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<ShopCubit, ShopState>(
    builder: (context, s) => switch (s.status) {
      ShopStatus.loading => const Scaffold(body: Center(child: CircularProgressIndicator())),
      ShopStatus.missing => const OnboardingPage(),
      ShopStatus.ready => BlocBuilder<PinCubit, PinState>(
        builder: (context, pin) => switch (pin.status) {
          PinGateStatus.loading => const Scaffold(body: Center(child: CircularProgressIndicator())),
          PinGateStatus.offer => const PinOfferPage(),
          PinGateStatus.locked => const Scaffold(body: SizedBox.expand()),
          PinGateStatus.unlocked => const ShellPage(),
          PinGateStatus.failure => Scaffold(
            body: ErrorView(
              message: context.l10n.genericError,
              onRetry: context.read<PinCubit>().load,
            ),
          ),
        },
      ),
      ShopStatus.failure => Scaffold(
        body: ErrorView(
          message: context.l10n.genericError,
          onRetry: context.read<ShopCubit>().load,
        ),
      ),
    },
  );
}
