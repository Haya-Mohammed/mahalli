import 'package:flutter/material.dart';

import '../theme/colors.dart';

@immutable
class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  // Brand
  final Color primary;
  final Color primaryHover;
  final Color primaryPressed;
  final Color primaryMuted;
  final Color primaryBorderMuted;
  final Color focusRing;

  // Financial
  final Color accentValue;

  // Surfaces
  final Color background;
  final Color surface;
  final Color surfaceMuted;

  // Structure
  final Color border;
  final Color disabledBg;
  final Color disabledBorder;

  // Text
  final Color textPrimary;
  final Color textSecondary;
  final Color textOnMuted;
  final Color disabledText;
  final Color textInverse;

  // Status backgrounds
  final Color successBg;
  final Color warningBg;
  final Color dangerBg;
  final Color infoBg;

  // Status borders
  final Color successBorder;
  final Color warningBorder;
  final Color dangerBorder;
  final Color infoBorder;

  // Status text
  final Color successText;
  final Color warningText;
  final Color dangerText;
  final Color infoText;

  const AppColorsExtension({
    required this.primary,
    required this.primaryHover,
    required this.primaryPressed,
    required this.primaryMuted,
    required this.primaryBorderMuted,
    required this.focusRing,
    required this.accentValue,
    required this.background,
    required this.surface,
    required this.surfaceMuted,
    required this.border,
    required this.disabledBg,
    required this.disabledBorder,
    required this.textPrimary,
    required this.textSecondary,
    required this.textInverse,
    required this.textOnMuted,
    required this.disabledText,
    required this.successBg,
    required this.warningBg,
    required this.dangerBg,
    required this.infoBg,
    required this.successBorder,
    required this.warningBorder,
    required this.dangerBorder,
    required this.infoBorder,
    required this.successText,
    required this.warningText,
    required this.dangerText,
    required this.infoText,
  });

  factory AppColorsExtension.light() {
    return const AppColorsExtension(
      primary: AppColors.primary,
      primaryHover: AppColors.primaryHover,
      primaryPressed: AppColors.primaryPressed,
      primaryMuted: AppColors.primaryMuted,
      primaryBorderMuted: AppColors.primaryBorderMuted,
      focusRing: AppColors.focusRing,

      accentValue: AppColors.accentValue,

      background: AppColors.background,
      surface: AppColors.surface,
      surfaceMuted: AppColors.surfaceMuted,

      border: AppColors.border,
      disabledBg: AppColors.disabledBg,
      disabledBorder: AppColors.disabledBorder,

      textPrimary: AppColors.textPrimary,
      textSecondary: AppColors.textSecondary,
      textOnMuted: AppColors.textOnMuted,
      disabledText: AppColors.disabledText,
      textInverse: AppColors.textInverse,

      successBg: AppColors.successBg,
      warningBg: AppColors.warningBg,
      dangerBg: AppColors.dangerBg,
      infoBg: AppColors.infoBg,

      successBorder: AppColors.successBorder,
      warningBorder: AppColors.warningBorder,
      dangerBorder: AppColors.dangerBorder,
      infoBorder: AppColors.infoBorder,

      successText: AppColors.successText,
      warningText: AppColors.warningText,
      dangerText: AppColors.dangerText,
      infoText: AppColors.infoText,
    );
  }

  factory AppColorsExtension.dark() {
    return const AppColorsExtension(
      primary: AppDarkColors.primary,
      primaryHover: AppDarkColors.primaryHover,
      primaryPressed: AppDarkColors.primaryPressed,
      primaryMuted: AppDarkColors.primaryMuted,
      primaryBorderMuted: AppDarkColors.primaryBorderMuted,
      focusRing: AppDarkColors.focusRing,
      accentValue: AppDarkColors.accentValue,
      background: AppDarkColors.background,
      surface: AppDarkColors.surface,
      surfaceMuted: AppDarkColors.surfaceMuted,
      border: AppDarkColors.border,
      disabledBg: AppDarkColors.disabledBg,
      disabledBorder: AppDarkColors.disabledBorder,
      textPrimary: AppDarkColors.textPrimary,
      textSecondary: AppDarkColors.textSecondary,
      textOnMuted: AppDarkColors.textOnMuted,
      disabledText: AppDarkColors.disabledText,
      textInverse: AppDarkColors.textInverse,
      successBg: AppDarkColors.successBg,
      warningBg: AppDarkColors.warningBg,
      dangerBg: AppDarkColors.dangerBg,
      infoBg: AppDarkColors.infoBg,
      successBorder: AppDarkColors.successBorder,
      warningBorder: AppDarkColors.warningBorder,
      dangerBorder: AppDarkColors.dangerBorder,
      infoBorder: AppDarkColors.infoBorder,
      successText: AppDarkColors.successText,
      warningText: AppDarkColors.warningText,
      dangerText: AppDarkColors.dangerText,
      infoText: AppDarkColors.infoText,
    );
  }

  @override
  AppColorsExtension copyWith({
    Color? primary,
    Color? primaryHover,
    Color? primaryPressed,
    Color? primaryMuted,
    Color? primaryBorderMuted,
    Color? focusRing,
    Color? accentValue,
    Color? background,
    Color? surface,
    Color? surfaceMuted,
    Color? border,
    Color? disabledBg,
    Color? disabledBorder,
    Color? textPrimary,
    Color? textSecondary,
    Color? textOnMuted,
    Color? disabledText,
    Color? textInverse,
    Color? successBg,
    Color? warningBg,
    Color? dangerBg,
    Color? infoBg,
    Color? successBorder,
    Color? warningBorder,
    Color? dangerBorder,
    Color? infoBorder,
    Color? successText,
    Color? warningText,
    Color? dangerText,
    Color? infoText,
  }) {
    return AppColorsExtension(
      primary: primary ?? this.primary,
      primaryHover: primaryHover ?? this.primaryHover,
      primaryPressed: primaryPressed ?? this.primaryPressed,
      primaryMuted: primaryMuted ?? this.primaryMuted,
      primaryBorderMuted: primaryBorderMuted ?? this.primaryBorderMuted,
      focusRing: focusRing ?? this.focusRing,
      accentValue: accentValue ?? this.accentValue,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceMuted: surfaceMuted ?? this.surfaceMuted,
      border: border ?? this.border,
      disabledBg: disabledBg ?? this.disabledBg,
      disabledBorder: disabledBorder ?? this.disabledBorder,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textOnMuted: textOnMuted ?? this.textOnMuted,
      disabledText: disabledText ?? this.disabledText,
      textInverse: textInverse ?? this.textInverse,
      successBg: successBg ?? this.successBg,
      warningBg: warningBg ?? this.warningBg,
      dangerBg: dangerBg ?? this.dangerBg,
      infoBg: infoBg ?? this.infoBg,
      successBorder: successBorder ?? this.successBorder,
      warningBorder: warningBorder ?? this.warningBorder,
      dangerBorder: dangerBorder ?? this.dangerBorder,
      infoBorder: infoBorder ?? this.infoBorder,
      successText: successText ?? this.successText,
      warningText: warningText ?? this.warningText,
      dangerText: dangerText ?? this.dangerText,
      infoText: infoText ?? this.infoText,
    );
  }

  @override
  AppColorsExtension lerp(ThemeExtension<AppColorsExtension>? other, double t) {
    if (other is! AppColorsExtension) return this;

    return AppColorsExtension(
      primary: Color.lerp(primary, other.primary, t)!,
      primaryHover: Color.lerp(primaryHover, other.primaryHover, t)!,
      primaryPressed: Color.lerp(primaryPressed, other.primaryPressed, t)!,
      primaryMuted: Color.lerp(primaryMuted, other.primaryMuted, t)!,
      primaryBorderMuted: Color.lerp(
        primaryBorderMuted,
        other.primaryBorderMuted,
        t,
      )!,
      focusRing: Color.lerp(focusRing, other.focusRing, t)!,
      accentValue: Color.lerp(accentValue, other.accentValue, t)!,
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceMuted: Color.lerp(surfaceMuted, other.surfaceMuted, t)!,
      border: Color.lerp(border, other.border, t)!,
      disabledBg: Color.lerp(disabledBg, other.disabledBg, t)!,
      disabledBorder: Color.lerp(disabledBorder, other.disabledBorder, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textOnMuted: Color.lerp(textOnMuted, other.textOnMuted, t)!,
      disabledText: Color.lerp(disabledText, other.disabledText, t)!,
      textInverse: Color.lerp(textInverse, other.textInverse, t)!,
      successBg: Color.lerp(successBg, other.successBg, t)!,
      warningBg: Color.lerp(warningBg, other.warningBg, t)!,
      dangerBg: Color.lerp(dangerBg, other.dangerBg, t)!,
      infoBg: Color.lerp(infoBg, other.infoBg, t)!,
      successBorder: Color.lerp(successBorder, other.successBorder, t)!,
      warningBorder: Color.lerp(warningBorder, other.warningBorder, t)!,
      dangerBorder: Color.lerp(dangerBorder, other.dangerBorder, t)!,
      infoBorder: Color.lerp(infoBorder, other.infoBorder, t)!,
      successText: Color.lerp(successText, other.successText, t)!,
      warningText: Color.lerp(warningText, other.warningText, t)!,
      dangerText: Color.lerp(dangerText, other.dangerText, t)!,
      infoText: Color.lerp(infoText, other.infoText, t)!,
    );
  }
}
