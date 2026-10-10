// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Mahalli';

  @override
  String get tabHome => 'Home';

  @override
  String get tabSales => 'Sales';

  @override
  String get tabInventory => 'Inventory';

  @override
  String get tabMore => 'More';

  @override
  String get workingLocally => 'Working locally';

  @override
  String get todaySales => 'Today\'s sales';

  @override
  String get todayProfit => 'Today\'s profit';

  @override
  String get saleCount => 'Sales today';

  @override
  String get outstandingDebt => 'Outstanding debt';

  @override
  String get lowStockCount => 'Low stock items';

  @override
  String get quickActions => 'Quick actions';

  @override
  String get homeImportantAlerts => 'Important alerts';

  @override
  String get notifications => 'Notifications';

  @override
  String get homeRecentSales => 'Recent sales';

  @override
  String get homeTodayExpenses => 'Today\'s expenses';

  @override
  String get homeStockCount => 'Count stock';

  @override
  String homeOutOfStock(Object count) {
    return '$count out of stock';
  }

  @override
  String homeStockRemaining(Object quantity) {
    return 'Remaining: $quantity';
  }

  @override
  String homeStockThreshold(Object quantity) {
    return 'Alert at: $quantity';
  }

  @override
  String get homeNoAlerts => 'No stock alerts right now';

  @override
  String get homeLocalData => 'Data stays on this device';

  @override
  String get newSale => 'New sale';

  @override
  String get receivePayment => 'Receive payment';

  @override
  String get homeWelcome => 'Ready for your first sale';

  @override
  String get homeWelcomeHint =>
      'Add your first product to start selling from Mahalli.';

  @override
  String get pullToRefresh => 'Pull to refresh';

  @override
  String get language => 'Language';

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';

  @override
  String get edit => 'Edit';

  @override
  String get activate => 'Activate';

  @override
  String get deactivate => 'Deactivate';

  @override
  String get showInactive => 'Show inactive';

  @override
  String get inactive => 'Inactive';

  @override
  String get optional => 'Optional';

  @override
  String get retry => 'Retry';

  @override
  String get none => 'None';

  @override
  String get comingSoon => 'Coming soon';

  @override
  String get genericError => 'Something went wrong. Please try again.';

  @override
  String get requiredField => 'This field is required';

  @override
  String get invalidNumber => 'Enter a valid number';

  @override
  String get invalidData => 'Some of the entered data is invalid';

  @override
  String get itemNotFound => 'This item no longer exists';

  @override
  String get nameInUse => 'This name is already used';

  @override
  String get barcodeInUse => 'This barcode belongs to another product';

  @override
  String get welcomeTitle => 'Set up your shop';

  @override
  String get welcomeSubtitle =>
      'Just a few details. Everything works without internet.';

  @override
  String get shopName => 'Shop name';

  @override
  String get businessType => 'Business type';

  @override
  String get currency => 'Currency';

  @override
  String get getStarted => 'Get started';

  @override
  String get shopNameHint => 'For example, Neighborhood Market';

  @override
  String get onboardingHero => 'Sell and manage your shop, even offline';

  @override
  String get onboardingStep => 'Set up your shop — one step';

  @override
  String get onboardingLocal => 'Your data stays on this device';

  @override
  String get shopNameLength => 'Use 2 to 60 characters';

  @override
  String get setupProgress => 'Shop setup';

  @override
  String get setupDone => 'Your shop is ready';

  @override
  String get setupError => 'Could not save your shop. Try again.';

  @override
  String get pinOfferTitle => 'Protect your shop with a PIN';

  @override
  String get pinOfferBody =>
      'A PIN keeps your shop data private on this device. You can set one now or later in More.';

  @override
  String get pinNoRecovery =>
      'If you forget your PIN, restore your data from a backup. There is no PIN recovery.';

  @override
  String get setPin => 'Set PIN';

  @override
  String get skipForNow => 'Skip for now';

  @override
  String get pin => 'PIN';

  @override
  String get confirmPin => 'Confirm PIN';

  @override
  String get currentPin => 'Current PIN';

  @override
  String get newPin => 'New PIN';

  @override
  String get pinLengthError => 'Enter 4 to 6 digits';

  @override
  String get pinMismatch => 'PINs do not match';

  @override
  String get unlock => 'Unlock';

  @override
  String get wrongPin => 'Incorrect PIN. Try again.';

  @override
  String get pinLocked => 'Too many attempts. Try again later.';

  @override
  String get pinSettings => 'PIN security';

  @override
  String get changePin => 'Change PIN';

  @override
  String get disablePin => 'Disable PIN';

  @override
  String get pinError => 'Could not update the PIN. Try again.';

  @override
  String get btGrocery => 'Grocery / Mini-market';

  @override
  String get btRetail => 'Retail store';

  @override
  String get btStall => 'Street stall';

  @override
  String get btSalon => 'Salon';

  @override
  String get btGarage => 'Garage';

  @override
  String get btOther => 'Other';

  @override
  String get categories => 'Categories';

  @override
  String get addCategory => 'Add category';

  @override
  String get editCategory => 'Edit category';

  @override
  String get categoryName => 'Category name';

  @override
  String get category => 'Category';

  @override
  String get noCategories => 'No categories yet';

  @override
  String get noCategoriesHint =>
      'Categories help you organize products and services.';

  @override
  String get products => 'Products';

  @override
  String get services => 'Services';

  @override
  String get addProduct => 'Add product';

  @override
  String get editProduct => 'Edit product';

  @override
  String get addService => 'Add service';

  @override
  String get editService => 'Edit service';

  @override
  String get noProducts => 'No products yet';

  @override
  String get noProductsHint => 'Add your first product to start selling.';

  @override
  String get noServices => 'No services yet';

  @override
  String get noServicesHint =>
      'Services are priced items without stock, like a haircut or a repair.';

  @override
  String get productName => 'Product name';

  @override
  String get serviceName => 'Service name';

  @override
  String get barcode => 'Barcode';

  @override
  String get sku => 'SKU';

  @override
  String get unit => 'Unit';

  @override
  String get purchasePrice => 'Purchase price';

  @override
  String get sellingPrice => 'Selling price';

  @override
  String get cost => 'Cost';

  @override
  String get openingStock => 'Opening stock';

  @override
  String get currentStock => 'Current stock';

  @override
  String get stockManagedHint =>
      'Stock changes are recorded from the Inventory screen.';

  @override
  String get searchCatalog => 'Search name, barcode or SKU';

  @override
  String get scanBarcode => 'Scan barcode';

  @override
  String get scanHint => 'Point the camera at a product barcode';

  @override
  String get cameraPermissionDenied =>
      'Camera access is unavailable. Allow camera access in device settings or enter the barcode manually.';

  @override
  String get barcodeNotFound => 'No product has this barcode';

  @override
  String get addWithBarcode => 'Add product with this barcode';

  @override
  String get loadMore => 'Load more';

  @override
  String get catalogDetails => 'Item details';

  @override
  String get enterPrice => 'Enter a valid price';

  @override
  String get priceMustBePositive => 'Selling price must be greater than zero';

  @override
  String get selectCategory => 'Select category';

  @override
  String get saveFailed => 'Could not save. Try again.';

  @override
  String get lowStockThreshold => 'Low stock alert at';

  @override
  String get stockLow => 'Low';

  @override
  String get stockOut => 'Out';

  @override
  String get stockNegative => 'Negative';

  @override
  String get stock => 'Stock';

  @override
  String get stockAll => 'All';

  @override
  String get stockHealthy => 'In stock';

  @override
  String get stockSearch => 'Search products';

  @override
  String get stockNoMatches => 'No products match this filter';

  @override
  String get stockHistory => 'Movement history';

  @override
  String get stockNoHistory => 'No stock movements yet';

  @override
  String get addStock => 'Add stock';

  @override
  String get adjustStock => 'Adjust counted stock';

  @override
  String get recordDamage => 'Record damage';

  @override
  String get stockQuantity => 'Quantity';

  @override
  String get countedStock => 'Counted stock';

  @override
  String get stockReason => 'Reason';

  @override
  String get stockNote => 'Note (optional)';

  @override
  String get damageReasonRequired => 'Enter a reason for damaged stock';

  @override
  String get damageExceedsStock => 'Damage quantity exceeds current stock';

  @override
  String get stockPositiveRequired => 'Enter a quantity greater than zero';

  @override
  String get movementOpening => 'Opening stock';

  @override
  String get movementPurchase => 'Stock added';

  @override
  String get movementSale => 'Sale';

  @override
  String get movementReturn => 'Return';

  @override
  String get movementAdjustment => 'Adjustment';

  @override
  String get movementDamage => 'Damage';

  @override
  String get customers => 'Customers';

  @override
  String get customer => 'Customer';

  @override
  String get addCustomer => 'Add customer';

  @override
  String get editCustomer => 'Edit customer';

  @override
  String get customerName => 'Customer name';

  @override
  String get customerPhone => 'Phone (optional)';

  @override
  String get customerNotes => 'Notes (optional)';

  @override
  String get searchCustomers => 'Search name or phone';

  @override
  String get sortByName => 'Sort by name';

  @override
  String get sortByDebt => 'Sort by debt';

  @override
  String get noCustomers => 'No customers yet';

  @override
  String get noCustomersHint =>
      'Add a customer to track credit sales and payments.';

  @override
  String get customerBalance => 'Balance owed';

  @override
  String get debtHistory => 'Debt history';

  @override
  String get noDebtHistory => 'No debt movements yet';

  @override
  String get recordPayment => 'Record payment';

  @override
  String get recordAdjustment => 'Adjust balance';

  @override
  String get adjustmentIncrease => 'Increase';

  @override
  String get adjustmentDecrease => 'Decrease';

  @override
  String get paymentAmount => 'Payment amount';

  @override
  String get adjustmentAmount => 'Adjustment amount';

  @override
  String get adjustmentReason => 'Reason for adjustment';

  @override
  String get adjustmentReasonRequired => 'Enter a reason for the adjustment';

  @override
  String get overpaymentError => 'This amount exceeds the customer\'s balance';

  @override
  String get outstandingDebtWarning =>
      'This customer still has a balance. Deactivate anyway?';

  @override
  String get duplicateCustomerWarning =>
      'Another customer has this name. Save anyway?';

  @override
  String get confirm => 'Confirm';

  @override
  String get sellOnCredit => 'Sell on credit';

  @override
  String get debtsOverview => 'Debts overview';

  @override
  String get largestBalances => 'Largest balances';

  @override
  String get debtTotal => 'Total outstanding';

  @override
  String get customersAndDebts => 'Customers and debts';

  @override
  String debtCustomerCount(Object count) {
    return '$count customers with a balance';
  }

  @override
  String get allCustomers => 'All customers';

  @override
  String get ledgerSaleCredit => 'Credit sale';

  @override
  String get ledgerPayment => 'Payment';

  @override
  String get ledgerReturn => 'Return';

  @override
  String get ledgerAdjustment => 'Adjustment';

  @override
  String get paymentNote => 'Note (optional)';

  @override
  String get unitPiece => 'Piece';

  @override
  String get unitKg => 'Kilogram';

  @override
  String get unitGram => 'Gram';

  @override
  String get unitLiter => 'Liter';

  @override
  String get unitMeter => 'Meter';

  @override
  String get unitBox => 'Box';

  @override
  String get unitCarton => 'Carton';

  @override
  String get cart => 'Cart';

  @override
  String get emptyCart => 'Your cart is empty';

  @override
  String salesItemCount(Object count) {
    return 'Items: $count';
  }

  @override
  String get salesClearCart => 'Clear cart';

  @override
  String get salesAdd => 'Add';

  @override
  String salesAvailable(Object quantity) {
    return 'Available: $quantity';
  }

  @override
  String get salesNoStock => 'No stock tracking';

  @override
  String get emptyCartHint => 'Search for a product or service to add it.';

  @override
  String get checkout => 'Checkout';

  @override
  String checkoutItems(Object count) {
    return '$count items';
  }

  @override
  String get checkoutCashFull => 'Cash in full';

  @override
  String get checkoutCreditFull => 'Credit in full';

  @override
  String get checkoutPartial => 'Partial payment';

  @override
  String get checkoutCustomerDebt => 'Customer (required for credit)';

  @override
  String get checkoutPaidNow => 'Paid now';

  @override
  String get checkoutDue => 'Remaining due';

  @override
  String get checkoutLocalSave => 'Saved locally • works offline';

  @override
  String get saleSuccessTitle => 'Sale completed!';

  @override
  String get receiptSavedLocal => 'Saved on this device';

  @override
  String get receiptPrintOptional =>
      'Printing is optional. The sale is already saved.';

  @override
  String get inventoryMovementToday => 'Stock movements';

  @override
  String get inventoryQuickCount => 'Quick stock count';

  @override
  String get subtotal => 'Subtotal';

  @override
  String get total => 'Total';

  @override
  String get payment => 'Payment';

  @override
  String get cash => 'Cash';

  @override
  String get partial => 'Partial';

  @override
  String get credit => 'Credit';

  @override
  String get paidAmount => 'Paid amount';

  @override
  String get remaining => 'Remaining';

  @override
  String get change => 'Change';

  @override
  String get selectCustomer => 'Select customer';

  @override
  String get customerRequired => 'Select a customer for the remaining balance';

  @override
  String get completeSale => 'Complete sale';

  @override
  String get saleCompleted => 'Sale completed';

  @override
  String get saleHistory => 'Sales history';

  @override
  String get noSales => 'No sales yet';

  @override
  String get saleDetails => 'Sale details';

  @override
  String get saleNumber => 'Sale #';

  @override
  String get quantity => 'Quantity';

  @override
  String get remove => 'Remove';

  @override
  String get saveDraft => 'Save draft';

  @override
  String get draftSaved => 'Draft saved';

  @override
  String get restoreDraft => 'Restore saved cart?';

  @override
  String get restore => 'Restore';

  @override
  String get discard => 'Discard';

  @override
  String get lowStockSaleWarning => 'This sale will make stock negative.';

  @override
  String get invalidPayment => 'Enter a payment between zero and the total';

  @override
  String get saleFailed =>
      'Could not complete the sale. Your cart is still here.';

  @override
  String get settings => 'Settings';

  @override
  String get shopSettings => 'Shop details';

  @override
  String get shopSettingsHint => 'Name, business type and currency';

  @override
  String get appearance => 'Appearance';

  @override
  String get theme => 'Theme';

  @override
  String get lightTheme => 'Light';

  @override
  String get darkTheme => 'Dark';

  @override
  String get numberDigits => 'Number digits';

  @override
  String get westernDigits => 'Western digits (0–9)';

  @override
  String get arabicIndicDigits => 'Arabic-Indic digits (٠–٩)';

  @override
  String get securityAndData => 'Security & data';

  @override
  String get backupAndRestore => 'Backup & restore';

  @override
  String get backupSettingsHint => 'Create or restore a local copy';

  @override
  String get receiptSettings => 'Receipts & printing';

  @override
  String get receiptSettingsHint => 'Preview, share and print saved receipts';

  @override
  String get reportSettings => 'Reports';

  @override
  String get reportSettingsHint => 'Sales, profit, stock and debt';

  @override
  String get about => 'About';

  @override
  String get aboutHint => 'Version, privacy and licences';

  @override
  String get aboutMahalli => 'About Mahalli';

  @override
  String get appVersion => 'Version';

  @override
  String get offlineFirst =>
      'Built to work locally, without an internet connection.';

  @override
  String get privacyStatement =>
      'Your shop and customer data stay on this device unless you create and share a backup.';

  @override
  String get openSourceLicenses => 'Open-source licences';

  @override
  String get saveChanges => 'Save changes';

  @override
  String get shopUpdated => 'Shop details updated';

  @override
  String get shopUpdateFailed => 'Could not update shop details. Try again.';

  @override
  String get printerSettingsUnavailable =>
      'Printer setup is not available yet. You can still preview, share and print each saved receipt.';

  @override
  String get expenses => 'Expenses';

  @override
  String get todayExpenses => 'Today\'s expenses';

  @override
  String get recentExpenses => 'Recent expenses';

  @override
  String get weeklySales => 'Sales this week';

  @override
  String get profitQuestion => 'How much did I earn?';

  @override
  String get addExpense => 'Add expense';

  @override
  String get expenseCategory => 'Category';

  @override
  String get expenseAmount => 'Amount';

  @override
  String get expenseDescription => 'Description';

  @override
  String get expenseCategories => 'Expense categories';

  @override
  String get addExpenseCategory => 'Add category';

  @override
  String get editExpenseCategory => 'Edit category';

  @override
  String get expenseCategoryName => 'Category name';

  @override
  String get expenseCategoryEmpty => 'No expense categories yet';

  @override
  String get expenseCategoryHint =>
      'Add a category to record your first expense.';

  @override
  String get expenseSelectCategory => 'Select an expense category';

  @override
  String get expensePositiveAmount => 'Enter an amount greater than zero';

  @override
  String get expenseDate => 'Expense date';

  @override
  String get expenseFutureDate =>
      'You cannot record an expense for a future date';

  @override
  String get editExpense => 'Edit expense';

  @override
  String get expenseSaved => 'Expense saved';

  @override
  String get expenseUpdated => 'Expense updated';

  @override
  String get expenseNoEntries => 'No expenses in this month';

  @override
  String get reports => 'Reports';

  @override
  String get today => 'Today';

  @override
  String get yesterday => 'Yesterday';

  @override
  String get week => 'Week';

  @override
  String get month => 'Month';

  @override
  String get salesCountReport => 'Sales count';

  @override
  String get returns => 'Returns';

  @override
  String get revenue => 'Revenue';

  @override
  String get costOfGoods => 'Cost of goods';

  @override
  String get grossProfit => 'Gross profit';

  @override
  String get netProfit => 'Net profit';

  @override
  String get receipt => 'Receipt';

  @override
  String get share => 'Share';

  @override
  String get print => 'Print';

  @override
  String get returnItems => 'Return items';

  @override
  String get confirmReturn => 'Confirm return';

  @override
  String get backupCreated => 'Backup created';

  @override
  String get backupFailed => 'Backup failed';

  @override
  String get restoreComplete => 'Restore complete';

  @override
  String get restartToFinishRestore => 'Restart the app to open restored data.';

  @override
  String get invalidBackup => 'Invalid or unreadable backup';

  @override
  String get backupWarning =>
      'Backups contain your shop and customer data. Keep them safe.';

  @override
  String get createBackup => 'Create backup';

  @override
  String get restoreBackup => 'Restore backup';

  @override
  String get ok => 'OK';

  @override
  String get shareBackup => 'Share backup';
}
