import 'package:flutter/material.dart';
import 'package:mahalli/core/config/extensions/colors_extensions.dart';
import 'package:mahalli/core/config/extensions/radius_extension.dart';
import 'package:mahalli/core/config/extensions/spacing_extension.dart';
import 'package:mahalli/core/config/theme/colors.dart';
import 'package:mahalli/core/config/theme/custom_themes/color_scheme.dart';
import 'package:mahalli/core/config/theme/custom_themes/text_theme.dart';
import 'package:mahalli/core/config/theme/radius.dart';
import 'package:mahalli/core/config/theme/spacing.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    /// Color system
    colorScheme: AppColorScheme.light,

    scaffoldBackgroundColor: AppColors.background,

    /// Typography
    fontFamily: 'Cairo',
    fontFamilyFallback: const ['IBM Plex Sans Arabic'],

    textTheme: AppTextTheme.lightTextTheme,

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: AppColors.textPrimary,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      titleSpacing: AppSpacing.md,
    ),

    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      height: 72,
      indicatorColor: AppColors.primaryMuted,
      labelTextStyle: WidgetStateProperty.resolveWith(
        (states) => AppTextTheme.lightTextTheme.labelSmall!.copyWith(
          color: states.contains(WidgetState.selected)
              ? AppColors.primary
              : AppColors.textSecondary,
          fontWeight: states.contains(WidgetState.selected)
              ? FontWeight.w700
              : FontWeight.w500,
        ),
      ),
      iconTheme: WidgetStateProperty.resolveWith(
        (states) => IconThemeData(
          color: states.contains(WidgetState.selected)
              ? AppColors.primary
              : AppColors.textSecondary,
        ),
      ),
    ),

    cardTheme: const CardThemeData(
      color: AppColors.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.lg)),
        side: BorderSide(color: AppColors.border),
      ),
    ),
    dialogTheme: const DialogThemeData(
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.lg)),
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.md)),
      ),
    ),

    /// Design system extensions
    extensions: [
      AppColorsExtension.light(),
      AppSpacingExtension.standard(),
      AppRadiusExtension.standard(),
    ],

    /// SnackBar
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.textPrimary,
      contentTextStyle: AppTextTheme.lightTextTheme.bodyMedium!.copyWith(
        color: Colors.white,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      behavior: SnackBarBehavior.floating,
    ),

    /// Input fields
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,

      hintStyle: AppTextTheme.lightTextTheme.bodyMedium!,

      hintMaxLines: 1,

      suffixIconColor: AppColors.textSecondary,

      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: 18,
      ),

      /// Borders
      border: _lightInputBorder(AppColors.border),
      enabledBorder: _lightInputBorder(AppColors.border),
      focusedBorder: _lightInputBorder(AppColors.primary),
      errorBorder: _lightInputBorder(AppColors.dangerBorder),
      focusedErrorBorder: _lightInputBorder(AppColors.dangerBorder),
      disabledBorder: _lightInputBorder(AppColors.disabledBorder),
    ),

    /// Checkbox
    checkboxTheme: CheckboxThemeData(
      checkColor: const WidgetStatePropertyAll(Colors.white),
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary;
        }

        return AppColors.surface;
      }),
      side: const BorderSide(color: AppColors.border),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.sm),
      ),
    ),

    /// Filled buttons
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size(0, 56),

        backgroundColor: AppColors.primary,

        foregroundColor: Colors.white,

        disabledBackgroundColor: AppColors.disabledBg,

        disabledForegroundColor: AppColors.disabledText,

        elevation: 0,

        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),

        textStyle: AppTextTheme.lightTextTheme.titleSmall!.copyWith(
          color: Colors.white,
        ),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
      ),
    ),

    /// Elevated buttons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(0, AppSpacing.touchTargetMin),

        backgroundColor: AppColors.primary,

        foregroundColor: Colors.white,

        disabledBackgroundColor: AppColors.disabledBg,

        disabledForegroundColor: AppColors.disabledText,

        elevation: 0,

        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
      ),
    ),

    /// Outlined buttons
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(0, AppSpacing.touchTargetMin),

        foregroundColor: AppColors.primary,

        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),

        side: const BorderSide(color: AppColors.border),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
      ),
    ),
  );

  static OutlineInputBorder _lightInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.md),
      borderSide: BorderSide(color: color),
    );
  }

  /// Dark theme

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: AppColorScheme.dark,
    scaffoldBackgroundColor: AppDarkColors.background,

    fontFamily: 'Cairo',

    fontFamilyFallback: const ['IBM Plex Sans Arabic'],

    textTheme: AppTextTheme.darkTextTheme,

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: AppDarkColors.textPrimary,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      titleSpacing: AppSpacing.md,
    ),

    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: AppDarkColors.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      height: 72,
      indicatorColor: AppDarkColors.primaryMuted,
    ),

    cardTheme: const CardThemeData(
      color: AppDarkColors.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.lg)),
        side: BorderSide(color: AppDarkColors.border),
      ),
    ),
    dialogTheme: const DialogThemeData(
      backgroundColor: AppDarkColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.lg)),
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppDarkColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppDarkColors.primary,
      foregroundColor: AppDarkColors.textInverse,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.md)),
      ),
    ),

    extensions: [
      AppColorsExtension.dark(),
      AppSpacingExtension.standard(),
      AppRadiusExtension.standard(),
    ],

    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppDarkColors.surfaceMuted,
      contentTextStyle: AppTextTheme.lightTextTheme.bodyMedium!.copyWith(
        color: AppDarkColors.textPrimary,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      behavior: SnackBarBehavior.floating,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppDarkColors.surface,
      hintStyle: AppTextTheme.lightTextTheme.bodyMedium!.copyWith(
        color: AppDarkColors.textSecondary,
      ),
      suffixIconColor: AppDarkColors.textSecondary,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.md,
      ),

      /// Borders
      border: _darkInputBorder(AppDarkColors.border),
      enabledBorder: _darkInputBorder(AppDarkColors.border),
      focusedBorder: _darkInputBorder(AppDarkColors.primary),
      errorBorder: _darkInputBorder(AppDarkColors.dangerBorder),
      focusedErrorBorder: _darkInputBorder(AppDarkColors.dangerBorder),
      disabledBorder: _darkInputBorder(AppDarkColors.disabledBorder),
    ),

    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size(0, AppSpacing.touchTargetMin),
        backgroundColor: AppDarkColors.primary,
        foregroundColor: AppDarkColors.textInverse,
        disabledBackgroundColor: AppDarkColors.disabledBg,
        disabledForegroundColor: AppDarkColors.disabledText,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
      ),
    ),
  );

  static OutlineInputBorder _darkInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.md),
      borderSide: BorderSide(color: color),
    );
  }

  /// RTL

  static Widget rtlBuilder(BuildContext context, Widget? child) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: child ?? const SizedBox.shrink(),
    );
  }
}
