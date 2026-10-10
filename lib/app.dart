import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mahalli/core/config/locale/l10n/app_localizations.dart';
import 'package:mahalli/core/config/preferences/number_digits_cubit.dart';
import 'package:mahalli/core/config/preferences/number_digits_storage_service.dart';
import 'package:mahalli/core/config/routes/router.dart';
import 'package:mahalli/core/config/routes/routes.dart';
import 'package:mahalli/core/config/theme/app_theme.dart';
import 'package:mahalli/core/config/theme/theme_cubit.dart';
import 'package:mahalli/features/onboarding/presentation/cubit/shop_cubit.dart';
import 'package:mahalli/features/security/presentation/cubit/pin_cubit.dart';

import '../core/di/injection_container.dart';
import 'core/config/locale/locale_cubit.dart';
import 'core/config/locale/locale_state.dart';
import 'features/security/presentation/widgets/pin_lifecycle_watcher.dart';

final GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class MahalliApp extends StatelessWidget {
  const MahalliApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocaleCubit>(create: (_) => sl<LocaleCubit>()),
        BlocProvider<ThemeCubit>(create: (_) => sl<ThemeCubit>()),
        BlocProvider<NumberDigitsCubit>(create: (_) => sl<NumberDigitsCubit>()),
        BlocProvider(create: (_) => sl<ShopCubit>()..load()),
        BlocProvider(create: (_) => sl<PinCubit>()..load()),
      ],
      child: BlocBuilder<LocaleCubit, LocaleState>(
        builder: (context, localeState) => BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themeMode) => BlocBuilder<NumberDigitsCubit, NumberDigits>(
            builder: (context, _) => MaterialApp(
              onGenerateTitle: (c) => AppLocalizations.of(c)!.appName,
              debugShowCheckedModeBanner: false,

              /// Theme
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: themeMode,

              /// Locale
              locale: localeState.locale,
              supportedLocales: AppLocalizations.supportedLocales,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],

              /// Routes
              initialRoute: AppRoutes.home,
              onGenerateRoute: AppRouter.onGenerateRoute,
              navigatorKey: appNavigatorKey,
              builder: (context, child) => PinLifecycleWatcher(
                navigatorKey: appNavigatorKey,
                child: child ?? const SizedBox.shrink(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
