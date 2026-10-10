import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Mahalli'**
  String get appName;

  /// No description provided for @tabHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get tabHome;

  /// No description provided for @tabSales.
  ///
  /// In en, this message translates to:
  /// **'Sales'**
  String get tabSales;

  /// No description provided for @tabInventory.
  ///
  /// In en, this message translates to:
  /// **'Inventory'**
  String get tabInventory;

  /// No description provided for @tabMore.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get tabMore;

  /// No description provided for @workingLocally.
  ///
  /// In en, this message translates to:
  /// **'Working locally'**
  String get workingLocally;

  /// No description provided for @todaySales.
  ///
  /// In en, this message translates to:
  /// **'Today\'s sales'**
  String get todaySales;

  /// No description provided for @todayProfit.
  ///
  /// In en, this message translates to:
  /// **'Today\'s profit'**
  String get todayProfit;

  /// No description provided for @saleCount.
  ///
  /// In en, this message translates to:
  /// **'Sales today'**
  String get saleCount;

  /// No description provided for @outstandingDebt.
  ///
  /// In en, this message translates to:
  /// **'Outstanding debt'**
  String get outstandingDebt;

  /// No description provided for @lowStockCount.
  ///
  /// In en, this message translates to:
  /// **'Low stock items'**
  String get lowStockCount;

  /// No description provided for @quickActions.
  ///
  /// In en, this message translates to:
  /// **'Quick actions'**
  String get quickActions;

  /// No description provided for @homeImportantAlerts.
  ///
  /// In en, this message translates to:
  /// **'Important alerts'**
  String get homeImportantAlerts;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @homeRecentSales.
  ///
  /// In en, this message translates to:
  /// **'Recent sales'**
  String get homeRecentSales;

  /// No description provided for @homeTodayExpenses.
  ///
  /// In en, this message translates to:
  /// **'Today\'s expenses'**
  String get homeTodayExpenses;

  /// No description provided for @homeStockCount.
  ///
  /// In en, this message translates to:
  /// **'Count stock'**
  String get homeStockCount;

  /// No description provided for @homeOutOfStock.
  ///
  /// In en, this message translates to:
  /// **'{count} out of stock'**
  String homeOutOfStock(Object count);

  /// No description provided for @homeStockRemaining.
  ///
  /// In en, this message translates to:
  /// **'Remaining: {quantity}'**
  String homeStockRemaining(Object quantity);

  /// No description provided for @homeStockThreshold.
  ///
  /// In en, this message translates to:
  /// **'Alert at: {quantity}'**
  String homeStockThreshold(Object quantity);

  /// No description provided for @homeNoAlerts.
  ///
  /// In en, this message translates to:
  /// **'No stock alerts right now'**
  String get homeNoAlerts;

  /// No description provided for @homeLocalData.
  ///
  /// In en, this message translates to:
  /// **'Data stays on this device'**
  String get homeLocalData;

  /// No description provided for @newSale.
  ///
  /// In en, this message translates to:
  /// **'New sale'**
  String get newSale;

  /// No description provided for @receivePayment.
  ///
  /// In en, this message translates to:
  /// **'Receive payment'**
  String get receivePayment;

  /// No description provided for @homeWelcome.
  ///
  /// In en, this message translates to:
  /// **'Ready for your first sale'**
  String get homeWelcome;

  /// No description provided for @homeWelcomeHint.
  ///
  /// In en, this message translates to:
  /// **'Add your first product to start selling from Mahalli.'**
  String get homeWelcomeHint;

  /// No description provided for @pullToRefresh.
  ///
  /// In en, this message translates to:
  /// **'Pull to refresh'**
  String get pullToRefresh;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @activate.
  ///
  /// In en, this message translates to:
  /// **'Activate'**
  String get activate;

  /// No description provided for @deactivate.
  ///
  /// In en, this message translates to:
  /// **'Deactivate'**
  String get deactivate;

  /// No description provided for @showInactive.
  ///
  /// In en, this message translates to:
  /// **'Show inactive'**
  String get showInactive;

  /// No description provided for @inactive.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get inactive;

  /// No description provided for @optional.
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get optional;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @none.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get none;

  /// No description provided for @comingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get comingSoon;

  /// No description provided for @genericError.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get genericError;

  /// No description provided for @requiredField.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get requiredField;

  /// No description provided for @invalidNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid number'**
  String get invalidNumber;

  /// No description provided for @invalidData.
  ///
  /// In en, this message translates to:
  /// **'Some of the entered data is invalid'**
  String get invalidData;

  /// No description provided for @itemNotFound.
  ///
  /// In en, this message translates to:
  /// **'This item no longer exists'**
  String get itemNotFound;

  /// No description provided for @nameInUse.
  ///
  /// In en, this message translates to:
  /// **'This name is already used'**
  String get nameInUse;

  /// No description provided for @barcodeInUse.
  ///
  /// In en, this message translates to:
  /// **'This barcode belongs to another product'**
  String get barcodeInUse;

  /// No description provided for @welcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Set up your shop'**
  String get welcomeTitle;

  /// No description provided for @welcomeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Just a few details. Everything works without internet.'**
  String get welcomeSubtitle;

  /// No description provided for @shopName.
  ///
  /// In en, this message translates to:
  /// **'Shop name'**
  String get shopName;

  /// No description provided for @businessType.
  ///
  /// In en, this message translates to:
  /// **'Business type'**
  String get businessType;

  /// No description provided for @currency.
  ///
  /// In en, this message translates to:
  /// **'Currency'**
  String get currency;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get started'**
  String get getStarted;

  /// No description provided for @shopNameHint.
  ///
  /// In en, this message translates to:
  /// **'For example, Neighborhood Market'**
  String get shopNameHint;

  /// No description provided for @onboardingHero.
  ///
  /// In en, this message translates to:
  /// **'Sell and manage your shop, even offline'**
  String get onboardingHero;

  /// No description provided for @onboardingStep.
  ///
  /// In en, this message translates to:
  /// **'Set up your shop — one step'**
  String get onboardingStep;

  /// No description provided for @onboardingLocal.
  ///
  /// In en, this message translates to:
  /// **'Your data stays on this device'**
  String get onboardingLocal;

  /// No description provided for @shopNameLength.
  ///
  /// In en, this message translates to:
  /// **'Use 2 to 60 characters'**
  String get shopNameLength;

  /// No description provided for @setupProgress.
  ///
  /// In en, this message translates to:
  /// **'Shop setup'**
  String get setupProgress;

  /// No description provided for @setupDone.
  ///
  /// In en, this message translates to:
  /// **'Your shop is ready'**
  String get setupDone;

  /// No description provided for @setupError.
  ///
  /// In en, this message translates to:
  /// **'Could not save your shop. Try again.'**
  String get setupError;

  /// No description provided for @pinOfferTitle.
  ///
  /// In en, this message translates to:
  /// **'Protect your shop with a PIN'**
  String get pinOfferTitle;

  /// No description provided for @pinOfferBody.
  ///
  /// In en, this message translates to:
  /// **'A PIN keeps your shop data private on this device. You can set one now or later in More.'**
  String get pinOfferBody;

  /// No description provided for @pinNoRecovery.
  ///
  /// In en, this message translates to:
  /// **'If you forget your PIN, restore your data from a backup. There is no PIN recovery.'**
  String get pinNoRecovery;

  /// No description provided for @setPin.
  ///
  /// In en, this message translates to:
  /// **'Set PIN'**
  String get setPin;

  /// No description provided for @skipForNow.
  ///
  /// In en, this message translates to:
  /// **'Skip for now'**
  String get skipForNow;

  /// No description provided for @pin.
  ///
  /// In en, this message translates to:
  /// **'PIN'**
  String get pin;

  /// No description provided for @confirmPin.
  ///
  /// In en, this message translates to:
  /// **'Confirm PIN'**
  String get confirmPin;

  /// No description provided for @currentPin.
  ///
  /// In en, this message translates to:
  /// **'Current PIN'**
  String get currentPin;

  /// No description provided for @newPin.
  ///
  /// In en, this message translates to:
  /// **'New PIN'**
  String get newPin;

  /// No description provided for @pinLengthError.
  ///
  /// In en, this message translates to:
  /// **'Enter 4 to 6 digits'**
  String get pinLengthError;

  /// No description provided for @pinMismatch.
  ///
  /// In en, this message translates to:
  /// **'PINs do not match'**
  String get pinMismatch;

  /// No description provided for @unlock.
  ///
  /// In en, this message translates to:
  /// **'Unlock'**
  String get unlock;

  /// No description provided for @wrongPin.
  ///
  /// In en, this message translates to:
  /// **'Incorrect PIN. Try again.'**
  String get wrongPin;

  /// No description provided for @pinLocked.
  ///
  /// In en, this message translates to:
  /// **'Too many attempts. Try again later.'**
  String get pinLocked;

  /// No description provided for @pinSettings.
  ///
  /// In en, this message translates to:
  /// **'PIN security'**
  String get pinSettings;

  /// No description provided for @changePin.
  ///
  /// In en, this message translates to:
  /// **'Change PIN'**
  String get changePin;

  /// No description provided for @disablePin.
  ///
  /// In en, this message translates to:
  /// **'Disable PIN'**
  String get disablePin;

  /// No description provided for @pinError.
  ///
  /// In en, this message translates to:
  /// **'Could not update the PIN. Try again.'**
  String get pinError;

  /// No description provided for @btGrocery.
  ///
  /// In en, this message translates to:
  /// **'Grocery / Mini-market'**
  String get btGrocery;

  /// No description provided for @btRetail.
  ///
  /// In en, this message translates to:
  /// **'Retail store'**
  String get btRetail;

  /// No description provided for @btStall.
  ///
  /// In en, this message translates to:
  /// **'Street stall'**
  String get btStall;

  /// No description provided for @btSalon.
  ///
  /// In en, this message translates to:
  /// **'Salon'**
  String get btSalon;

  /// No description provided for @btGarage.
  ///
  /// In en, this message translates to:
  /// **'Garage'**
  String get btGarage;

  /// No description provided for @btOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get btOther;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @addCategory.
  ///
  /// In en, this message translates to:
  /// **'Add category'**
  String get addCategory;

  /// No description provided for @editCategory.
  ///
  /// In en, this message translates to:
  /// **'Edit category'**
  String get editCategory;

  /// No description provided for @categoryName.
  ///
  /// In en, this message translates to:
  /// **'Category name'**
  String get categoryName;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @noCategories.
  ///
  /// In en, this message translates to:
  /// **'No categories yet'**
  String get noCategories;

  /// No description provided for @noCategoriesHint.
  ///
  /// In en, this message translates to:
  /// **'Categories help you organize products and services.'**
  String get noCategoriesHint;

  /// No description provided for @products.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get products;

  /// No description provided for @services.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get services;

  /// No description provided for @addProduct.
  ///
  /// In en, this message translates to:
  /// **'Add product'**
  String get addProduct;

  /// No description provided for @editProduct.
  ///
  /// In en, this message translates to:
  /// **'Edit product'**
  String get editProduct;

  /// No description provided for @addService.
  ///
  /// In en, this message translates to:
  /// **'Add service'**
  String get addService;

  /// No description provided for @editService.
  ///
  /// In en, this message translates to:
  /// **'Edit service'**
  String get editService;

  /// No description provided for @noProducts.
  ///
  /// In en, this message translates to:
  /// **'No products yet'**
  String get noProducts;

  /// No description provided for @noProductsHint.
  ///
  /// In en, this message translates to:
  /// **'Add your first product to start selling.'**
  String get noProductsHint;

  /// No description provided for @noServices.
  ///
  /// In en, this message translates to:
  /// **'No services yet'**
  String get noServices;

  /// No description provided for @noServicesHint.
  ///
  /// In en, this message translates to:
  /// **'Services are priced items without stock, like a haircut or a repair.'**
  String get noServicesHint;

  /// No description provided for @productName.
  ///
  /// In en, this message translates to:
  /// **'Product name'**
  String get productName;

  /// No description provided for @serviceName.
  ///
  /// In en, this message translates to:
  /// **'Service name'**
  String get serviceName;

  /// No description provided for @barcode.
  ///
  /// In en, this message translates to:
  /// **'Barcode'**
  String get barcode;

  /// No description provided for @sku.
  ///
  /// In en, this message translates to:
  /// **'SKU'**
  String get sku;

  /// No description provided for @unit.
  ///
  /// In en, this message translates to:
  /// **'Unit'**
  String get unit;

  /// No description provided for @purchasePrice.
  ///
  /// In en, this message translates to:
  /// **'Purchase price'**
  String get purchasePrice;

  /// No description provided for @sellingPrice.
  ///
  /// In en, this message translates to:
  /// **'Selling price'**
  String get sellingPrice;

  /// No description provided for @cost.
  ///
  /// In en, this message translates to:
  /// **'Cost'**
  String get cost;

  /// No description provided for @openingStock.
  ///
  /// In en, this message translates to:
  /// **'Opening stock'**
  String get openingStock;

  /// No description provided for @currentStock.
  ///
  /// In en, this message translates to:
  /// **'Current stock'**
  String get currentStock;

  /// No description provided for @stockManagedHint.
  ///
  /// In en, this message translates to:
  /// **'Stock changes are recorded from the Inventory screen.'**
  String get stockManagedHint;

  /// No description provided for @searchCatalog.
  ///
  /// In en, this message translates to:
  /// **'Search name, barcode or SKU'**
  String get searchCatalog;

  /// No description provided for @scanBarcode.
  ///
  /// In en, this message translates to:
  /// **'Scan barcode'**
  String get scanBarcode;

  /// No description provided for @scanHint.
  ///
  /// In en, this message translates to:
  /// **'Point the camera at a product barcode'**
  String get scanHint;

  /// No description provided for @cameraPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Camera access is unavailable. Allow camera access in device settings or enter the barcode manually.'**
  String get cameraPermissionDenied;

  /// No description provided for @barcodeNotFound.
  ///
  /// In en, this message translates to:
  /// **'No product has this barcode'**
  String get barcodeNotFound;

  /// No description provided for @addWithBarcode.
  ///
  /// In en, this message translates to:
  /// **'Add product with this barcode'**
  String get addWithBarcode;

  /// No description provided for @loadMore.
  ///
  /// In en, this message translates to:
  /// **'Load more'**
  String get loadMore;

  /// No description provided for @catalogDetails.
  ///
  /// In en, this message translates to:
  /// **'Item details'**
  String get catalogDetails;

  /// No description provided for @enterPrice.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid price'**
  String get enterPrice;

  /// No description provided for @priceMustBePositive.
  ///
  /// In en, this message translates to:
  /// **'Selling price must be greater than zero'**
  String get priceMustBePositive;

  /// No description provided for @selectCategory.
  ///
  /// In en, this message translates to:
  /// **'Select category'**
  String get selectCategory;

  /// No description provided for @saveFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not save. Try again.'**
  String get saveFailed;

  /// No description provided for @lowStockThreshold.
  ///
  /// In en, this message translates to:
  /// **'Low stock alert at'**
  String get lowStockThreshold;

  /// No description provided for @stockLow.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get stockLow;

  /// No description provided for @stockOut.
  ///
  /// In en, this message translates to:
  /// **'Out'**
  String get stockOut;

  /// No description provided for @stockNegative.
  ///
  /// In en, this message translates to:
  /// **'Negative'**
  String get stockNegative;

  /// No description provided for @stock.
  ///
  /// In en, this message translates to:
  /// **'Stock'**
  String get stock;

  /// No description provided for @stockAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get stockAll;

  /// No description provided for @stockHealthy.
  ///
  /// In en, this message translates to:
  /// **'In stock'**
  String get stockHealthy;

  /// No description provided for @stockSearch.
  ///
  /// In en, this message translates to:
  /// **'Search products'**
  String get stockSearch;

  /// No description provided for @stockNoMatches.
  ///
  /// In en, this message translates to:
  /// **'No products match this filter'**
  String get stockNoMatches;

  /// No description provided for @stockHistory.
  ///
  /// In en, this message translates to:
  /// **'Movement history'**
  String get stockHistory;

  /// No description provided for @stockNoHistory.
  ///
  /// In en, this message translates to:
  /// **'No stock movements yet'**
  String get stockNoHistory;

  /// No description provided for @addStock.
  ///
  /// In en, this message translates to:
  /// **'Add stock'**
  String get addStock;

  /// No description provided for @adjustStock.
  ///
  /// In en, this message translates to:
  /// **'Adjust counted stock'**
  String get adjustStock;

  /// No description provided for @recordDamage.
  ///
  /// In en, this message translates to:
  /// **'Record damage'**
  String get recordDamage;

  /// No description provided for @stockQuantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get stockQuantity;

  /// No description provided for @countedStock.
  ///
  /// In en, this message translates to:
  /// **'Counted stock'**
  String get countedStock;

  /// No description provided for @stockReason.
  ///
  /// In en, this message translates to:
  /// **'Reason'**
  String get stockReason;

  /// No description provided for @stockNote.
  ///
  /// In en, this message translates to:
  /// **'Note (optional)'**
  String get stockNote;

  /// No description provided for @damageReasonRequired.
  ///
  /// In en, this message translates to:
  /// **'Enter a reason for damaged stock'**
  String get damageReasonRequired;

  /// No description provided for @damageExceedsStock.
  ///
  /// In en, this message translates to:
  /// **'Damage quantity exceeds current stock'**
  String get damageExceedsStock;

  /// No description provided for @stockPositiveRequired.
  ///
  /// In en, this message translates to:
  /// **'Enter a quantity greater than zero'**
  String get stockPositiveRequired;

  /// No description provided for @movementOpening.
  ///
  /// In en, this message translates to:
  /// **'Opening stock'**
  String get movementOpening;

  /// No description provided for @movementPurchase.
  ///
  /// In en, this message translates to:
  /// **'Stock added'**
  String get movementPurchase;

  /// No description provided for @movementSale.
  ///
  /// In en, this message translates to:
  /// **'Sale'**
  String get movementSale;

  /// No description provided for @movementReturn.
  ///
  /// In en, this message translates to:
  /// **'Return'**
  String get movementReturn;

  /// No description provided for @movementAdjustment.
  ///
  /// In en, this message translates to:
  /// **'Adjustment'**
  String get movementAdjustment;

  /// No description provided for @movementDamage.
  ///
  /// In en, this message translates to:
  /// **'Damage'**
  String get movementDamage;

  /// No description provided for @customers.
  ///
  /// In en, this message translates to:
  /// **'Customers'**
  String get customers;

  /// No description provided for @customer.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get customer;

  /// No description provided for @addCustomer.
  ///
  /// In en, this message translates to:
  /// **'Add customer'**
  String get addCustomer;

  /// No description provided for @editCustomer.
  ///
  /// In en, this message translates to:
  /// **'Edit customer'**
  String get editCustomer;

  /// No description provided for @customerName.
  ///
  /// In en, this message translates to:
  /// **'Customer name'**
  String get customerName;

  /// No description provided for @customerPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone (optional)'**
  String get customerPhone;

  /// No description provided for @customerNotes.
  ///
  /// In en, this message translates to:
  /// **'Notes (optional)'**
  String get customerNotes;

  /// No description provided for @searchCustomers.
  ///
  /// In en, this message translates to:
  /// **'Search name or phone'**
  String get searchCustomers;

  /// No description provided for @sortByName.
  ///
  /// In en, this message translates to:
  /// **'Sort by name'**
  String get sortByName;

  /// No description provided for @sortByDebt.
  ///
  /// In en, this message translates to:
  /// **'Sort by debt'**
  String get sortByDebt;

  /// No description provided for @noCustomers.
  ///
  /// In en, this message translates to:
  /// **'No customers yet'**
  String get noCustomers;

  /// No description provided for @noCustomersHint.
  ///
  /// In en, this message translates to:
  /// **'Add a customer to track credit sales and payments.'**
  String get noCustomersHint;

  /// No description provided for @customerBalance.
  ///
  /// In en, this message translates to:
  /// **'Balance owed'**
  String get customerBalance;

  /// No description provided for @debtHistory.
  ///
  /// In en, this message translates to:
  /// **'Debt history'**
  String get debtHistory;

  /// No description provided for @noDebtHistory.
  ///
  /// In en, this message translates to:
  /// **'No debt movements yet'**
  String get noDebtHistory;

  /// No description provided for @recordPayment.
  ///
  /// In en, this message translates to:
  /// **'Record payment'**
  String get recordPayment;

  /// No description provided for @recordAdjustment.
  ///
  /// In en, this message translates to:
  /// **'Adjust balance'**
  String get recordAdjustment;

  /// No description provided for @adjustmentIncrease.
  ///
  /// In en, this message translates to:
  /// **'Increase'**
  String get adjustmentIncrease;

  /// No description provided for @adjustmentDecrease.
  ///
  /// In en, this message translates to:
  /// **'Decrease'**
  String get adjustmentDecrease;

  /// No description provided for @paymentAmount.
  ///
  /// In en, this message translates to:
  /// **'Payment amount'**
  String get paymentAmount;

  /// No description provided for @adjustmentAmount.
  ///
  /// In en, this message translates to:
  /// **'Adjustment amount'**
  String get adjustmentAmount;

  /// No description provided for @adjustmentReason.
  ///
  /// In en, this message translates to:
  /// **'Reason for adjustment'**
  String get adjustmentReason;

  /// No description provided for @adjustmentReasonRequired.
  ///
  /// In en, this message translates to:
  /// **'Enter a reason for the adjustment'**
  String get adjustmentReasonRequired;

  /// No description provided for @overpaymentError.
  ///
  /// In en, this message translates to:
  /// **'This amount exceeds the customer\'s balance'**
  String get overpaymentError;

  /// No description provided for @outstandingDebtWarning.
  ///
  /// In en, this message translates to:
  /// **'This customer still has a balance. Deactivate anyway?'**
  String get outstandingDebtWarning;

  /// No description provided for @duplicateCustomerWarning.
  ///
  /// In en, this message translates to:
  /// **'Another customer has this name. Save anyway?'**
  String get duplicateCustomerWarning;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @sellOnCredit.
  ///
  /// In en, this message translates to:
  /// **'Sell on credit'**
  String get sellOnCredit;

  /// No description provided for @debtsOverview.
  ///
  /// In en, this message translates to:
  /// **'Debts overview'**
  String get debtsOverview;

  /// No description provided for @largestBalances.
  ///
  /// In en, this message translates to:
  /// **'Largest balances'**
  String get largestBalances;

  /// No description provided for @debtTotal.
  ///
  /// In en, this message translates to:
  /// **'Total outstanding'**
  String get debtTotal;

  /// No description provided for @customersAndDebts.
  ///
  /// In en, this message translates to:
  /// **'Customers and debts'**
  String get customersAndDebts;

  /// No description provided for @debtCustomerCount.
  ///
  /// In en, this message translates to:
  /// **'{count} customers with a balance'**
  String debtCustomerCount(Object count);

  /// No description provided for @allCustomers.
  ///
  /// In en, this message translates to:
  /// **'All customers'**
  String get allCustomers;

  /// No description provided for @ledgerSaleCredit.
  ///
  /// In en, this message translates to:
  /// **'Credit sale'**
  String get ledgerSaleCredit;

  /// No description provided for @ledgerPayment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get ledgerPayment;

  /// No description provided for @ledgerReturn.
  ///
  /// In en, this message translates to:
  /// **'Return'**
  String get ledgerReturn;

  /// No description provided for @ledgerAdjustment.
  ///
  /// In en, this message translates to:
  /// **'Adjustment'**
  String get ledgerAdjustment;

  /// No description provided for @paymentNote.
  ///
  /// In en, this message translates to:
  /// **'Note (optional)'**
  String get paymentNote;

  /// No description provided for @unitPiece.
  ///
  /// In en, this message translates to:
  /// **'Piece'**
  String get unitPiece;

  /// No description provided for @unitKg.
  ///
  /// In en, this message translates to:
  /// **'Kilogram'**
  String get unitKg;

  /// No description provided for @unitGram.
  ///
  /// In en, this message translates to:
  /// **'Gram'**
  String get unitGram;

  /// No description provided for @unitLiter.
  ///
  /// In en, this message translates to:
  /// **'Liter'**
  String get unitLiter;

  /// No description provided for @unitMeter.
  ///
  /// In en, this message translates to:
  /// **'Meter'**
  String get unitMeter;

  /// No description provided for @unitBox.
  ///
  /// In en, this message translates to:
  /// **'Box'**
  String get unitBox;

  /// No description provided for @unitCarton.
  ///
  /// In en, this message translates to:
  /// **'Carton'**
  String get unitCarton;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

  /// No description provided for @emptyCart.
  ///
  /// In en, this message translates to:
  /// **'Your cart is empty'**
  String get emptyCart;

  /// No description provided for @salesItemCount.
  ///
  /// In en, this message translates to:
  /// **'Items: {count}'**
  String salesItemCount(Object count);

  /// No description provided for @salesClearCart.
  ///
  /// In en, this message translates to:
  /// **'Clear cart'**
  String get salesClearCart;

  /// No description provided for @salesAdd.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get salesAdd;

  /// No description provided for @salesAvailable.
  ///
  /// In en, this message translates to:
  /// **'Available: {quantity}'**
  String salesAvailable(Object quantity);

  /// No description provided for @salesNoStock.
  ///
  /// In en, this message translates to:
  /// **'No stock tracking'**
  String get salesNoStock;

  /// No description provided for @emptyCartHint.
  ///
  /// In en, this message translates to:
  /// **'Search for a product or service to add it.'**
  String get emptyCartHint;

  /// No description provided for @checkout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkout;

  /// No description provided for @checkoutItems.
  ///
  /// In en, this message translates to:
  /// **'{count} items'**
  String checkoutItems(Object count);

  /// No description provided for @checkoutCashFull.
  ///
  /// In en, this message translates to:
  /// **'Cash in full'**
  String get checkoutCashFull;

  /// No description provided for @checkoutCreditFull.
  ///
  /// In en, this message translates to:
  /// **'Credit in full'**
  String get checkoutCreditFull;

  /// No description provided for @checkoutPartial.
  ///
  /// In en, this message translates to:
  /// **'Partial payment'**
  String get checkoutPartial;

  /// No description provided for @checkoutCustomerDebt.
  ///
  /// In en, this message translates to:
  /// **'Customer (required for credit)'**
  String get checkoutCustomerDebt;

  /// No description provided for @checkoutPaidNow.
  ///
  /// In en, this message translates to:
  /// **'Paid now'**
  String get checkoutPaidNow;

  /// No description provided for @checkoutDue.
  ///
  /// In en, this message translates to:
  /// **'Remaining due'**
  String get checkoutDue;

  /// No description provided for @checkoutLocalSave.
  ///
  /// In en, this message translates to:
  /// **'Saved locally • works offline'**
  String get checkoutLocalSave;

  /// No description provided for @saleSuccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Sale completed!'**
  String get saleSuccessTitle;

  /// No description provided for @receiptSavedLocal.
  ///
  /// In en, this message translates to:
  /// **'Saved on this device'**
  String get receiptSavedLocal;

  /// No description provided for @receiptPrintOptional.
  ///
  /// In en, this message translates to:
  /// **'Printing is optional. The sale is already saved.'**
  String get receiptPrintOptional;

  /// No description provided for @inventoryMovementToday.
  ///
  /// In en, this message translates to:
  /// **'Stock movements'**
  String get inventoryMovementToday;

  /// No description provided for @inventoryQuickCount.
  ///
  /// In en, this message translates to:
  /// **'Quick stock count'**
  String get inventoryQuickCount;

  /// No description provided for @subtotal.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get subtotal;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get payment;

  /// No description provided for @cash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get cash;

  /// No description provided for @partial.
  ///
  /// In en, this message translates to:
  /// **'Partial'**
  String get partial;

  /// No description provided for @credit.
  ///
  /// In en, this message translates to:
  /// **'Credit'**
  String get credit;

  /// No description provided for @paidAmount.
  ///
  /// In en, this message translates to:
  /// **'Paid amount'**
  String get paidAmount;

  /// No description provided for @remaining.
  ///
  /// In en, this message translates to:
  /// **'Remaining'**
  String get remaining;

  /// No description provided for @change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get change;

  /// No description provided for @selectCustomer.
  ///
  /// In en, this message translates to:
  /// **'Select customer'**
  String get selectCustomer;

  /// No description provided for @customerRequired.
  ///
  /// In en, this message translates to:
  /// **'Select a customer for the remaining balance'**
  String get customerRequired;

  /// No description provided for @completeSale.
  ///
  /// In en, this message translates to:
  /// **'Complete sale'**
  String get completeSale;

  /// No description provided for @saleCompleted.
  ///
  /// In en, this message translates to:
  /// **'Sale completed'**
  String get saleCompleted;

  /// No description provided for @saleHistory.
  ///
  /// In en, this message translates to:
  /// **'Sales history'**
  String get saleHistory;

  /// No description provided for @noSales.
  ///
  /// In en, this message translates to:
  /// **'No sales yet'**
  String get noSales;

  /// No description provided for @saleDetails.
  ///
  /// In en, this message translates to:
  /// **'Sale details'**
  String get saleDetails;

  /// No description provided for @saleNumber.
  ///
  /// In en, this message translates to:
  /// **'Sale #'**
  String get saleNumber;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// No description provided for @saveDraft.
  ///
  /// In en, this message translates to:
  /// **'Save draft'**
  String get saveDraft;

  /// No description provided for @draftSaved.
  ///
  /// In en, this message translates to:
  /// **'Draft saved'**
  String get draftSaved;

  /// No description provided for @restoreDraft.
  ///
  /// In en, this message translates to:
  /// **'Restore saved cart?'**
  String get restoreDraft;

  /// No description provided for @restore.
  ///
  /// In en, this message translates to:
  /// **'Restore'**
  String get restore;

  /// No description provided for @discard.
  ///
  /// In en, this message translates to:
  /// **'Discard'**
  String get discard;

  /// No description provided for @lowStockSaleWarning.
  ///
  /// In en, this message translates to:
  /// **'This sale will make stock negative.'**
  String get lowStockSaleWarning;

  /// No description provided for @invalidPayment.
  ///
  /// In en, this message translates to:
  /// **'Enter a payment between zero and the total'**
  String get invalidPayment;

  /// No description provided for @saleFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not complete the sale. Your cart is still here.'**
  String get saleFailed;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @shopSettings.
  ///
  /// In en, this message translates to:
  /// **'Shop details'**
  String get shopSettings;

  /// No description provided for @shopSettingsHint.
  ///
  /// In en, this message translates to:
  /// **'Name, business type and currency'**
  String get shopSettingsHint;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @lightTheme.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get lightTheme;

  /// No description provided for @darkTheme.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get darkTheme;

  /// No description provided for @numberDigits.
  ///
  /// In en, this message translates to:
  /// **'Number digits'**
  String get numberDigits;

  /// No description provided for @westernDigits.
  ///
  /// In en, this message translates to:
  /// **'Western digits (0–9)'**
  String get westernDigits;

  /// No description provided for @arabicIndicDigits.
  ///
  /// In en, this message translates to:
  /// **'Arabic-Indic digits (٠–٩)'**
  String get arabicIndicDigits;

  /// No description provided for @securityAndData.
  ///
  /// In en, this message translates to:
  /// **'Security & data'**
  String get securityAndData;

  /// No description provided for @backupAndRestore.
  ///
  /// In en, this message translates to:
  /// **'Backup & restore'**
  String get backupAndRestore;

  /// No description provided for @backupSettingsHint.
  ///
  /// In en, this message translates to:
  /// **'Create or restore a local copy'**
  String get backupSettingsHint;

  /// No description provided for @receiptSettings.
  ///
  /// In en, this message translates to:
  /// **'Receipts & printing'**
  String get receiptSettings;

  /// No description provided for @receiptSettingsHint.
  ///
  /// In en, this message translates to:
  /// **'Preview, share and print saved receipts'**
  String get receiptSettingsHint;

  /// No description provided for @reportSettings.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get reportSettings;

  /// No description provided for @reportSettingsHint.
  ///
  /// In en, this message translates to:
  /// **'Sales, profit, stock and debt'**
  String get reportSettingsHint;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @aboutHint.
  ///
  /// In en, this message translates to:
  /// **'Version, privacy and licences'**
  String get aboutHint;

  /// No description provided for @aboutMahalli.
  ///
  /// In en, this message translates to:
  /// **'About Mahalli'**
  String get aboutMahalli;

  /// No description provided for @appVersion.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get appVersion;

  /// No description provided for @offlineFirst.
  ///
  /// In en, this message translates to:
  /// **'Built to work locally, without an internet connection.'**
  String get offlineFirst;

  /// No description provided for @privacyStatement.
  ///
  /// In en, this message translates to:
  /// **'Your shop and customer data stay on this device unless you create and share a backup.'**
  String get privacyStatement;

  /// No description provided for @openSourceLicenses.
  ///
  /// In en, this message translates to:
  /// **'Open-source licences'**
  String get openSourceLicenses;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save changes'**
  String get saveChanges;

  /// No description provided for @shopUpdated.
  ///
  /// In en, this message translates to:
  /// **'Shop details updated'**
  String get shopUpdated;

  /// No description provided for @shopUpdateFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not update shop details. Try again.'**
  String get shopUpdateFailed;

  /// No description provided for @printerSettingsUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Printer setup is not available yet. You can still preview, share and print each saved receipt.'**
  String get printerSettingsUnavailable;

  /// No description provided for @expenses.
  ///
  /// In en, this message translates to:
  /// **'Expenses'**
  String get expenses;

  /// No description provided for @todayExpenses.
  ///
  /// In en, this message translates to:
  /// **'Today\'s expenses'**
  String get todayExpenses;

  /// No description provided for @recentExpenses.
  ///
  /// In en, this message translates to:
  /// **'Recent expenses'**
  String get recentExpenses;

  /// No description provided for @weeklySales.
  ///
  /// In en, this message translates to:
  /// **'Sales this week'**
  String get weeklySales;

  /// No description provided for @profitQuestion.
  ///
  /// In en, this message translates to:
  /// **'How much did I earn?'**
  String get profitQuestion;

  /// No description provided for @addExpense.
  ///
  /// In en, this message translates to:
  /// **'Add expense'**
  String get addExpense;

  /// No description provided for @expenseCategory.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get expenseCategory;

  /// No description provided for @expenseAmount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get expenseAmount;

  /// No description provided for @expenseDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get expenseDescription;

  /// No description provided for @expenseCategories.
  ///
  /// In en, this message translates to:
  /// **'Expense categories'**
  String get expenseCategories;

  /// No description provided for @addExpenseCategory.
  ///
  /// In en, this message translates to:
  /// **'Add category'**
  String get addExpenseCategory;

  /// No description provided for @editExpenseCategory.
  ///
  /// In en, this message translates to:
  /// **'Edit category'**
  String get editExpenseCategory;

  /// No description provided for @expenseCategoryName.
  ///
  /// In en, this message translates to:
  /// **'Category name'**
  String get expenseCategoryName;

  /// No description provided for @expenseCategoryEmpty.
  ///
  /// In en, this message translates to:
  /// **'No expense categories yet'**
  String get expenseCategoryEmpty;

  /// No description provided for @expenseCategoryHint.
  ///
  /// In en, this message translates to:
  /// **'Add a category to record your first expense.'**
  String get expenseCategoryHint;

  /// No description provided for @expenseSelectCategory.
  ///
  /// In en, this message translates to:
  /// **'Select an expense category'**
  String get expenseSelectCategory;

  /// No description provided for @expensePositiveAmount.
  ///
  /// In en, this message translates to:
  /// **'Enter an amount greater than zero'**
  String get expensePositiveAmount;

  /// No description provided for @expenseDate.
  ///
  /// In en, this message translates to:
  /// **'Expense date'**
  String get expenseDate;

  /// No description provided for @expenseFutureDate.
  ///
  /// In en, this message translates to:
  /// **'You cannot record an expense for a future date'**
  String get expenseFutureDate;

  /// No description provided for @editExpense.
  ///
  /// In en, this message translates to:
  /// **'Edit expense'**
  String get editExpense;

  /// No description provided for @expenseSaved.
  ///
  /// In en, this message translates to:
  /// **'Expense saved'**
  String get expenseSaved;

  /// No description provided for @expenseUpdated.
  ///
  /// In en, this message translates to:
  /// **'Expense updated'**
  String get expenseUpdated;

  /// No description provided for @expenseNoEntries.
  ///
  /// In en, this message translates to:
  /// **'No expenses in this month'**
  String get expenseNoEntries;

  /// No description provided for @reports.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get reports;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// No description provided for @week.
  ///
  /// In en, this message translates to:
  /// **'Week'**
  String get week;

  /// No description provided for @month.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get month;

  /// No description provided for @salesCountReport.
  ///
  /// In en, this message translates to:
  /// **'Sales count'**
  String get salesCountReport;

  /// No description provided for @returns.
  ///
  /// In en, this message translates to:
  /// **'Returns'**
  String get returns;

  /// No description provided for @revenue.
  ///
  /// In en, this message translates to:
  /// **'Revenue'**
  String get revenue;

  /// No description provided for @costOfGoods.
  ///
  /// In en, this message translates to:
  /// **'Cost of goods'**
  String get costOfGoods;

  /// No description provided for @grossProfit.
  ///
  /// In en, this message translates to:
  /// **'Gross profit'**
  String get grossProfit;

  /// No description provided for @netProfit.
  ///
  /// In en, this message translates to:
  /// **'Net profit'**
  String get netProfit;

  /// No description provided for @receipt.
  ///
  /// In en, this message translates to:
  /// **'Receipt'**
  String get receipt;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @print.
  ///
  /// In en, this message translates to:
  /// **'Print'**
  String get print;

  /// No description provided for @returnItems.
  ///
  /// In en, this message translates to:
  /// **'Return items'**
  String get returnItems;

  /// No description provided for @confirmReturn.
  ///
  /// In en, this message translates to:
  /// **'Confirm return'**
  String get confirmReturn;

  /// No description provided for @backupCreated.
  ///
  /// In en, this message translates to:
  /// **'Backup created'**
  String get backupCreated;

  /// No description provided for @backupFailed.
  ///
  /// In en, this message translates to:
  /// **'Backup failed'**
  String get backupFailed;

  /// No description provided for @restoreComplete.
  ///
  /// In en, this message translates to:
  /// **'Restore complete'**
  String get restoreComplete;

  /// No description provided for @restartToFinishRestore.
  ///
  /// In en, this message translates to:
  /// **'Restart the app to open restored data.'**
  String get restartToFinishRestore;

  /// No description provided for @invalidBackup.
  ///
  /// In en, this message translates to:
  /// **'Invalid or unreadable backup'**
  String get invalidBackup;

  /// No description provided for @backupWarning.
  ///
  /// In en, this message translates to:
  /// **'Backups contain your shop and customer data. Keep them safe.'**
  String get backupWarning;

  /// No description provided for @createBackup.
  ///
  /// In en, this message translates to:
  /// **'Create backup'**
  String get createBackup;

  /// No description provided for @restoreBackup.
  ///
  /// In en, this message translates to:
  /// **'Restore backup'**
  String get restoreBackup;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @shareBackup.
  ///
  /// In en, this message translates to:
  /// **'Share backup'**
  String get shareBackup;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
