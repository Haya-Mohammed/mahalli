import 'currency.dart';

/// Normalizes user-typed numbers: Arabic-Indic / Persian digits -> ASCII,
/// Arabic decimal separator and comma -> '.', thousands separators dropped.
String normalizeNumeric(String input) {
  const arabic = '٠١٢٣٤٥٦٧٨٩';
  const persian = '۰۱۲۳۴۵۶۷۸۹';
  final b = StringBuffer();
  for (final rune in input.trim().runes) {
    final c = String.fromCharCode(rune);
    final a = arabic.indexOf(c);
    final p = persian.indexOf(c);
    if (a >= 0) {
      b.write(a);
    } else if (p >= 0) {
      b.write(p);
    } else if (c == ',' || c == '٫') {
      b.write('.');
    } else if (c != '٬' && c != ' ') {
      b.write(c);
    }
  }
  return b.toString();
}

/// Money is stored as an int in the shop currency's minor units.
/// Never use double for prices, totals, debt or profit.
extension type const Money(int minor) {
  static const zero = Money(0);

  /// Returns null for anything that is not a non-negative amount with
  /// no more decimals than the selected currency supports.
  static Money? tryParse(String? text, {String currency = 'ILS'}) {
    final t = normalizeNumeric(text ?? '');
    final decimals = CurrencyCatalog.decimalPlaces(currency);
    final parts = t.split('.');
    if (t.isEmpty ||
        t == '.' ||
        !RegExp(r'^\d*\.?\d*$').hasMatch(t) ||
        parts.length > 2 ||
        (parts.length == 2 && parts[1].length > decimals)) {
      return null;
    }
    return Money.fromDecimal(t, currency: currency);
  }

  factory Money.fromDecimal(String text, {String currency = 'ILS'}) {
    final t = text.trim().replaceAll(',', '.');
    final neg = t.startsWith('-');
    final parts = (neg ? t.substring(1) : t).split('.');
    final decimals = CurrencyCatalog.decimalPlaces(currency);
    if (parts.length > 2 || (parts.length == 2 && parts[1].length > decimals)) {
      throw const FormatException('Too many decimal places');
    }
    final whole = int.parse(parts[0].isEmpty ? '0' : parts[0]);
    final frac = parts.length > 1
        ? parts[1].padRight(decimals, '0')
        : ''.padRight(decimals, '0');
    final v = whole * CurrencyCatalog.factor(currency) + int.parse(frac);
    return Money(neg ? -v : v);
  }

  Money operator +(Money o) => Money(minor + o.minor);
  Money operator -(Money o) => Money(minor - o.minor);
  Money operator -() => Money(-minor);

  /// Line total: price x quantity, rounded half away from zero.
  Money times(Quantity q) {
    final n = minor * q.milli;
    final r = (n.abs() + Quantity.scale ~/ 2) ~/ Quantity.scale;
    return Money(n < 0 ? -r : r);
  }

  String format({String currency = 'ILS'}) {
    final abs = minor.abs();
    final scale = CurrencyCatalog.factor(currency);
    final decimals = CurrencyCatalog.decimalPlaces(currency);
    final s =
        '${abs ~/ scale}.${(abs % scale).toString().padLeft(decimals, '0')}';
    return minor < 0 ? '-$s' : s;
  }
}

/// Quantity stored in thousandths of a unit (1.25 kg = 1250).
/// Avoids double drift such as 0.1 + 0.2.
extension type const Quantity(int milli) {
  static const zero = Quantity(0);
  static const int scale = 1000;

  /// Non-negative quantity with at most 3 decimals, else null.
  static Quantity? tryParse(String? text) {
    final t = normalizeNumeric(text ?? '');
    if (t.isEmpty || t == '.' || !RegExp(r'^\d*\.?\d{0,3}$').hasMatch(t)) {
      return null;
    }
    return Quantity.fromDecimal(t);
  }

  factory Quantity.fromDecimal(String text) {
    final t = text.trim().replaceAll(',', '.');
    final neg = t.startsWith('-');
    final parts = (neg ? t.substring(1) : t).split('.');
    final whole = int.parse(parts[0].isEmpty ? '0' : parts[0]);
    final frac = parts.length > 1
        ? parts[1].padRight(3, '0').substring(0, 3)
        : '000';
    final v = whole * scale + int.parse(frac);
    return Quantity(neg ? -v : v);
  }

  Quantity operator +(Quantity o) => Quantity(milli + o.milli);
  Quantity operator -(Quantity o) => Quantity(milli - o.milli);
  bool get isNegative => milli < 0;

  String format() {
    final abs = milli.abs();
    final frac = (abs % scale)
        .toString()
        .padLeft(3, '0')
        .replaceFirst(RegExp(r'0+$'), '');
    final s = frac.isEmpty ? '${abs ~/ scale}' : '${abs ~/ scale}.$frac';
    return milli < 0 ? '-$s' : s;
  }
}
