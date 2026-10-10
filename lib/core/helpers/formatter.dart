import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppFormatter {
  const AppFormatter._();

  static String fmtDate(BuildContext context, DateTime date) =>
      DateFormat.yMd(Localizations.localeOf(context).languageCode).add_jm().format(date.toLocal());
}
