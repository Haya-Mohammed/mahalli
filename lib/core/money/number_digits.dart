import 'package:mahalli/core/config/preferences/number_digits_storage_service.dart';

String formatDigits(String value, NumberDigits digits) {
  if (digits == NumberDigits.western) return value;
  const western = '0123456789';
  const arabicIndic = '٠١٢٣٤٥٦٧٨٩';
  return value.replaceAllMapped(
    RegExp(r'\d'),
    (match) => arabicIndic[western.indexOf(match.group(0)!)],
  );
}
