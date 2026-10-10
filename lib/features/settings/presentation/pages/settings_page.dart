import 'package:mahalli/core/config/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/core/config/locale/locale_cubit.dart';
import 'package:mahalli/core/config/preferences/number_digits_cubit.dart';
import 'package:mahalli/core/config/preferences/number_digits_storage_service.dart';
import 'package:mahalli/core/config/theme/theme_cubit.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';
import 'package:mahalli/core/widgets/local_status_pill.dart';
import 'package:mahalli/features/onboarding/presentation/cubit/shop_cubit.dart';
import 'package:mahalli/features/security/presentation/cubit/pin_cubit.dart';
import 'package:mahalli/features/settings/presentation/widgets/section.dart';
import 'package:mahalli/features/settings/presentation/widgets/settings_group.dart';
import 'package:mahalli/features/settings/presentation/widgets/settings_item.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final locale = context.watch<LocaleCubit>().state.locale;
    final theme = context.watch<ThemeCubit>().state;
    final digits = context.watch<NumberDigitsCubit>().state;
    final pinEnabled = context.watch<PinCubit>().state.enabled;
    final shop = context.watch<ShopCubit>().state.shop;
    final colors = Theme.of(context).colorScheme;
    final sidePad = ((MediaQuery.sizeOf(context).width - 640) / 2).clamp(
      0.0,
      double.infinity,
    );

    return Scaffold(
      appBar: AppBar(title: Text(l.settings)),
      body: ListView(
        padding: EdgeInsets.fromLTRB(sidePad + 16, 8, sidePad + 16, 32),
        children: [
          GestureDetector(
            onTap: () => _push(context, AppRoutes.shopSettings),
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFF1D1C19),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 26,
                    backgroundColor: Color(0xFF0E7A55),
                    child: Icon(Icons.storefront_outlined, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          shop?.name ?? l.appName,
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                        ),
                        Text(
                          l.shopSettingsHint,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.edit_outlined,
                    size: 18,
                    color: colors.primaryContainer,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Align(
            alignment: AlignmentDirectional.centerStart,
            child: LocalStatusPill(),
          ),
          Section(title: l.shopSettings),
          SettingsGroup(
            children: [
              SettingsItem(
                Icons.storefront_outlined,
                l.shopSettings,
                l.shopSettingsHint,
                () => _push(context, AppRoutes.shopSettings),
              ),
            ],
          ),
          Section(title: l.appearance),
          SettingsGroup(
            children: [
              SettingsItem(
                Icons.translate_outlined,
                l.language,
                locale.languageCode == 'ar' ? 'العربية' : 'English',
                () => _chooseLanguage(context),
              ),
              SettingsItem(
                Icons.brightness_6_outlined,
                l.theme,
                theme == ThemeMode.dark ? l.darkTheme : l.lightTheme,
                () => _chooseTheme(context),
              ),
              SettingsItem(
                Icons.numbers_outlined,
                l.numberDigits,
                digits == NumberDigits.arabicIndic
                    ? l.arabicIndicDigits
                    : l.westernDigits,
                () => _chooseDigits(context),
              ),
            ],
          ),
          Section(title: l.securityAndData),
          SettingsGroup(
            children: [
              SettingsItem(
                Icons.lock_outline,
                l.pinSettings,
                pinEnabled ? l.changePin : l.setPin,
                () => _push(
                  context,
                  pinEnabled ? AppRoutes.pinSettings : AppRoutes.pinSetup,
                ),
              ),
              SettingsItem(
                Icons.backup_outlined,
                l.backupAndRestore,
                l.backupSettingsHint,
                () => _push(context, AppRoutes.backup),
              ),
            ],
          ),
          Section(title: l.reportSettings),
          SettingsGroup(
            children: [
              SettingsItem(
                Icons.receipt_long_outlined,
                l.receiptSettings,
                l.receiptSettingsHint,
                () => _push(context, AppRoutes.receiptSettings),
              ),
              SettingsItem(
                Icons.bar_chart_outlined,
                l.reports,
                l.reportSettingsHint,
                () => _push(context, AppRoutes.reports),
              ),
            ],
          ),
          const SizedBox(height: 14),
          SettingsGroup(
            children: [
              SettingsItem(
                Icons.info_outline,
                l.about,
                l.aboutHint,
                () => _push(context, AppRoutes.about),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static void _push(BuildContext context, String route) {
    Navigator.of(context).pushNamed<void>(route);
  }

  static Future<void> _chooseLanguage(BuildContext context) async {
    final selected = await showDialog<String>(
      context: context,
      builder: (dialogContext) => SimpleDialog(
        title: Text(dialogContext.l10n.language),
        children: [
          SimpleDialogOption(
            onPressed: () => Navigator.pop(dialogContext, 'ar'),
            child: const Text('العربية'),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.pop(dialogContext, 'en'),
            child: const Text('English'),
          ),
        ],
      ),
    );
    if (selected != null && context.mounted) {
      await context.read<LocaleCubit>().changeLocale(Locale(selected));
    }
  }

  static Future<void> _chooseTheme(BuildContext context) async {
    final selected = await showDialog<ThemeMode>(
      context: context,
      builder: (dialogContext) => SimpleDialog(
        title: Text(dialogContext.l10n.theme),
        children: [
          SimpleDialogOption(
            onPressed: () => Navigator.pop(dialogContext, ThemeMode.light),
            child: Text(dialogContext.l10n.lightTheme),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.pop(dialogContext, ThemeMode.dark),
            child: Text(dialogContext.l10n.darkTheme),
          ),
        ],
      ),
    );
    if (selected != null && context.mounted) {
      await context.read<ThemeCubit>().setTheme(selected);
    }
  }

  static Future<void> _chooseDigits(BuildContext context) async {
    final selected = await showDialog<NumberDigits>(
      context: context,
      builder: (dialogContext) => SimpleDialog(
        title: Text(dialogContext.l10n.numberDigits),
        children: [
          SimpleDialogOption(
            onPressed: () => Navigator.pop(dialogContext, NumberDigits.western),
            child: Text(dialogContext.l10n.westernDigits),
          ),
          SimpleDialogOption(
            onPressed: () =>
                Navigator.pop(dialogContext, NumberDigits.arabicIndic),
            child: Text(dialogContext.l10n.arabicIndicDigits),
          ),
        ],
      ),
    );
    if (selected != null && context.mounted) {
      await context.read<NumberDigitsCubit>().setDigits(selected);
    }
  }
}
