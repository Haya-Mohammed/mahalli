import 'package:flutter/material.dart';
import 'package:mahalli/core/config/theme/colors.dart';

class AppColorScheme {
  AppColorScheme._();

  static const light = ColorScheme(
    brightness: Brightness.light,

    primary: AppColors.primary,
    onPrimary: Colors.white,

    primaryContainer: AppColors.primaryMuted,
    onPrimaryContainer: AppColors.primaryPressed,

    secondary: AppColors.accentValue,
    onSecondary: Colors.white,

    secondaryContainer: AppColors.warningBg,
    onSecondaryContainer: AppColors.warningText,

    surface: AppColors.surface,
    onSurface: AppColors.textPrimary,

    surfaceContainerHighest: AppColors.surfaceMuted,

    error: AppColors.dangerBorder,
    onError: Colors.white,

    outline: AppColors.border,
    outlineVariant: AppColors.disabledBorder,
  );

  static const dark = ColorScheme(
    brightness: Brightness.dark,
    primary: AppDarkColors.primary,
    onPrimary: AppDarkColors.textInverse,
    primaryContainer: AppDarkColors.primaryMuted,
    onPrimaryContainer: AppDarkColors.primary,
    secondary: AppDarkColors.accentValue,
    onSecondary: AppDarkColors.textInverse,
    secondaryContainer: AppDarkColors.warningBg,
    onSecondaryContainer: AppDarkColors.warningText,
    surface: AppDarkColors.surface,
    onSurface: AppDarkColors.textPrimary,
    surfaceContainerHighest: AppDarkColors.surfaceMuted,
    error: AppDarkColors.dangerBorder,
    onError: AppDarkColors.textPrimary,
    outline: AppDarkColors.border,
    outlineVariant: AppDarkColors.disabledBorder,
  );
}
