import 'package:flutter/material.dart';
import 'package:mahalli/core/config/extensions/colors_extensions.dart';
import 'package:mahalli/core/config/extensions/radius_extension.dart';
import 'package:mahalli/core/config/extensions/spacing_extension.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  AppColorsExtension get colors => theme.extension<AppColorsExtension>()!;

  AppSpacingExtension get spacing => theme.extension<AppSpacingExtension>()!;

  AppRadiusExtension get radius => theme.extension<AppRadiusExtension>()!;

  bool get isDarkMode => theme.brightness == Brightness.dark;
}
