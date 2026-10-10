// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'محلي';

  @override
  String get tabHome => 'الرئيسية';

  @override
  String get tabSales => 'المبيعات';

  @override
  String get tabInventory => 'المخزون';

  @override
  String get tabMore => 'المزيد';

  @override
  String get workingLocally => 'يعمل محليًا';

  @override
  String get todaySales => 'مبيعات اليوم';

  @override
  String get todayProfit => 'ربح اليوم';

  @override
  String get saleCount => 'عدد مبيعات اليوم';

  @override
  String get outstandingDebt => 'الديون المستحقة';

  @override
  String get lowStockCount => 'سلع منخفضة المخزون';

  @override
  String get quickActions => 'إجراءات سريعة';

  @override
  String get homeImportantAlerts => 'تنبيهات مهمة';

  @override
  String get notifications => 'Notifications';

  @override
  String get homeRecentSales => 'آخر المبيعات';

  @override
  String get homeTodayExpenses => 'مصروف اليوم';

  @override
  String get homeStockCount => 'جرد المخزون';

  @override
  String homeOutOfStock(Object count) {
    return 'نفد منها $count';
  }

  @override
  String homeStockRemaining(Object quantity) {
    return 'المتبقي: $quantity';
  }

  @override
  String homeStockThreshold(Object quantity) {
    return 'حد التنبيه: $quantity';
  }

  @override
  String get homeNoAlerts => 'لا توجد تنبيهات مخزون حاليًا';

  @override
  String get homeLocalData => 'بياناتك على الجهاز';

  @override
  String get newSale => 'بيع جديد';

  @override
  String get receivePayment => 'تسديد دفعة';

  @override
  String get homeWelcome => 'جاهز لأول عملية بيع';

  @override
  String get homeWelcomeHint => 'أضف أول سلعة لتبدأ البيع من محلي.';

  @override
  String get pullToRefresh => 'اسحب للتحديث';

  @override
  String get language => 'اللغة';

  @override
  String get save => 'حفظ';

  @override
  String get cancel => 'إلغاء';

  @override
  String get edit => 'تعديل';

  @override
  String get activate => 'تفعيل';

  @override
  String get deactivate => 'إيقاف';

  @override
  String get showInactive => 'عرض الموقوفة';

  @override
  String get inactive => 'موقوف';

  @override
  String get optional => 'اختياري';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get none => 'بدون';

  @override
  String get comingSoon => 'قريبًا';

  @override
  String get genericError => 'حدث خطأ ما. حاول مرة أخرى.';

  @override
  String get requiredField => 'هذا الحقل مطلوب';

  @override
  String get invalidNumber => 'أدخل رقمًا صحيحًا';

  @override
  String get invalidData => 'بعض البيانات المدخلة غير صحيحة';

  @override
  String get itemNotFound => 'هذا العنصر لم يعد موجودًا';

  @override
  String get nameInUse => 'هذا الاسم مستخدم بالفعل';

  @override
  String get barcodeInUse => 'هذا الباركود مستخدم لمنتج آخر';

  @override
  String get welcomeTitle => 'إعداد المتجر';

  @override
  String get welcomeSubtitle => 'بضع تفاصيل فقط. كل شيء يعمل بدون إنترنت.';

  @override
  String get shopName => 'اسم المتجر';

  @override
  String get businessType => 'نوع النشاط';

  @override
  String get currency => 'العملة';

  @override
  String get getStarted => 'ابدأ';

  @override
  String get shopNameHint => 'مثال: بقالة الحارة';

  @override
  String get onboardingHero => 'بيع وإدارة محلك حتى بدون إنترنت';

  @override
  String get onboardingStep => 'إعداد المحل — خطوة واحدة';

  @override
  String get onboardingLocal => 'بياناتك محفوظة على الجهاز';

  @override
  String get shopNameLength => 'استخدم من ٢ إلى ٦٠ حرفًا';

  @override
  String get setupProgress => 'إعداد المتجر';

  @override
  String get setupDone => 'متجرك جاهز';

  @override
  String get setupError => 'تعذر حفظ المتجر. حاول مرة أخرى.';

  @override
  String get pinOfferTitle => 'احمِ متجرك برمز سري';

  @override
  String get pinOfferBody =>
      'يحافظ الرمز السري على خصوصية بيانات متجرك على هذا الجهاز. يمكنك تعيينه الآن أو لاحقًا من المزيد.';

  @override
  String get pinNoRecovery =>
      'إذا نسيت الرمز السري، استعد بياناتك من نسخة احتياطية. لا توجد طريقة لاستعادة الرمز.';

  @override
  String get setPin => 'تعيين رمز سري';

  @override
  String get skipForNow => 'تخطي الآن';

  @override
  String get pin => 'الرمز السري';

  @override
  String get confirmPin => 'تأكيد الرمز السري';

  @override
  String get currentPin => 'الرمز السري الحالي';

  @override
  String get newPin => 'الرمز السري الجديد';

  @override
  String get pinLengthError => 'أدخل من ٤ إلى ٦ أرقام';

  @override
  String get pinMismatch => 'الرمزان غير متطابقين';

  @override
  String get unlock => 'فتح التطبيق';

  @override
  String get wrongPin => 'الرمز السري غير صحيح. حاول مرة أخرى.';

  @override
  String get pinLocked => 'محاولات كثيرة. حاول لاحقًا.';

  @override
  String get pinSettings => 'حماية الرمز السري';

  @override
  String get changePin => 'تغيير الرمز السري';

  @override
  String get disablePin => 'إلغاء الرمز السري';

  @override
  String get pinError => 'تعذر تحديث الرمز السري. حاول مرة أخرى.';

  @override
  String get btGrocery => 'بقالة / ميني ماركت';

  @override
  String get btRetail => 'متجر تجزئة';

  @override
  String get btStall => 'بسطة';

  @override
  String get btSalon => 'صالون';

  @override
  String get btGarage => 'ورشة / كراج';

  @override
  String get btOther => 'أخرى';

  @override
  String get categories => 'التصنيفات';

  @override
  String get addCategory => 'إضافة تصنيف';

  @override
  String get editCategory => 'تعديل التصنيف';

  @override
  String get categoryName => 'اسم التصنيف';

  @override
  String get category => 'التصنيف';

  @override
  String get noCategories => 'لا توجد تصنيفات بعد';

  @override
  String get noCategoriesHint =>
      'التصنيفات تساعدك على تنظيم المنتجات والخدمات.';

  @override
  String get products => 'المنتجات';

  @override
  String get services => 'الخدمات';

  @override
  String get addProduct => 'إضافة منتج';

  @override
  String get editProduct => 'تعديل المنتج';

  @override
  String get addService => 'إضافة خدمة';

  @override
  String get editService => 'تعديل الخدمة';

  @override
  String get noProducts => 'لا توجد منتجات بعد';

  @override
  String get noProductsHint => 'أضف أول منتج لتبدأ البيع.';

  @override
  String get noServices => 'لا توجد خدمات بعد';

  @override
  String get noServicesHint =>
      'الخدمات عناصر لها سعر بدون مخزون، مثل حلاقة أو إصلاح.';

  @override
  String get productName => 'اسم المنتج';

  @override
  String get serviceName => 'اسم الخدمة';

  @override
  String get barcode => 'الباركود';

  @override
  String get sku => 'رمز المنتج (SKU)';

  @override
  String get unit => 'الوحدة';

  @override
  String get purchasePrice => 'سعر الشراء';

  @override
  String get sellingPrice => 'سعر البيع';

  @override
  String get cost => 'التكلفة';

  @override
  String get openingStock => 'الكمية الافتتاحية';

  @override
  String get currentStock => 'الكمية الحالية';

  @override
  String get stockManagedHint => 'تُسجَّل تغييرات المخزون من شاشة المخزون.';

  @override
  String get searchCatalog => 'ابحث بالاسم أو الباركود أو الرمز';

  @override
  String get scanBarcode => 'مسح الباركود';

  @override
  String get scanHint => 'وجّه الكاميرا إلى باركود المنتج';

  @override
  String get cameraPermissionDenied =>
      'تعذر الوصول إلى الكاميرا. اسمح باستخدامها من إعدادات الجهاز أو أدخل الباركود يدويًا.';

  @override
  String get barcodeNotFound => 'لا يوجد منتج بهذا الباركود';

  @override
  String get addWithBarcode => 'إضافة منتج بهذا الباركود';

  @override
  String get loadMore => 'تحميل المزيد';

  @override
  String get catalogDetails => 'تفاصيل العنصر';

  @override
  String get enterPrice => 'أدخل سعرًا صحيحًا';

  @override
  String get priceMustBePositive => 'يجب أن يكون سعر البيع أكبر من صفر';

  @override
  String get selectCategory => 'اختر تصنيفًا';

  @override
  String get saveFailed => 'تعذر الحفظ. حاول مرة أخرى.';

  @override
  String get lowStockThreshold => 'تنبيه عند انخفاض الكمية إلى';

  @override
  String get stockLow => 'منخفض';

  @override
  String get stockOut => 'نفد';

  @override
  String get stockNegative => 'سالب';

  @override
  String get stock => 'المخزون';

  @override
  String get stockAll => 'الكل';

  @override
  String get stockHealthy => 'متوفر';

  @override
  String get stockSearch => 'ابحث عن المنتجات';

  @override
  String get stockNoMatches => 'لا توجد منتجات تطابق هذا التصفية';

  @override
  String get stockHistory => 'سجل حركات المخزون';

  @override
  String get stockNoHistory => 'لا توجد حركات مخزون بعد';

  @override
  String get addStock => 'إضافة مخزون';

  @override
  String get adjustStock => 'تسوية الجرد';

  @override
  String get recordDamage => 'تسجيل تلف';

  @override
  String get stockQuantity => 'الكمية';

  @override
  String get countedStock => 'الكمية المعدودة';

  @override
  String get stockReason => 'السبب';

  @override
  String get stockNote => 'ملاحظة (اختياري)';

  @override
  String get damageReasonRequired => 'أدخل سبب تلف المخزون';

  @override
  String get damageExceedsStock => 'كمية التالف أكبر من المخزون الحالي';

  @override
  String get stockPositiveRequired => 'أدخل كمية أكبر من صفر';

  @override
  String get movementOpening => 'مخزون افتتاحي';

  @override
  String get movementPurchase => 'إضافة مخزون';

  @override
  String get movementSale => 'بيع';

  @override
  String get movementReturn => 'مرتجع';

  @override
  String get movementAdjustment => 'تسوية';

  @override
  String get movementDamage => 'تلف';

  @override
  String get customers => 'الزبائن';

  @override
  String get customer => 'الزبون';

  @override
  String get addCustomer => 'إضافة زبون';

  @override
  String get editCustomer => 'تعديل الزبون';

  @override
  String get customerName => 'اسم الزبون';

  @override
  String get customerPhone => 'الهاتف (اختياري)';

  @override
  String get customerNotes => 'ملاحظات (اختياري)';

  @override
  String get searchCustomers => 'ابحث بالاسم أو الهاتف';

  @override
  String get sortByName => 'ترتيب حسب الاسم';

  @override
  String get sortByDebt => 'ترتيب حسب الدين';

  @override
  String get noCustomers => 'لا يوجد زبائن بعد';

  @override
  String get noCustomersHint => 'أضف زبونًا لتتبع البيع الآجل والدفعات.';

  @override
  String get customerBalance => 'الرصيد المستحق';

  @override
  String get debtHistory => 'سجل الدين';

  @override
  String get noDebtHistory => 'لا توجد حركات دين بعد';

  @override
  String get recordPayment => 'تسجيل دفعة';

  @override
  String get recordAdjustment => 'تسوية الرصيد';

  @override
  String get adjustmentIncrease => 'زيادة';

  @override
  String get adjustmentDecrease => 'تخفيض';

  @override
  String get paymentAmount => 'قيمة الدفعة';

  @override
  String get adjustmentAmount => 'قيمة التسوية';

  @override
  String get adjustmentReason => 'سبب التسوية';

  @override
  String get adjustmentReasonRequired => 'أدخل سبب التسوية';

  @override
  String get overpaymentError => 'المبلغ أكبر من رصيد الزبون';

  @override
  String get outstandingDebtWarning =>
      'لا يزال على هذا الزبون رصيد. هل تريد إيقافه؟';

  @override
  String get duplicateCustomerWarning =>
      'يوجد زبون آخر بهذا الاسم. هل تريد الحفظ؟';

  @override
  String get confirm => 'تأكيد';

  @override
  String get sellOnCredit => 'البيع الآجل';

  @override
  String get debtsOverview => 'الديون';

  @override
  String get largestBalances => 'أكبر الأرصدة';

  @override
  String get debtTotal => 'إجمالي الديون المستحقة';

  @override
  String get customersAndDebts => 'الزبائن والديون';

  @override
  String debtCustomerCount(Object count) {
    return '$count زبائن لديهم رصيد';
  }

  @override
  String get allCustomers => 'كل الزبائن';

  @override
  String get ledgerSaleCredit => 'بيع آجل';

  @override
  String get ledgerPayment => 'دفعة';

  @override
  String get ledgerReturn => 'مرتجع';

  @override
  String get ledgerAdjustment => 'تسوية';

  @override
  String get paymentNote => 'ملاحظة (اختياري)';

  @override
  String get unitPiece => 'قطعة';

  @override
  String get unitKg => 'كيلوغرام';

  @override
  String get unitGram => 'غرام';

  @override
  String get unitLiter => 'لتر';

  @override
  String get unitMeter => 'متر';

  @override
  String get unitBox => 'علبة';

  @override
  String get unitCarton => 'كرتونة';

  @override
  String get cart => 'السلة';

  @override
  String get emptyCart => 'السلة فارغة';

  @override
  String salesItemCount(Object count) {
    return 'الأصناف: $count';
  }

  @override
  String get salesClearCart => 'مسح السلة';

  @override
  String get salesAdd => 'أضف';

  @override
  String salesAvailable(Object quantity) {
    return 'متوفر $quantity';
  }

  @override
  String get salesNoStock => 'بدون مخزون';

  @override
  String get emptyCartHint => 'ابحث عن منتج أو خدمة لإضافتهما.';

  @override
  String get checkout => 'إتمام البيع';

  @override
  String checkoutItems(Object count) {
    return '$count أصناف';
  }

  @override
  String get checkoutCashFull => 'نقدي كامل';

  @override
  String get checkoutCreditFull => 'دين كامل';

  @override
  String get checkoutPartial => 'دفع جزئي';

  @override
  String get checkoutCustomerDebt => 'الزبون (مطلوب للدين)';

  @override
  String get checkoutPaidNow => 'المدفوع الآن';

  @override
  String get checkoutDue => 'الباقي دين';

  @override
  String get checkoutLocalSave => 'الحفظ محليًا • بدون إنترنت';

  @override
  String get saleSuccessTitle => 'تم البيع بنجاح!';

  @override
  String get receiptSavedLocal => 'محفوظة على الجهاز';

  @override
  String get receiptPrintOptional =>
      'الطباعة اختيارية — البيع محفوظ حتى بدون طباعة';

  @override
  String get inventoryMovementToday => 'حركة المخزون';

  @override
  String get inventoryQuickCount => 'جرد فعل سريع';

  @override
  String get subtotal => 'المجموع الفرعي';

  @override
  String get total => 'الإجمالي';

  @override
  String get payment => 'الدفع';

  @override
  String get cash => 'نقدي';

  @override
  String get partial => 'دفعة جزئية';

  @override
  String get credit => 'آجل';

  @override
  String get paidAmount => 'المبلغ المدفوع';

  @override
  String get remaining => 'المتبقي';

  @override
  String get change => 'الباقي';

  @override
  String get selectCustomer => 'اختر الزبون';

  @override
  String get customerRequired => 'اختر زبونًا للمبلغ المتبقي';

  @override
  String get completeSale => 'إتمام البيع';

  @override
  String get saleCompleted => 'تم إتمام البيع';

  @override
  String get saleHistory => 'سجل المبيعات';

  @override
  String get noSales => 'لا توجد مبيعات بعد';

  @override
  String get saleDetails => 'تفاصيل البيع';

  @override
  String get saleNumber => 'بيع رقم';

  @override
  String get quantity => 'الكمية';

  @override
  String get remove => 'إزالة';

  @override
  String get saveDraft => 'حفظ كمسودة';

  @override
  String get draftSaved => 'تم حفظ المسودة';

  @override
  String get restoreDraft => 'استعادة السلة المحفوظة؟';

  @override
  String get restore => 'استعادة';

  @override
  String get discard => 'تجاهل';

  @override
  String get lowStockSaleWarning => 'هذه العملية ستجعل المخزون سالبًا.';

  @override
  String get invalidPayment => 'أدخل دفعة بين صفر وإجمالي البيع';

  @override
  String get saleFailed => 'تعذر إتمام البيع. ما زالت السلة محفوظة.';

  @override
  String get settings => 'الإعدادات';

  @override
  String get shopSettings => 'بيانات المتجر';

  @override
  String get shopSettingsHint => 'الاسم ونوع النشاط والعملة';

  @override
  String get appearance => 'المظهر';

  @override
  String get theme => 'السمة';

  @override
  String get lightTheme => 'فاتحة';

  @override
  String get darkTheme => 'داكنة';

  @override
  String get numberDigits => 'شكل الأرقام';

  @override
  String get westernDigits => 'أرقام غربية (0–9)';

  @override
  String get arabicIndicDigits => 'أرقام هندية عربية (٠–٩)';

  @override
  String get securityAndData => 'الأمان والبيانات';

  @override
  String get backupAndRestore => 'النسخ الاحتياطي والاستعادة';

  @override
  String get backupSettingsHint => 'إنشاء أو استعادة نسخة محلية';

  @override
  String get receiptSettings => 'الإيصالات والطباعة';

  @override
  String get receiptSettingsHint => 'معاينة ومشاركة وطباعة الإيصالات المحفوظة';

  @override
  String get reportSettings => 'التقارير';

  @override
  String get reportSettingsHint => 'المبيعات والأرباح والمخزون والديون';

  @override
  String get about => 'حول التطبيق';

  @override
  String get aboutHint => 'الإصدار والخصوصية والتراخيص';

  @override
  String get aboutMahalli => 'حول محلي';

  @override
  String get appVersion => 'الإصدار';

  @override
  String get offlineFirst => 'مصمم للعمل محليًا دون اتصال بالإنترنت.';

  @override
  String get privacyStatement =>
      'تبقى بيانات متجرك وعملائك على هذا الجهاز ما لم تنشئ نسخة احتياطية وتشاركها.';

  @override
  String get openSourceLicenses => 'تراخيص المصادر المفتوحة';

  @override
  String get saveChanges => 'حفظ التغييرات';

  @override
  String get shopUpdated => 'تم تحديث بيانات المتجر';

  @override
  String get shopUpdateFailed => 'تعذر تحديث بيانات المتجر. حاول مرة أخرى.';

  @override
  String get printerSettingsUnavailable =>
      'إعداد الطابعة غير متاح بعد. ما زال بإمكانك معاينة ومشاركة وطباعة كل إيصال محفوظ.';

  @override
  String get expenses => 'المصروفات';

  @override
  String get todayExpenses => 'مصروفات اليوم';

  @override
  String get recentExpenses => 'آخر المصروفات';

  @override
  String get weeklySales => 'مبيعات الأسبوع';

  @override
  String get profitQuestion => 'كم ربحت؟';

  @override
  String get addExpense => 'إضافة مصروف';

  @override
  String get expenseCategory => 'التصنيف';

  @override
  String get expenseAmount => 'المبلغ';

  @override
  String get expenseDescription => 'الوصف';

  @override
  String get expenseCategories => 'تصنيفات المصروفات';

  @override
  String get addExpenseCategory => 'إضافة تصنيف';

  @override
  String get editExpenseCategory => 'تعديل التصنيف';

  @override
  String get expenseCategoryName => 'اسم التصنيف';

  @override
  String get expenseCategoryEmpty => 'لا توجد تصنيفات للمصروفات بعد';

  @override
  String get expenseCategoryHint => 'أضف تصنيفًا لتسجيل أول مصروف.';

  @override
  String get expenseSelectCategory => 'اختر تصنيفًا للمصروف';

  @override
  String get expensePositiveAmount => 'أدخل مبلغًا أكبر من صفر';

  @override
  String get expenseDate => 'تاريخ المصروف';

  @override
  String get expenseFutureDate => 'لا يمكن تسجيل مصروف بتاريخ مستقبلي';

  @override
  String get editExpense => 'تعديل المصروف';

  @override
  String get expenseSaved => 'تم حفظ المصروف';

  @override
  String get expenseUpdated => 'تم تحديث المصروف';

  @override
  String get expenseNoEntries => 'لا توجد مصروفات في هذا الشهر';

  @override
  String get reports => 'التقارير';

  @override
  String get today => 'اليوم';

  @override
  String get yesterday => 'أمس';

  @override
  String get week => 'الأسبوع';

  @override
  String get month => 'الشهر';

  @override
  String get salesCountReport => 'عدد المبيعات';

  @override
  String get returns => 'المرتجعات';

  @override
  String get revenue => 'الإيراد';

  @override
  String get costOfGoods => 'تكلفة البضاعة';

  @override
  String get grossProfit => 'إجمالي الربح';

  @override
  String get netProfit => 'صافي الربح';

  @override
  String get receipt => 'الإيصال';

  @override
  String get share => 'مشاركة';

  @override
  String get print => 'طباعة';

  @override
  String get returnItems => 'إرجاع عناصر';

  @override
  String get confirmReturn => 'تأكيد الإرجاع';

  @override
  String get backupCreated => 'تم إنشاء النسخة الاحتياطية';

  @override
  String get backupFailed => 'تعذر إنشاء النسخة الاحتياطية';

  @override
  String get restoreComplete => 'اكتملت الاستعادة';

  @override
  String get restartToFinishRestore =>
      'أعد تشغيل التطبيق لفتح البيانات المستعادة.';

  @override
  String get invalidBackup => 'النسخة الاحتياطية غير صالحة أو لا يمكن قراءتها';

  @override
  String get backupWarning =>
      'تحتوي النسخ الاحتياطية على بيانات متجرك وعملائك. احتفظ بها بأمان.';

  @override
  String get createBackup => 'إنشاء نسخة احتياطية';

  @override
  String get restoreBackup => 'استعادة نسخة احتياطية';

  @override
  String get ok => 'حسنًا';

  @override
  String get shareBackup => 'مشاركة النسخة الاحتياطية';
}
