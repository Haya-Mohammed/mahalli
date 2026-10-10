import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/core/config/locale/l10n/app_localizations.dart';
import 'package:mahalli/core/config/preferences/number_digits_cubit.dart';
import 'package:mahalli/core/config/preferences/number_digits_storage_service.dart';
import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/core/error/failure.dart';
import 'package:mahalli/core/money/currency.dart';
import 'package:mahalli/core/money/money.dart';
import 'package:mahalli/core/money/number_digits.dart';
import 'package:mahalli/features/onboarding/presentation/cubit/shop_cubit.dart';

String currencySymbol(String code) => CurrencyCatalog.symbol(code);

extension L10nContext on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;

  /// Formats money with the shop currency symbol.
  String money(Money m) {
    final code = BlocProvider.of<ShopCubit>(this).state.shop?.currency ?? 'ILS';
    var digits = NumberDigits.western;
    try {
      digits = BlocProvider.of<NumberDigitsCubit>(this).state;
    } catch (_) {
      // Standalone widget previews can omit the app-wide preference provider.
    }
    return '${currencySymbol(code)} ${formatDigits(m.format(currency: code), digits)}';
  }
}

extension Labels on AppLocalizations {
  String unitLabel(UnitType u) => switch (u) {
    UnitType.piece => unitPiece,
    UnitType.kg => unitKg,
    UnitType.gram => unitGram,
    UnitType.liter => unitLiter,
    UnitType.meter => unitMeter,
    UnitType.box => unitBox,
    UnitType.carton => unitCarton,
  };

  String businessTypeLabel(BusinessType t) => switch (t) {
    BusinessType.grocery => btGrocery,
    BusinessType.retail => btRetail,
    BusinessType.stall => btStall,
    BusinessType.salon => btSalon,
    BusinessType.garage => btGarage,
    BusinessType.other => btOther,
  };

  String failureText(Failure f) => switch (f) {
    DuplicateBarcodeFailure() => barcodeInUse,
    DuplicateNameFailure() => nameInUse,
    ValidationFailure() => invalidData,
    NotFoundFailure() => itemNotFound,
    InsufficientStockFailure() => damageExceedsStock,
    OverpaymentFailure() => overpaymentError,
    OutstandingDebtFailure() => outstandingDebtWarning,
    DatabaseFailure() || BackupFailure() || StorageFailure() => genericError,
  };
}
