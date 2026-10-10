/// Supported currencies and their number of minor-unit decimal places.
class CurrencyCatalog {
  CurrencyCatalog._();

  static const decimals = <String, int>{'ILS': 2, 'USD': 2, 'EUR': 2, 'JOD': 3};

  static const symbols = <String, String>{
    'ILS': '₪',
    'USD': r'$',
    'EUR': '€',
    'JOD': 'JD',
  };

  static bool isSupported(String code) => decimals.containsKey(code);
  static int decimalPlaces(String code) =>
      decimals[code] ?? (throw ArgumentError.value(code, 'code'));
  static int factor(String code) => switch (decimalPlaces(code)) {
    2 => 100,
    3 => 1000,
    _ => throw StateError('Unsupported currency precision'),
  };
  static String symbol(String code) => symbols[code] ?? code;
}
