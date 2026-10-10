import 'package:flutter/material.dart';

@immutable
class AppRadiusExtension extends ThemeExtension<AppRadiusExtension> {
  final double sm; // 6 - checkbox, chip
  final double md; // 10 - buttons, inputs
  final double lg; // 16 - cards, bottom sheets
  final double card; // 16
  final double sheet; // 16
  final double pill; // 999

  const AppRadiusExtension({
    required this.sm,
    required this.md,
    required this.lg,
    required this.card,
    required this.sheet,
    required this.pill,
  });

  factory AppRadiusExtension.standard() {
    return const AppRadiusExtension(
      sm: 6,
      md: 10,
      lg: 16,
      card: 16,
      sheet: 16,
      pill: 999,
    );
  }

  @override
  AppRadiusExtension copyWith({
    double? sm,
    double? md,
    double? lg,
    double? card,
    double? sheet,
    double? pill,
  }) {
    return AppRadiusExtension(
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      card: card ?? this.card,
      sheet: sheet ?? this.sheet,
      pill: pill ?? this.pill,
    );
  }

  @override
  AppRadiusExtension lerp(ThemeExtension<AppRadiusExtension>? other, double t) {
    if (other is! AppRadiusExtension) return this;

    return AppRadiusExtension(
      sm: _lerp(sm, other.sm, t),
      md: _lerp(md, other.md, t),
      lg: _lerp(lg, other.lg, t),
      card: _lerp(card, other.card, t),
      sheet: _lerp(sheet, other.sheet, t),
      pill: _lerp(pill, other.pill, t),
    );
  }

  static double _lerp(double a, double b, double t) {
    return a + (b - a) * t;
  }
}
