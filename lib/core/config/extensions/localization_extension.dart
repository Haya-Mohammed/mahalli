import 'package:flutter/material.dart';
import 'package:mahalli/core/config/locale/generated/l10n.dart';

extension LocalizationExtension on BuildContext {
  S get text => S.of(this);
}
