// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ar';

  static String m0(accepted, total) => "تم قبول ${accepted} من ${total} مراحل";

  static String m1(number) => "الملحق رقم ${number}";

  static String m2(number) => "تعديل #${number}";

  static String m3(actor) => "بواسطة: ${actor}";

  static String m4(value) => "المعايير: ${value}";

  static String m5(days) => "متبقي ${days} أيام";

  static String m6(value) => "التسليم: ${value}";

  static String m7(count) => "${count} نشطة";

  static String m8(date) => "الموعد: ${date}";

  static String m9(hours) => "متبقي ${hours} ساعات";

  static String m10(time) => "آخر تحديث: ${time}";

  static String m11(minLength) =>
      "يجب أن يكون الحقل مكونًا من ${minLength} أحرف على الأقل";

  static String m12(reason) => "السبب: ${reason}";

  static String m13(scope) => "النطاق: ${scope}";

  static String m14(version) => "الإصدار ${version}";

  static String m15(name) => "مرحباً بعودتك، ${name}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accept_deliverable": MessageLookupByLibrary.simpleMessage("قبول التسليم"),
    "accept_invitation_confirmation": MessageLookupByLibrary.simpleMessage(
      "سيؤدي قبول هذه الدعوة إلى بدء التعاون وإظهار المشروع ضمن قائمة مشاريعك النشطة.",
    ),
    "accept_project": MessageLookupByLibrary.simpleMessage("قبول المشروع"),
    "accept_resolution": MessageLookupByLibrary.simpleMessage("قبول الحل"),
    "acceptance_criteria": MessageLookupByLibrary.simpleMessage(
      "معايير القبول",
    ),
    "acceptance_criteria_hint": MessageLookupByLibrary.simpleMessage(
      "الشروط اللازمة لموافقة الزبون على المرحلة",
    ),
    "acceptance_disclaimer": MessageLookupByLibrary.simpleMessage(
      "قبول العمل يقفل هذه المرحلة نهائيًا ويجعلها مؤهلة للصرف. هذا لا يعني تحويل المبلغ فورًا.",
    ),
    "acceptance_note_hint": MessageLookupByLibrary.simpleMessage(
      "أضف ملاحظة اختيارية للمستقل...",
    ),
    "acceptance_note_optional": MessageLookupByLibrary.simpleMessage(
      "ملاحظة قبول (اختيارية)",
    ),
    "accepted": MessageLookupByLibrary.simpleMessage("تاريخ القبول"),
    "acceptedWorkValue": MessageLookupByLibrary.simpleMessage(
      "قيمة العمل المقبول",
    ),
    "acceptedWorkValueTooltip": MessageLookupByLibrary.simpleMessage(
      "إجمالي قيمة العمل الذي تم قبوله.",
    ),
    "accepted_milestones": MessageLookupByLibrary.simpleMessage("المقبولة"),
    "accepted_milestones_ratio": m0,
    "accepted_project_invitations": MessageLookupByLibrary.simpleMessage(
      "ستظهر هنا دعوات المشاريع التي تم قبولها.",
    ),
    "accepted_work_value": MessageLookupByLibrary.simpleMessage(
      "قيمة الأعمال المقبولة",
    ),
    "accepted_work_value_tooltip": MessageLookupByLibrary.simpleMessage(
      "إجمالي قيمة العمل الذي تم قبوله.",
    ),
    "account": MessageLookupByLibrary.simpleMessage("الحساب"),
    "account_already_exists": MessageLookupByLibrary.simpleMessage(
      "يوجد حساب مسجل بهذا البريد الإلكتروني بالفعل",
    ),
    "account_information": MessageLookupByLibrary.simpleMessage(
      "معلومات الحساب",
    ),
    "account_type": MessageLookupByLibrary.simpleMessage("نوع الحساب"),
    "action_center": MessageLookupByLibrary.simpleMessage("مركز الإجراءات"),
    "action_conflicts_project_state": MessageLookupByLibrary.simpleMessage(
      "هذا الإجراء يتعارض مع حالة المشروع الحالية.",
    ),
    "active": MessageLookupByLibrary.simpleMessage("نشط"),
    "activity_timeline": MessageLookupByLibrary.simpleMessage("سجل النشاطات"),
    "add_client": MessageLookupByLibrary.simpleMessage("إضافة زبون"),
    "add_client_description": MessageLookupByLibrary.simpleMessage(
      "أدخل البريد الإلكتروني لحساب زبون مسجل لإضافته إلى قائمتك.",
    ),
    "add_evidence": MessageLookupByLibrary.simpleMessage("إضافة دليل"),
    "add_evidence_link": MessageLookupByLibrary.simpleMessage("إضافة رابط"),
    "add_file": MessageLookupByLibrary.simpleMessage("إضافة ملف"),
    "add_files": MessageLookupByLibrary.simpleMessage("إضافة ملفات"),
    "add_milestone": MessageLookupByLibrary.simpleMessage("إضافة مرحلة"),
    "adjust_search_terms": MessageLookupByLibrary.simpleMessage(
      "حاول تعديل كلمات البحث.",
    ),
    "all_caught_up": MessageLookupByLibrary.simpleMessage(
      "كل شيء على ما يرام! لا توجد إجراءات عاجلة تتطلب انتباهك.",
    ),
    "all_deliverables_accepted": MessageLookupByLibrary.simpleMessage(
      "تم قبول جميع مخرجات المشروع!",
    ),
    "all_milestones_must_be_accepted": MessageLookupByLibrary.simpleMessage(
      "يجب قبول جميع مراحل المشروع",
    ),
    "all_payments_must_be_paid": MessageLookupByLibrary.simpleMessage(
      "يجب تأكيد استلام جميع الدفعات",
    ),
    "all_time": MessageLookupByLibrary.simpleMessage("كل الوقت"),
    "allocated_value": MessageLookupByLibrary.simpleMessage("القيمة المخصصة"),
    "allocation_complete": MessageLookupByLibrary.simpleMessage(
      "اكتمل التوزيع",
    ),
    "allocation_exceeds_project_value": MessageLookupByLibrary.simpleMessage(
      "التوزيع يتجاوز قيمة المشروع",
    ),
    "allocation_mode": MessageLookupByLibrary.simpleMessage("طريقة التوزيع"),
    "allocation_summary": MessageLookupByLibrary.simpleMessage("ملخص التوزيع"),
    "already_have_account": MessageLookupByLibrary.simpleMessage(
      "لديك حساب بالفعل؟",
    ),
    "amendment_number": m1,
    "amendment_number_prefix": m2,
    "amendments_applied": MessageLookupByLibrary.simpleMessage(
      "تعديلات مطبّقة",
    ),
    "amount_awaiting_confirmation": MessageLookupByLibrary.simpleMessage(
      "بانتظار التأكيد",
    ),
    "amount_eligible": MessageLookupByLibrary.simpleMessage("مبلغ مؤهل للدفع"),
    "amount_on_dispute_hold": MessageLookupByLibrary.simpleMessage(
      "مبالغ قيد النزاع",
    ),
    "amount_with_issues": MessageLookupByLibrary.simpleMessage(
      "مبالغ بها بلاغات",
    ),
    "app_title": MessageLookupByLibrary.simpleMessage("ميثاق"),
    "appearance": MessageLookupByLibrary.simpleMessage("المظهر"),
    "approval_date": MessageLookupByLibrary.simpleMessage("تاريخ الاعتماد"),
    "approve": MessageLookupByLibrary.simpleMessage("موافقة"),
    "approve_change_request": MessageLookupByLibrary.simpleMessage(
      "الموافقة على التغيير",
    ),
    "approve_change_request_confirmation": MessageLookupByLibrary.simpleMessage(
      "هل أنت متأكد أنك تريد الموافقة على طلب التغيير هذا؟ سيؤدي ذلك إلى تعديل العقد.",
    ),
    "approve_contract": MessageLookupByLibrary.simpleMessage(
      "الموافقة على العقد",
    ),
    "approvedProjectValue": MessageLookupByLibrary.simpleMessage(
      "قيمة المشروع المعتمدة",
    ),
    "approvedProjectValueTooltip": MessageLookupByLibrary.simpleMessage(
      "إجمالي القيمة المتفق عليها لجميع المشاريع المعتمدة.",
    ),
    "approved_by": MessageLookupByLibrary.simpleMessage("تم الاعتماد بواسطة"),
    "approved_contract": MessageLookupByLibrary.simpleMessage("عقد معتمد"),
    "approved_date": MessageLookupByLibrary.simpleMessage("تاريخ الموافقة"),
    "approved_project_value": MessageLookupByLibrary.simpleMessage(
      "قيمة المشروع المعتمدة",
    ),
    "approved_project_value_tooltip": MessageLookupByLibrary.simpleMessage(
      "إجمالي القيمة المتفق عليها لجميع المشاريع المعتمدة.",
    ),
    "approved_tab": MessageLookupByLibrary.simpleMessage("مقبول"),
    "assign_client": MessageLookupByLibrary.simpleMessage("تعيين زبون"),
    "assigned_client": MessageLookupByLibrary.simpleMessage("الزبون المعيّن"),
    "assigned_freelancer": MessageLookupByLibrary.simpleMessage(
      "المستقل المعيّن",
    ),
    "at_least_one_milestone_required": MessageLookupByLibrary.simpleMessage(
      "يجب إضافة مرحلة واحدة على الأقل.",
    ),
    "awaitingFreelancerConfirmation": MessageLookupByLibrary.simpleMessage(
      "بانتظار التأكيد",
    ),
    "awaitingFreelancerConfirmationTooltip":
        MessageLookupByLibrary.simpleMessage(
          "المدفوعات التي تنتظر تأكيد المستقل.",
        ),
    "awaitingReceiptConfirmation": MessageLookupByLibrary.simpleMessage(
      "بانتظار التأكيد",
    ),
    "awaitingReceiptConfirmationTooltip": MessageLookupByLibrary.simpleMessage(
      "المدفوعات التي تنتظر تأكيد الاستلام.",
    ),
    "awaiting_freelancer_confirmation": MessageLookupByLibrary.simpleMessage(
      "بانتظار تأكيد المستقل",
    ),
    "awaiting_freelancer_confirmation_tooltip":
        MessageLookupByLibrary.simpleMessage(
          "المدفوعات التي تنتظر تأكيد المستقل.",
        ),
    "awaiting_receipt_confirmation": MessageLookupByLibrary.simpleMessage(
      "بانتظار تأكيد الاستلام",
    ),
    "awaiting_receipt_confirmation_tooltip":
        MessageLookupByLibrary.simpleMessage(
          "المدفوعات التي تنتظر تأكيد الاستلام.",
        ),
    "awaiting_review": MessageLookupByLibrary.simpleMessage("بانتظار المراجعة"),
    "bad_certificate": MessageLookupByLibrary.simpleMessage(
      "الشهادة غير صالحة",
    ),
    "bad_request": MessageLookupByLibrary.simpleMessage("الطلب غير صالح"),
    "bio": MessageLookupByLibrary.simpleMessage("نبذة عني"),
    "by_actor": m3,
    "cancel": MessageLookupByLibrary.simpleMessage("إلغاء"),
    "cancel_project": MessageLookupByLibrary.simpleMessage("إلغاء المشروع"),
    "cancel_project_confirmation": MessageLookupByLibrary.simpleMessage(
      "هل أنت متأكد من رغبتك في إلغاء هذا المشروع؟ سيتم وضع علامة على المشروع كمُلغى ولا يمكن التراجع عن هذا الإجراء.",
    ),
    "cancelled": MessageLookupByLibrary.simpleMessage("ملغي"),
    "card_loading": MessageLookupByLibrary.simpleMessage("جارٍ التحميل…"),
    "change": MessageLookupByLibrary.simpleMessage("تغيير"),
    "change_password": MessageLookupByLibrary.simpleMessage(
      "تغيير كلمة المرور",
    ),
    "change_request_approved_success": MessageLookupByLibrary.simpleMessage(
      "تمت الموافقة على طلب التغيير وتصديق تعديل العقد.",
    ),
    "change_request_details": MessageLookupByLibrary.simpleMessage(
      "تفاصيل طلب التعديل",
    ),
    "change_request_pending_review": MessageLookupByLibrary.simpleMessage(
      "بانتظار مراجعتك",
    ),
    "change_request_reason": MessageLookupByLibrary.simpleMessage(
      "سبب التغيير",
    ),
    "change_request_rejected_success": MessageLookupByLibrary.simpleMessage(
      "تم رفض طلب التغيير.",
    ),
    "change_request_submitted_success": MessageLookupByLibrary.simpleMessage(
      "تم تقديم طلب التغيير بنجاح.",
    ),
    "change_request_title": MessageLookupByLibrary.simpleMessage(
      "عنوان طلب التغيير",
    ),
    "change_request_withdrawn_success": MessageLookupByLibrary.simpleMessage(
      "تم سحب طلب التغيير.",
    ),
    "change_requests": MessageLookupByLibrary.simpleMessage("طلبات التعديل"),
    "changes_requested_successfully": MessageLookupByLibrary.simpleMessage(
      "تم إرسال طلب التعديلات بنجاح",
    ),
    "changes_required_error": MessageLookupByLibrary.simpleMessage(
      "وصف التعديلات المطلوبة إلزامي",
    ),
    "chart_view": MessageLookupByLibrary.simpleMessage("عرض الرسم"),
    "chat_attachment_limit": MessageLookupByLibrary.simpleMessage(
      "الحد الأقصى 3 مرفقات لكل رسالة",
    ),
    "client": MessageLookupByLibrary.simpleMessage("الزبون"),
    "client_account_managed_message": MessageLookupByLibrary.simpleMessage(
      "يتم إدارة الاسم والبريد الإلكتروني من خلال حساب الزبون نفسه.",
    ),
    "client_added_successfully": MessageLookupByLibrary.simpleMessage(
      "تمت إضافة الزبون بنجاح",
    ),
    "client_already_in_list": MessageLookupByLibrary.simpleMessage(
      "هذا الزبون موجود بالفعل في قائمتك.",
    ),
    "client_description": MessageLookupByLibrary.simpleMessage(
      "أوظّف مستقلين وأدير عقودي ومشاريعي",
    ),
    "client_details": MessageLookupByLibrary.simpleMessage("تفاصيل الزبون"),
    "client_email": MessageLookupByLibrary.simpleMessage(
      "البريد الإلكتروني للزبون",
    ),
    "client_feedback": MessageLookupByLibrary.simpleMessage("ملاحظات الزبون"),
    "client_feedback_and_decisions": MessageLookupByLibrary.simpleMessage(
      "ملاحظات الزبون والقرارات",
    ),
    "client_first_use_guidance": MessageLookupByLibrary.simpleMessage(
      "مرحباً بك في ميثاق! عندما يبدأ العمل أو تصلك دعوات للمشاريع، ستظهر هنا.",
    ),
    "client_information": MessageLookupByLibrary.simpleMessage(
      "معلومات الزبون",
    ),
    "client_not_found": MessageLookupByLibrary.simpleMessage(
      "لم يتم العثور على الزبون.",
    ),
    "client_overview": MessageLookupByLibrary.simpleMessage(
      "نظرة عامة على العملاء",
    ),
    "client_type": MessageLookupByLibrary.simpleMessage("زبون"),
    "client_updated_successfully": MessageLookupByLibrary.simpleMessage(
      "تم تحديث بيانات الزبون بنجاح",
    ),
    "clients": MessageLookupByLibrary.simpleMessage("العملاء"),
    "closed_tab": MessageLookupByLibrary.simpleMessage("مغلق"),
    "company_name_optional": MessageLookupByLibrary.simpleMessage(
      "اسم الشركة (اختياري)",
    ),
    "complete_project": MessageLookupByLibrary.simpleMessage("إكمال المشروع"),
    "complete_project_confirm_body": MessageLookupByLibrary.simpleMessage(
      "هل أنت متأكد من إتمام هذا المشروع؟ هذا الإجراء لا يمكن التراجع عنه وسيُغلق العقد والمراحل نهائياً. سيتحقق الخادم من استيفاء جميع المتطلبات قبل الإتمام.",
    ),
    "completed": MessageLookupByLibrary.simpleMessage("مكتمل"),
    "completion_checklist": MessageLookupByLibrary.simpleMessage(
      "قائمة التحقق من الإكمال",
    ),
    "completion_eligible": MessageLookupByLibrary.simpleMessage("جاهز للإكمال"),
    "completion_server_check": MessageLookupByLibrary.simpleMessage(
      "يتحقق الخادم من هذه العناصر عند التأكيد — هذا للتذكير فقط وليس حالة مباشرة.",
    ),
    "confirm_accept_resolution": MessageLookupByLibrary.simpleMessage(
      "قبول هذا الحل سيؤدي إلى إغلاق النزاع. لا يمكن التراجع عن هذا الإجراء.",
    ),
    "confirm_acceptance": MessageLookupByLibrary.simpleMessage("تأكيد القبول"),
    "confirm_approve_contract": MessageLookupByLibrary.simpleMessage(
      "هل أنت متأكد من الموافقة على هذا العقد؟ بعد الموافقة يصبح العقد نهائيًا وغير قابل للتعديل.",
    ),
    "confirm_new_password": MessageLookupByLibrary.simpleMessage(
      "تأكيد كلمة المرور الجديدة",
    ),
    "confirm_new_password_required": MessageLookupByLibrary.simpleMessage(
      "يرجى تأكيد كلمة المرور الجديدة",
    ),
    "confirm_receipt": MessageLookupByLibrary.simpleMessage(
      "تأكيد استلام الدفعة",
    ),
    "confirm_submit_contract": MessageLookupByLibrary.simpleMessage(
      "هل أنت متأكد من رغبتك في إرسال هذا العقد؟ سيتم إرساله للزبون للمراجعة.",
    ),
    "confirm_withdraw_contract": MessageLookupByLibrary.simpleMessage(
      "هل أنت متأكد من سحب هذا العقد؟ سيعود العقد لحالة المسودة لتتمكن من تعديله.",
    ),
    "confirm_withdraw_dispute": MessageLookupByLibrary.simpleMessage(
      "سحب النزاع يرفع التجميد عن هذا المعلم النهائي. لا يمكن التراجع عن هذا الإجراء.",
    ),
    "confirmedPaymentsThisMonth": MessageLookupByLibrary.simpleMessage(
      "المؤكدة هذا الشهر",
    ),
    "confirmedPaymentsThisMonthTooltip": MessageLookupByLibrary.simpleMessage(
      "المدفوعات المؤكدة خلال الشهر الحالي.",
    ),
    "confirmed_payments_this_month": MessageLookupByLibrary.simpleMessage(
      "المؤكد هذا الشهر",
    ),
    "confirmed_payments_this_month_tooltip":
        MessageLookupByLibrary.simpleMessage(
          "المدفوعات المؤكدة خلال الشهر الحالي.",
        ),
    "conflict_occurred": MessageLookupByLibrary.simpleMessage("حدث تعارض"),
    "contact_information": MessageLookupByLibrary.simpleMessage(
      "معلومات التواصل",
    ),
    "continue_editing": MessageLookupByLibrary.simpleMessage("متابعة التعديل"),
    "contract": MessageLookupByLibrary.simpleMessage("العقد"),
    "contract_allocation_incomplete": MessageLookupByLibrary.simpleMessage(
      "يجب أن يساوي إجمالي توزيع المراحل قيمة المشروع بالكامل",
    ),
    "contract_amendments": MessageLookupByLibrary.simpleMessage("ملاحق العقد"),
    "contract_approved_successfully": MessageLookupByLibrary.simpleMessage(
      "تمت الموافقة على العقد بنجاح",
    ),
    "contract_builder": MessageLookupByLibrary.simpleMessage("منشئ العقود"),
    "contract_chronological_dates": MessageLookupByLibrary.simpleMessage(
      "يجب أن تكون تواريخ استحقاق المراحل مرتبة زمنيًا بالتتابع",
    ),
    "contract_criteria_required": MessageLookupByLibrary.simpleMessage(
      "يجب تحديد معايير القبول لجميع المراحل",
    ),
    "contract_deliverable_required": MessageLookupByLibrary.simpleMessage(
      "يجب تحديد مخرجات التسليم لجميع المراحل",
    ),
    "contract_details": MessageLookupByLibrary.simpleMessage("تفاصيل العقد"),
    "contract_due_date_required": MessageLookupByLibrary.simpleMessage(
      "يجب تحديد تاريخ الاستحقاق لجميع المراحل",
    ),
    "contract_min_milestones": MessageLookupByLibrary.simpleMessage(
      "يجب إضافة مرحلة واحدة على الأقل قبل الإرسال",
    ),
    "contract_requires_review": MessageLookupByLibrary.simpleMessage(
      "العقد يتطلب المراجعة",
    ),
    "contract_scope_required": MessageLookupByLibrary.simpleMessage(
      "يرجى تحديد نطاق العمل (10 أحرف على الأقل)",
    ),
    "contract_submitted_successfully": MessageLookupByLibrary.simpleMessage(
      "تم إرسال العقد بنجاح",
    ),
    "contract_terms_header": MessageLookupByLibrary.simpleMessage("شروط العقد"),
    "contract_title": MessageLookupByLibrary.simpleMessage("عنوان العقد"),
    "contract_title_hint": MessageLookupByLibrary.simpleMessage(
      "أدخل عنوان العقد",
    ),
    "contract_title_required": MessageLookupByLibrary.simpleMessage(
      "يرجى إدخال عنوان للعقد (3 أحرف على الأقل)",
    ),
    "contract_withdrawn_successfully": MessageLookupByLibrary.simpleMessage(
      "تم سحب العقد بنجاح",
    ),
    "contracts": MessageLookupByLibrary.simpleMessage("العقود"),
    "contracts_and_change_requests": MessageLookupByLibrary.simpleMessage(
      "العقود وطلبات التغيير",
    ),
    "correction_history": MessageLookupByLibrary.simpleMessage("سجل التصحيحات"),
    "correction_requires_evidence": MessageLookupByLibrary.simpleMessage(
      "يرجى تقديم رقم مرجعي محدث أو ملاحظات أو ملف إيصال مصحح واحد على الأقل.",
    ),
    "country": MessageLookupByLibrary.simpleMessage("الدولة"),
    "country_bahrain": MessageLookupByLibrary.simpleMessage("البحرين"),
    "country_canada": MessageLookupByLibrary.simpleMessage("كندا"),
    "country_egypt": MessageLookupByLibrary.simpleMessage("مصر"),
    "country_france": MessageLookupByLibrary.simpleMessage("فرنسا"),
    "country_germany": MessageLookupByLibrary.simpleMessage("ألمانيا"),
    "country_iraq": MessageLookupByLibrary.simpleMessage("العراق"),
    "country_jordan": MessageLookupByLibrary.simpleMessage("الأردن"),
    "country_kuwait": MessageLookupByLibrary.simpleMessage("الكويت"),
    "country_lebanon": MessageLookupByLibrary.simpleMessage("لبنان"),
    "country_oman": MessageLookupByLibrary.simpleMessage("عُمان"),
    "country_other": MessageLookupByLibrary.simpleMessage("أخرى"),
    "country_palestine": MessageLookupByLibrary.simpleMessage("فلسطين"),
    "country_qatar": MessageLookupByLibrary.simpleMessage("قطر"),
    "country_saudi_arabia": MessageLookupByLibrary.simpleMessage(
      "المملكة العربية السعودية",
    ),
    "country_syria": MessageLookupByLibrary.simpleMessage("سوريا"),
    "country_turkey": MessageLookupByLibrary.simpleMessage("تركيا"),
    "country_united_arab_emirates": MessageLookupByLibrary.simpleMessage(
      "الإمارات العربية المتحدة",
    ),
    "country_united_kingdom": MessageLookupByLibrary.simpleMessage(
      "المملكة المتحدة",
    ),
    "country_united_states": MessageLookupByLibrary.simpleMessage(
      "الولايات المتحدة",
    ),
    "country_yemen": MessageLookupByLibrary.simpleMessage("اليمن"),
    "cr_status_approved": MessageLookupByLibrary.simpleMessage("تمت الموافقة"),
    "cr_status_draft": MessageLookupByLibrary.simpleMessage("مسودة"),
    "cr_status_pending_approval": MessageLookupByLibrary.simpleMessage(
      "بانتظار الموافقة",
    ),
    "cr_status_rejected": MessageLookupByLibrary.simpleMessage("مرفوض"),
    "cr_status_withdrawn": MessageLookupByLibrary.simpleMessage("مسحوب"),
    "create_account": MessageLookupByLibrary.simpleMessage("إنشاء حساب"),
    "create_account_action": MessageLookupByLibrary.simpleMessage(
      "أنشئ حسابًا",
    ),
    "create_account_subtitle": MessageLookupByLibrary.simpleMessage(
      "اختر نوع حسابك وابدأ خلال دقائق",
    ),
    "create_contract": MessageLookupByLibrary.simpleMessage("إنشاء عقد"),
    "create_first_project": MessageLookupByLibrary.simpleMessage(
      "أنشئ مشروعك الأول لبدء متابعة عملك مع العملاء.",
    ),
    "create_new_project": MessageLookupByLibrary.simpleMessage(
      "إنشاء مشروع جديد",
    ),
    "create_project": MessageLookupByLibrary.simpleMessage("إنشاء المشروع"),
    "create_project_description": MessageLookupByLibrary.simpleMessage(
      "قم بتعيين هذا المشروع لزبون موجود لبدء التعاون.",
    ),
    "created": MessageLookupByLibrary.simpleMessage("تاريخ الإنشاء"),
    "criteria_label": m4,
    "currency": MessageLookupByLibrary.simpleMessage("العملة"),
    "currency_three_letter_code": MessageLookupByLibrary.simpleMessage(
      "رمز مكوّن من 3 أحرف",
    ),
    "current_outstanding": MessageLookupByLibrary.simpleMessage(
      "المستحق حالياً",
    ),
    "current_password": MessageLookupByLibrary.simpleMessage(
      "كلمة المرور الحالية",
    ),
    "current_password_required": MessageLookupByLibrary.simpleMessage(
      "كلمة المرور الحالية مطلوبة",
    ),
    "current_project_value": MessageLookupByLibrary.simpleMessage(
      "قيمة المشروع الحالية",
    ),
    "current_value": MessageLookupByLibrary.simpleMessage("القيمة الحالية"),
    "dark_mode": MessageLookupByLibrary.simpleMessage("الوضع الداكن"),
    "data_is_stale": MessageLookupByLibrary.simpleMessage(
      "غير متصل: يتم عرض البيانات المحفوظة مسبقاً.",
    ),
    "days_remaining": m5,
    "delete_failed": MessageLookupByLibrary.simpleMessage("فشل الحذف"),
    "delete_milestone": MessageLookupByLibrary.simpleMessage("حذف المرحلة"),
    "deliverable": MessageLookupByLibrary.simpleMessage("المخرجات المتوقعة"),
    "deliverable_hint": MessageLookupByLibrary.simpleMessage(
      "ما هو العمل الملموس الذي سيتم تسليمه؟",
    ),
    "deliverable_label": m6,
    "deliverables_awaiting_review": MessageLookupByLibrary.simpleMessage(
      "مخرجات بانتظار المراجعة",
    ),
    "describe_evidence_hint": MessageLookupByLibrary.simpleMessage(
      "صف هذا الدليل (5 أحرف على الأقل)...",
    ),
    "description_hint": MessageLookupByLibrary.simpleMessage(
      "صف المهام المطلوبة أو المراحل أو نطاق المشروع...",
    ),
    "description_optional": MessageLookupByLibrary.simpleMessage(
      "الوصف (اختياري)",
    ),
    "dispute_category": MessageLookupByLibrary.simpleMessage("تصنيف النزاع"),
    "dispute_category_acceptance_disagreement":
        MessageLookupByLibrary.simpleMessage("خلاف حول القبول"),
    "dispute_category_deliverable_quality":
        MessageLookupByLibrary.simpleMessage("جودة التسليم"),
    "dispute_category_missed_deadline": MessageLookupByLibrary.simpleMessage(
      "تأخر في الموعد النهائي",
    ),
    "dispute_category_other": MessageLookupByLibrary.simpleMessage("أخرى"),
    "dispute_category_payment_issue": MessageLookupByLibrary.simpleMessage(
      "مشكلة في الدفع",
    ),
    "dispute_category_scope_disagreement": MessageLookupByLibrary.simpleMessage(
      "خلاف على النطاق",
    ),
    "dispute_description": MessageLookupByLibrary.simpleMessage("الوصف"),
    "dispute_description_hint": MessageLookupByLibrary.simpleMessage(
      "صف طبيعة الخلاف (10 أحرف على الأقل)...",
    ),
    "dispute_hold_notice": MessageLookupByLibrary.simpleMessage(
      "تم تعليق دفعة هذه المرحلة نظرًا لوجود نزاع نشط.",
    ),
    "dispute_not_found": MessageLookupByLibrary.simpleMessage(
      "لم يتم العثور على النزاع.",
    ),
    "dispute_opened_success": MessageLookupByLibrary.simpleMessage(
      "تم فتح النزاع بنجاح. تم تطبيق التعليق التشغيلي.",
    ),
    "dispute_status_open": MessageLookupByLibrary.simpleMessage("نزاع مفتوح"),
    "dispute_status_resolution_proposed": MessageLookupByLibrary.simpleMessage(
      "تم اقتراح حل",
    ),
    "dispute_status_resolved": MessageLookupByLibrary.simpleMessage(
      "تم حل النزاع",
    ),
    "disputed_milestone_badge": MessageLookupByLibrary.simpleMessage(
      "قيد النزاع",
    ),
    "disputes": MessageLookupByLibrary.simpleMessage("النزاعات"),
    "disputes_active_count": m7,
    "disputes_coming_soon": MessageLookupByLibrary.simpleMessage(
      "تفاصيل النزاع الكاملة قريبًا",
    ),
    "disputes_none_active": MessageLookupByLibrary.simpleMessage(
      "لا توجد نزاعات نشطة",
    ),
    "disputes_summary": MessageLookupByLibrary.simpleMessage("النزاعات"),
    "dont_have_account": MessageLookupByLibrary.simpleMessage("ليس لديك حساب؟"),
    "due_date": MessageLookupByLibrary.simpleMessage("تاريخ الاستحقاق"),
    "due_label": m8,
    "edit_client": MessageLookupByLibrary.simpleMessage("تعديل الزبون"),
    "edit_details": MessageLookupByLibrary.simpleMessage("تعديل التفاصيل"),
    "edit_milestone": MessageLookupByLibrary.simpleMessage("تعديل المرحلة"),
    "edit_profile": MessageLookupByLibrary.simpleMessage("تعديل الملف الشخصي"),
    "edit_project": MessageLookupByLibrary.simpleMessage("تعديل المشروع"),
    "effective_contract": MessageLookupByLibrary.simpleMessage(
      "الاتفاقية السارية",
    ),
    "effective_date": MessageLookupByLibrary.simpleMessage("تاريخ السريان"),
    "email": MessageLookupByLibrary.simpleMessage("البريد الإلكتروني"),
    "email_already_exists": MessageLookupByLibrary.simpleMessage(
      "يوجد حساب بهذا البريد الإلكتروني بالفعل",
    ),
    "email_or_fullName": MessageLookupByLibrary.simpleMessage(
      "الإيميل أو الاسم الكامل",
    ),
    "emptyCurrency": MessageLookupByLibrary.simpleMessage(""),
    "emptyDefinitionTooltip": MessageLookupByLibrary.simpleMessage(""),
    "emptyDisputeCurrency": MessageLookupByLibrary.simpleMessage(""),
    "emptyGreeting": MessageLookupByLibrary.simpleMessage(""),
    "emptyGuidanceMessage": MessageLookupByLibrary.simpleMessage(""),
    "emptyPeriodCurrency": MessageLookupByLibrary.simpleMessage(""),
    "emptyUserName": MessageLookupByLibrary.simpleMessage(""),
    "enter_change_feedback": MessageLookupByLibrary.simpleMessage(
      "وضح التعديلات المطلوبة (10 أحرف على الأقل)",
    ),
    "enter_valid_amount": MessageLookupByLibrary.simpleMessage(
      "أدخل مبلغًا صحيحًا",
    ),
    "error_during_communication": MessageLookupByLibrary.simpleMessage(
      "حدث خطأ أثناء الاتصال",
    ),
    "evidence_attachments_optional": MessageLookupByLibrary.simpleMessage(
      "مرفقات الأدلة (اختياري)",
    ),
    "evidence_exported_success": MessageLookupByLibrary.simpleMessage(
      "تم تصدير حزمة الأدلة بنجاح.",
    ),
    "evidence_files": MessageLookupByLibrary.simpleMessage("ملفات الإثبات"),
    "evidence_link_hint": MessageLookupByLibrary.simpleMessage(
      "مثال: نموذج Figma، رابط النشر",
    ),
    "evidence_links": MessageLookupByLibrary.simpleMessage("روابط الإثبات"),
    "evidence_package": MessageLookupByLibrary.simpleMessage(
      "حزمة الأدلة والإثباتات",
    ),
    "evidence_required_error": MessageLookupByLibrary.simpleMessage(
      "يجب إرفاق ملف إثبات أو رابط واحد على الأقل",
    ),
    "execution_no_activity_yet": MessageLookupByLibrary.simpleMessage(
      "لا يوجد نشاط بعد",
    ),
    "execution_open_chat": MessageLookupByLibrary.simpleMessage("فتح المحادثة"),
    "execution_overview": MessageLookupByLibrary.simpleMessage(
      "النشاط والمحادثة",
    ),
    "execution_view_activity": MessageLookupByLibrary.simpleMessage(
      "عرض النشاط",
    ),
    "expected_end_date": MessageLookupByLibrary.simpleMessage(
      "تاريخ الانتهاء المتوقع",
    ),
    "export_evidence_package": MessageLookupByLibrary.simpleMessage(
      "تصدير الحزمة",
    ),
    "external_link": MessageLookupByLibrary.simpleMessage("رابط خارجي"),
    "external_link_hint": MessageLookupByLibrary.simpleMessage(
      "الصق رابط الدليل (مثل ملف مشترك أو رسالة أو تسليم)",
    ),
    "failed_to_change_password": MessageLookupByLibrary.simpleMessage(
      "فشل تغيير كلمة المرور",
    ),
    "failed_to_load_clients": MessageLookupByLibrary.simpleMessage(
      "فشل تحميل العملاء",
    ),
    "failed_to_load_profile": MessageLookupByLibrary.simpleMessage(
      "فشل تحميل الملف الشخصي",
    ),
    "failed_to_load_section": MessageLookupByLibrary.simpleMessage(
      "تعذر تحميل هذا القسم.",
    ),
    "failed_update_profile": MessageLookupByLibrary.simpleMessage(
      "فشل تحديث الملف الشخصي",
    ),
    "filter_next_30_days": MessageLookupByLibrary.simpleMessage(
      "خلال 30 يوماً",
    ),
    "filter_next_7_days": MessageLookupByLibrary.simpleMessage("خلال 7 أيام"),
    "filter_overdue": MessageLookupByLibrary.simpleMessage("متأخرة"),
    "financial_overview": MessageLookupByLibrary.simpleMessage(
      "نظرة عامة مالية",
    ),
    "financial_trend": MessageLookupByLibrary.simpleMessage("المؤشر المالي"),
    "first_name": MessageLookupByLibrary.simpleMessage("الاسم الأول"),
    "first_name_min_length": MessageLookupByLibrary.simpleMessage(
      "يجب ألا يقل الاسم الأول عن حرفين",
    ),
    "fixed_amount": MessageLookupByLibrary.simpleMessage("مبلغ ثابت"),
    "forgot_password": MessageLookupByLibrary.simpleMessage(
      "نسيت كلمة المرور؟",
    ),
    "freelancer": MessageLookupByLibrary.simpleMessage("مستقل"),
    "freelancer_description": MessageLookupByLibrary.simpleMessage(
      "أعرض خدماتي وأنفّذ مشاريع للعملاء",
    ),
    "freelancer_information": MessageLookupByLibrary.simpleMessage(
      "معلومات المستقل",
    ),
    "freelancers_overview": MessageLookupByLibrary.simpleMessage(
      "نظرة عامة على المستقلين",
    ),
    "full_name": MessageLookupByLibrary.simpleMessage("الاسم الكامل"),
    "futureMilestoneValue": MessageLookupByLibrary.simpleMessage(
      "قيمة المعالم المستقبلية",
    ),
    "futureMilestoneValueTooltip": MessageLookupByLibrary.simpleMessage(
      "إجمالي قيمة المعالم المجدولة للمستقبل.",
    ),
    "future_milestone_value": MessageLookupByLibrary.simpleMessage(
      "قيمة المراحل المستقبلية",
    ),
    "future_milestone_value_tooltip": MessageLookupByLibrary.simpleMessage(
      "إجمالي قيمة المعالم المجدولة للمستقبل.",
    ),
    "general_terms": MessageLookupByLibrary.simpleMessage("الشروط العامة"),
    "general_terms_hint": MessageLookupByLibrary.simpleMessage(
      "حدد عدد جولات التعديل، وقواعد التواصل، أو الشروط المتفق عليها",
    ),
    "hide_milestones": MessageLookupByLibrary.simpleMessage(
      "إخفاء مراحل الإنجاز",
    ),
    "home": MessageLookupByLibrary.simpleMessage("الرئيسية"),
    "hours_remaining": m9,
    "image_selected_will_be_wired": MessageLookupByLibrary.simpleMessage(
      "تم اختيار الصورة — سيتم الرفع بمجرد تأكيد نقطة النهاية في الخادم.",
    ),
    "in_progress": MessageLookupByLibrary.simpleMessage("قيد التنفيذ"),
    "incomeReceivedThisMonth": MessageLookupByLibrary.simpleMessage(
      "المستلم هذا الشهر",
    ),
    "incomeReceivedThisMonthTooltip": MessageLookupByLibrary.simpleMessage(
      "الدخل المستلم خلال الشهر الحالي.",
    ),
    "income_received_this_month": MessageLookupByLibrary.simpleMessage(
      "المستلم هذا الشهر",
    ),
    "income_received_this_month_tooltip": MessageLookupByLibrary.simpleMessage(
      "الدخل المستلم خلال الشهر الحالي.",
    ),
    "internal_server_error": MessageLookupByLibrary.simpleMessage(
      "حدث خطأ داخلي في الخادم",
    ),
    "invalid_data_submitted": MessageLookupByLibrary.simpleMessage(
      "البيانات المدخلة غير صالحة.",
    ),
    "invalid_email": MessageLookupByLibrary.simpleMessage(
      "يرجى إدخال بريد إلكتروني صالح.",
    ),
    "invalid_phone": MessageLookupByLibrary.simpleMessage(
      "أدخل رقم هاتف صحيحًا",
    ),
    "invalid_phone_number": MessageLookupByLibrary.simpleMessage(
      "أدخل رقم هاتف صالحًا",
    ),
    "invalid_url": MessageLookupByLibrary.simpleMessage(
      "أدخل رابطاً صحيحاً بصيغة HTTP/HTTPS",
    ),
    "invitation_already_accepted": MessageLookupByLibrary.simpleMessage(
      "تم قبول هذه الدعوة",
    ),
    "invitation_details": MessageLookupByLibrary.simpleMessage("تفاصيل الدعوة"),
    "invitation_no_longer_available": MessageLookupByLibrary.simpleMessage(
      "تم قبول هذه الدعوة مسبقًا أو لم تعد متاحة.",
    ),
    "invitation_not_found": MessageLookupByLibrary.simpleMessage(
      "لم يتم العثور على الدعوة.",
    ),
    "invitations": MessageLookupByLibrary.simpleMessage("الدعوات"),
    "invited_you_to_collaborate": MessageLookupByLibrary.simpleMessage(
      "دعوك للتعاون",
    ),
    "keep_project": MessageLookupByLibrary.simpleMessage("الاحتفاظ بالمشروع"),
    "language_change": MessageLookupByLibrary.simpleMessage("تغيير اللغة"),
    "last_month": MessageLookupByLibrary.simpleMessage("الشهر الماضي"),
    "last_name": MessageLookupByLibrary.simpleMessage("الاسم الأخير"),
    "last_name_min_length": MessageLookupByLibrary.simpleMessage(
      "يجب ألا يقل اسم العائلة عن حرفين",
    ),
    "last_updated_at": m10,
    "last_year": MessageLookupByLibrary.simpleMessage("السنة الماضية"),
    "late_freelancer_submission": MessageLookupByLibrary.simpleMessage(
      "تسليم متأخر",
    ),
    "latest_version": MessageLookupByLibrary.simpleMessage("أحدث إصدار"),
    "light_mode": MessageLookupByLibrary.simpleMessage("الوضع الفاتح"),
    "link_title": MessageLookupByLibrary.simpleMessage("عنوان الرابط"),
    "link_url": MessageLookupByLibrary.simpleMessage("الرابط"),
    "load_more": MessageLookupByLibrary.simpleMessage("تحميل المزيد"),
    "loading_clients": MessageLookupByLibrary.simpleMessage(
      "جارٍ تحميل العملاء...",
    ),
    "local_storage_error": MessageLookupByLibrary.simpleMessage(
      "حدث خطأ في التخزين المحلي",
    ),
    "login": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
    "login_action": MessageLookupByLibrary.simpleMessage("سجل دخول"),
    "login_subtitle": MessageLookupByLibrary.simpleMessage(
      "أدخل بياناتك للمتابعة إلى لوحة العمل",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("تسجيل الخروج"),
    "logout_confirmation": MessageLookupByLibrary.simpleMessage(
      "هل أنت متأكد من رغبتك في تسجيل الخروج؟",
    ),
    "logout_failed": MessageLookupByLibrary.simpleMessage("فشل تسجيل الخروج"),
    "mark_all_read": MessageLookupByLibrary.simpleMessage("تحديد الكل كمقروء"),
    "metric_definition": MessageLookupByLibrary.simpleMessage("تعريف المؤشر"),
    "milestone": MessageLookupByLibrary.simpleMessage("المرحلة"),
    "milestone_actions_paused_dispute": MessageLookupByLibrary.simpleMessage(
      "تم إيقاف إجراءات القبول والدفع مؤقتًا أثناء وجود نزاع نشط.",
    ),
    "milestone_description": MessageLookupByLibrary.simpleMessage(
      "وصف المرحلة",
    ),
    "milestone_details": MessageLookupByLibrary.simpleMessage("تفاصيل المرحلة"),
    "milestone_overdue": MessageLookupByLibrary.simpleMessage("متأخرة"),
    "milestone_payment": MessageLookupByLibrary.simpleMessage("دفعة المرحلة"),
    "milestone_payment_status": MessageLookupByLibrary.simpleMessage(
      "حالة دفع المراحل",
    ),
    "milestone_status_accepted": MessageLookupByLibrary.simpleMessage("مقبولة"),
    "milestone_status_in_progress": MessageLookupByLibrary.simpleMessage(
      "قيد التنفيذ",
    ),
    "milestone_status_not_started": MessageLookupByLibrary.simpleMessage(
      "لم تبدأ",
    ),
    "milestone_status_revision_requested": MessageLookupByLibrary.simpleMessage(
      "مطلوب تعديل",
    ),
    "milestone_status_submitted": MessageLookupByLibrary.simpleMessage(
      "بانتظار المراجعة",
    ),
    "milestone_title": MessageLookupByLibrary.simpleMessage("عنوان المرحلة"),
    "milestones": MessageLookupByLibrary.simpleMessage("المراحل"),
    "min_length": m11,
    "modified_badge": MessageLookupByLibrary.simpleMessage("معدَّل"),
    "my_projects": MessageLookupByLibrary.simpleMessage("مشاريعي"),
    "needs_your_attention": MessageLookupByLibrary.simpleMessage(
      "يحتاج انتباهك",
    ),
    "new_badge": MessageLookupByLibrary.simpleMessage("جديد"),
    "new_change_request": MessageLookupByLibrary.simpleMessage(
      "طلب تغيير جديد",
    ),
    "new_password": MessageLookupByLibrary.simpleMessage("كلمة المرور الجديدة"),
    "new_project": MessageLookupByLibrary.simpleMessage("مشروع جديد"),
    "next_pick_file": MessageLookupByLibrary.simpleMessage(
      "التالي: اختر ملفاً",
    ),
    "no_active_projects": MessageLookupByLibrary.simpleMessage(
      "لا توجد مشاريع نشطة",
    ),
    "no_activity_recorded": MessageLookupByLibrary.simpleMessage(
      "لا يوجد نشاط مسجل بعد",
    ),
    "no_amendments_ratified": MessageLookupByLibrary.simpleMessage(
      "لم يتم التصديق على أي تعديلات بعد.",
    ),
    "no_change_requests": MessageLookupByLibrary.simpleMessage(
      "لا توجد طلبات تعديل",
    ),
    "no_client_assigned": MessageLookupByLibrary.simpleMessage(
      "لم يتم تعيين زبون",
    ),
    "no_clients_available": MessageLookupByLibrary.simpleMessage(
      "لا يوجد عملاء متاحون. أضف زبوناً أولاً.",
    ),
    "no_clients_found": MessageLookupByLibrary.simpleMessage(
      "لم يتم العثور على عملاء",
    ),
    "no_contract_created": MessageLookupByLibrary.simpleMessage(
      "لم يتم إنشاء عقد لهذا المشروع بعد.",
    ),
    "no_contract_terms": MessageLookupByLibrary.simpleMessage(
      "لا يتوفر ملخص لشروط العقد.",
    ),
    "no_description_for_project": MessageLookupByLibrary.simpleMessage(
      "لم يتم تقديم وصف لهذا المشروع.",
    ),
    "no_evidence_files": MessageLookupByLibrary.simpleMessage(
      "لم تتم إضافة ملفات دليل بعد.",
    ),
    "no_evidence_package": MessageLookupByLibrary.simpleMessage(
      "لا تتوفر بيانات حزمة الأدلة.",
    ),
    "no_internet_connection": MessageLookupByLibrary.simpleMessage(
      "لا يوجد اتصال بالإنترنت",
    ),
    "no_matching_projects": MessageLookupByLibrary.simpleMessage(
      "لا توجد مشاريع مطابقة",
    ),
    "no_messages_yet": MessageLookupByLibrary.simpleMessage(
      "لا توجد رسائل بعد. ابدأ المحادثة!",
    ),
    "no_milestones_found": MessageLookupByLibrary.simpleMessage(
      "لم يتم العثور على مراحل.",
    ),
    "no_milestones_yet": MessageLookupByLibrary.simpleMessage(
      "لا يوجد مراحل بعد",
    ),
    "no_notifications": MessageLookupByLibrary.simpleMessage("لا توجد إشعارات"),
    "no_pending_invitations": MessageLookupByLibrary.simpleMessage(
      "لا توجد دعوات معلقة",
    ),
    "no_pending_invitations_description": MessageLookupByLibrary.simpleMessage(
      "عندما يدعوك المستقلون للتعاون في المشاريع، ستظهر الدعوات هنا.",
    ),
    "no_project_description": MessageLookupByLibrary.simpleMessage(
      "لم يتم تقديم وصف للمشروع.",
    ),
    "no_projects_for_client": MessageLookupByLibrary.simpleMessage(
      "لا توجد مشاريع لهذا الزبون حتى الآن",
    ),
    "no_projects_yet": MessageLookupByLibrary.simpleMessage(
      "لا توجد مشاريع حتى الآن",
    ),
    "no_resolution_proposals": MessageLookupByLibrary.simpleMessage(
      "لم يتم تقديم أي مقترحات حل بعد.",
    ),
    "no_submissions_yet": MessageLookupByLibrary.simpleMessage(
      "لم يتم تسليم أي أعمال بعد.",
    ),
    "no_supplementary_evidence": MessageLookupByLibrary.simpleMessage(
      "لم يتم رفع أدلة تكميلية.",
    ),
    "non_custodial_disclaimer": MessageLookupByLibrary.simpleMessage(
      "ميثاق هو سجل تتبّع معلوماتي ولا يحتفظ بالأموال أو يقدم خدمات الضمان المالي.",
    ),
    "notYetEligible": MessageLookupByLibrary.simpleMessage("غير مؤهل بعد"),
    "notYetEligibleTooltip": MessageLookupByLibrary.simpleMessage(
      "المبالغ التي لم تصبح مؤهلة للدفع بعد.",
    ),
    "not_allowed": MessageLookupByLibrary.simpleMessage("غير مسموح."),
    "not_now": MessageLookupByLibrary.simpleMessage("ليس الآن"),
    "not_set": MessageLookupByLibrary.simpleMessage("غير محدد"),
    "not_started": MessageLookupByLibrary.simpleMessage("لم يبدأ"),
    "not_yet_eligible": MessageLookupByLibrary.simpleMessage("غير مؤهل بعد"),
    "not_yet_eligible_tooltip": MessageLookupByLibrary.simpleMessage(
      "المبالغ التي لم تصبح مؤهلة للدفع بعد.",
    ),
    "notes": MessageLookupByLibrary.simpleMessage("ملاحظات"),
    "notes_optional": MessageLookupByLibrary.simpleMessage("ملاحظات (اختياري)"),
    "notes_required_error": MessageLookupByLibrary.simpleMessage(
      "ملاحظات التسليم مطلوبة",
    ),
    "notifications": MessageLookupByLibrary.simpleMessage("الإشعارات"),
    "onDisputeHold": MessageLookupByLibrary.simpleMessage("معلّق بسبب نزاع"),
    "onDisputeHoldTooltip": MessageLookupByLibrary.simpleMessage(
      "المبالغ المعلّقة حاليًا بسبب نزاع مفتوح.",
    ),
    "on_dispute_hold": MessageLookupByLibrary.simpleMessage("قيد تعليق النزاع"),
    "on_dispute_hold_tooltip": MessageLookupByLibrary.simpleMessage(
      "المبالغ المعلّقة حاليًا بسبب نزاع مفتوح.",
    ),
    "onboarding_progression": MessageLookupByLibrary.simpleMessage(
      "مراحل البدء",
    ),
    "only_freelancers_manage_clients": MessageLookupByLibrary.simpleMessage(
      "يمكن للمستقلين فقط إدارة العملاء.",
    ),
    "open_dispute": MessageLookupByLibrary.simpleMessage("فتح نزاع"),
    "overdue_client_review": MessageLookupByLibrary.simpleMessage(
      "مراجعة الزبون متأخرة",
    ),
    "password": MessageLookupByLibrary.simpleMessage("كلمة المرور"),
    "password_changed_successfully": MessageLookupByLibrary.simpleMessage(
      "تم تغيير كلمة المرور بنجاح",
    ),
    "password_char_required": MessageLookupByLibrary.simpleMessage(
      "يجب أن تحتوي كلمة المرور على حرف واحد على الأقل.",
    ),
    "password_min_length": MessageLookupByLibrary.simpleMessage(
      "يجب أن تتكون كلمة المرور من 8 أحرف على الأقل.",
    ),
    "password_num_required": MessageLookupByLibrary.simpleMessage(
      "يجب أن تحتوي كلمة المرور على رقم واحد على الأقل.",
    ),
    "password_special_char_required": MessageLookupByLibrary.simpleMessage(
      "يجب أن تحتوي كلمة المرور على مز خاص.",
    ),
    "passwords_do_not_match": MessageLookupByLibrary.simpleMessage(
      "كلمتا المرور غير متطابقتين",
    ),
    "paymentIssues": MessageLookupByLibrary.simpleMessage("مشاكل الدفع"),
    "paymentIssuesTooltip": MessageLookupByLibrary.simpleMessage(
      "المدفوعات التي واجهت مشكلة وتحتاج إلى مراجعة.",
    ),
    "payment_amount": MessageLookupByLibrary.simpleMessage("مبلغ الدفع"),
    "payment_confirmed_success": MessageLookupByLibrary.simpleMessage(
      "تم تأكيد استلام الدفع بنجاح.",
    ),
    "payment_date": MessageLookupByLibrary.simpleMessage("تاريخ الدفع"),
    "payment_evidence_receipts": MessageLookupByLibrary.simpleMessage(
      "أدلة الدفع / الإيصالات",
    ),
    "payment_evidence_submitted": MessageLookupByLibrary.simpleMessage(
      "تم تقديم دليل الدفع المصحح بنجاح.",
    ),
    "payment_issue_hint": MessageLookupByLibrary.simpleMessage(
      "صف التناقض أو المشكلة في الدفع بالتفصيل...",
    ),
    "payment_issue_reported": MessageLookupByLibrary.simpleMessage(
      "تم الإبلاغ عن مشكلة الدفع.",
    ),
    "payment_issues": MessageLookupByLibrary.simpleMessage("مشكلات الدفع"),
    "payment_issues_tooltip": MessageLookupByLibrary.simpleMessage(
      "المدفوعات التي واجهت مشكلة وتحتاج إلى مراجعة.",
    ),
    "payment_method": MessageLookupByLibrary.simpleMessage("طريقة الدفع"),
    "payment_method_bank_transfer": MessageLookupByLibrary.simpleMessage(
      "تحويل بنكي",
    ),
    "payment_method_cash": MessageLookupByLibrary.simpleMessage("نقدًا"),
    "payment_method_instapay": MessageLookupByLibrary.simpleMessage("إنستاباي"),
    "payment_method_other": MessageLookupByLibrary.simpleMessage("أخرى"),
    "payment_method_stc_pay": MessageLookupByLibrary.simpleMessage(
      "إس تي سي باي",
    ),
    "payment_notes": MessageLookupByLibrary.simpleMessage("ملاحظات الدفع"),
    "payment_notes_hint": MessageLookupByLibrary.simpleMessage(
      "ملاحظات اختيارية للمستقل...",
    ),
    "payment_receipts": MessageLookupByLibrary.simpleMessage("إيصالات الدفع"),
    "payment_recorded_success": MessageLookupByLibrary.simpleMessage(
      "تم تسجيل الدفع بنجاح.",
    ),
    "payment_requires_reference_or_file": MessageLookupByLibrary.simpleMessage(
      "يرجى تقديم رقم مرجعي للعملية أو ملف إيصال واحد على الأقل.",
    ),
    "payment_status_awaiting_confirmation":
        MessageLookupByLibrary.simpleMessage("بانتظار تأكيد الاستلام"),
    "payment_status_eligible": MessageLookupByLibrary.simpleMessage(
      "مؤهل للدفع",
    ),
    "payment_status_issue_reported": MessageLookupByLibrary.simpleMessage(
      "تم الإبلاغ عن مشكلة",
    ),
    "payment_status_not_eligible": MessageLookupByLibrary.simpleMessage(
      "غير مؤهل للدفع",
    ),
    "payment_status_paid": MessageLookupByLibrary.simpleMessage("تم الدفع"),
    "payments_awaiting_confirmation": MessageLookupByLibrary.simpleMessage(
      "بانتظار التأكيد",
    ),
    "payments_no_activity_yet": MessageLookupByLibrary.simpleMessage(
      "لا توجد مدفوعات بعد",
    ),
    "payments_summary": MessageLookupByLibrary.simpleMessage("المدفوعات"),
    "payments_total_paid": MessageLookupByLibrary.simpleMessage("المدفوع"),
    "payments_total_unpaid": MessageLookupByLibrary.simpleMessage(
      "غير المدفوع",
    ),
    "payments_view_details": MessageLookupByLibrary.simpleMessage(
      "عرض تفاصيل الدفع",
    ),
    "pending": MessageLookupByLibrary.simpleMessage("قيد الانتظار"),
    "pending_status": MessageLookupByLibrary.simpleMessage("قيد الانتظار"),
    "pending_tab": MessageLookupByLibrary.simpleMessage("قيد الانتظار"),
    "percentage": MessageLookupByLibrary.simpleMessage("نسبة مئوية"),
    "personal_information": MessageLookupByLibrary.simpleMessage(
      "المعلومات الشخصية",
    ),
    "phone": MessageLookupByLibrary.simpleMessage("رقم الهاتف"),
    "phone_number": MessageLookupByLibrary.simpleMessage("رقم الهاتف"),
    "phone_number_required": MessageLookupByLibrary.simpleMessage(
      "رقم الهاتف مطلوب",
    ),
    "photo_removed": MessageLookupByLibrary.simpleMessage("تمت إزالة الصورة."),
    "please_assign_client": MessageLookupByLibrary.simpleMessage(
      "يرجى تعيين زبون",
    ),
    "preview_contract": MessageLookupByLibrary.simpleMessage("معاينة العقد"),
    "professional": MessageLookupByLibrary.simpleMessage("المعلومات المهنية"),
    "professional_title": MessageLookupByLibrary.simpleMessage(
      "المسمى الوظيفي",
    ),
    "professional_title_required": MessageLookupByLibrary.simpleMessage(
      "المسمى الوظيفي مطلوب",
    ),
    "profile": MessageLookupByLibrary.simpleMessage("الملف الشخصي"),
    "project_accepted_successfully": MessageLookupByLibrary.simpleMessage(
      "تم قبول المشروع بنجاح",
    ),
    "project_chat": MessageLookupByLibrary.simpleMessage("محادثة المشروع"),
    "project_completed_success": MessageLookupByLibrary.simpleMessage(
      "تم إكمال المشروع بنجاح!",
    ),
    "project_completion": MessageLookupByLibrary.simpleMessage(
      "اكتمال المشروع",
    ),
    "project_created_successfully": MessageLookupByLibrary.simpleMessage(
      "تم إنشاء المشروع بنجاح",
    ),
    "project_details": MessageLookupByLibrary.simpleMessage("تفاصيل المشروع"),
    "project_information": MessageLookupByLibrary.simpleMessage(
      "معلومات المشروع",
    ),
    "project_not_found": MessageLookupByLibrary.simpleMessage(
      "لم يتم العثور على المشروع.",
    ),
    "project_overview": MessageLookupByLibrary.simpleMessage(
      "نظرة عامة على المشاريع",
    ),
    "project_payment_summary": MessageLookupByLibrary.simpleMessage(
      "ملخص المدفوعات",
    ),
    "project_scope_description": MessageLookupByLibrary.simpleMessage(
      "نطاق المشروع والوصف",
    ),
    "project_status_managed_separately": MessageLookupByLibrary.simpleMessage(
      "تتم إدارة الزبون وحالة المشروع بشكل منفصل من شاشة تفاصيل المشروع.",
    ),
    "project_title": MessageLookupByLibrary.simpleMessage("عنوان المشروع"),
    "project_title_hint": MessageLookupByLibrary.simpleMessage(
      "مثال: إعادة تصميم تطبيق جوال",
    ),
    "project_title_required": MessageLookupByLibrary.simpleMessage(
      "عنوان المشروع مطلوب",
    ),
    "project_total_value_required_for_contract":
        MessageLookupByLibrary.simpleMessage(
          "هذا المشروع لا يملك قيمة إجمالية محددة. الرجاء تعديل المشروع وإضافة قيمة قبل إنشاء عقد.",
        ),
    "project_updated_successfully": MessageLookupByLibrary.simpleMessage(
      "تم تحديث المشروع بنجاح",
    ),
    "project_value": MessageLookupByLibrary.simpleMessage("قيمة المشروع"),
    "projects": MessageLookupByLibrary.simpleMessage("المشاريع"),
    "propose_resolution": MessageLookupByLibrary.simpleMessage("اقتراح حل"),
    "proposed_milestone_terms": MessageLookupByLibrary.simpleMessage(
      "شروط المراحل المقترحة",
    ),
    "proposed_milestones": MessageLookupByLibrary.simpleMessage(
      "المراحل المقترحة",
    ),
    "proposed_project_value": MessageLookupByLibrary.simpleMessage(
      "قيمة المشروع المقترحة",
    ),
    "proposed_resolution_hint": MessageLookupByLibrary.simpleMessage(
      "أدخل شروط الحل المقترح (10 أحرف على الأقل)...",
    ),
    "proposed_terms": MessageLookupByLibrary.simpleMessage("بنود الحل المقترح"),
    "proposed_value": MessageLookupByLibrary.simpleMessage("القيمة المقترحة"),
    "provide_rejection_reason": MessageLookupByLibrary.simpleMessage(
      "أدخل سبب الرفض...",
    ),
    "ratified": MessageLookupByLibrary.simpleMessage("مُصادَق عليه"),
    "readyForClientPayment": MessageLookupByLibrary.simpleMessage(
      "جاهز لدفع الزبون",
    ),
    "readyForClientPaymentTooltip": MessageLookupByLibrary.simpleMessage(
      "المبالغ الجاهزة لدفعها من قبل الزبون.",
    ),
    "readyForPayment": MessageLookupByLibrary.simpleMessage("جاهز للدفع"),
    "readyForPaymentTooltip": MessageLookupByLibrary.simpleMessage(
      "المبالغ المعتمدة والجاهزة للدفع.",
    ),
    "ready_for_client_payment": MessageLookupByLibrary.simpleMessage(
      "جاهز لدفع الزبون",
    ),
    "ready_for_client_payment_tooltip": MessageLookupByLibrary.simpleMessage(
      "المبالغ الجاهزة لدفعها من قبل الزبون.",
    ),
    "ready_for_payment": MessageLookupByLibrary.simpleMessage("جاهز للدفع"),
    "ready_for_payment_tooltip": MessageLookupByLibrary.simpleMessage(
      "المبالغ المعتمدة والجاهزة للدفع.",
    ),
    "reason_for_rejection": MessageLookupByLibrary.simpleMessage("سبب الرفض"),
    "reason_label": m12,
    "reason_length_error": MessageLookupByLibrary.simpleMessage(
      "يجب أن يكون السبب بين 10 و4000 حرف",
    ),
    "reason_required_error": MessageLookupByLibrary.simpleMessage(
      "سبب طلب التعديل مطلوب",
    ),
    "recent_activity": MessageLookupByLibrary.simpleMessage("النشاط الأخير"),
    "recent_messages": MessageLookupByLibrary.simpleMessage("الرسائل الأخيرة"),
    "record_payment": MessageLookupByLibrary.simpleMessage("تسجيل دفعة"),
    "registration_success_missing_user": MessageLookupByLibrary.simpleMessage(
      "تم التسجيل بنجاح، ولكن بيانات المستخدم غير متوفرة.",
    ),
    "reject": MessageLookupByLibrary.simpleMessage("رفض"),
    "reject_change_request": MessageLookupByLibrary.simpleMessage(
      "رفض طلب التغيير",
    ),
    "reject_resolution": MessageLookupByLibrary.simpleMessage("رفض الحل"),
    "rejected": MessageLookupByLibrary.simpleMessage("مرفوض"),
    "rejection_reason_hint": MessageLookupByLibrary.simpleMessage(
      "أدخل سبب رفض مقترح الحل...",
    ),
    "remaining_value": MessageLookupByLibrary.simpleMessage("القيمة المتبقية"),
    "remind_client": MessageLookupByLibrary.simpleMessage("تذكير الزبون"),
    "reminder_cooldown_message": MessageLookupByLibrary.simpleMessage(
      "تم إرسال تذكير مؤخرًا. يرجى الانتظار قبل إرسال تذكير آخر.",
    ),
    "remove": MessageLookupByLibrary.simpleMessage("إزالة"),
    "remove_milestone": MessageLookupByLibrary.simpleMessage("إزالة المرحلة؟"),
    "report_payment_issue": MessageLookupByLibrary.simpleMessage(
      "الإبلاغ عن مشكلة دفع",
    ),
    "request_cancelled": MessageLookupByLibrary.simpleMessage("تم إلغاء الطلب"),
    "request_changes": MessageLookupByLibrary.simpleMessage("طلب تعديلات"),
    "request_failed": MessageLookupByLibrary.simpleMessage("فشل الطلب"),
    "request_revision": MessageLookupByLibrary.simpleMessage("طلب تعديل"),
    "requested_info_not_found": MessageLookupByLibrary.simpleMessage(
      "لم يتم العثور على المعلومات المطلوبة",
    ),
    "requested_resolution": MessageLookupByLibrary.simpleMessage(
      "الحل المطلوب",
    ),
    "requests_tab": MessageLookupByLibrary.simpleMessage("الطلبات"),
    "required_changes": MessageLookupByLibrary.simpleMessage(
      "التعديلات المطلوبة",
    ),
    "required_changes_hint": MessageLookupByLibrary.simpleMessage(
      "مثال: إضافة تصميم متجاوب للأجهزة اللوحية والهواتف",
    ),
    "required_email": MessageLookupByLibrary.simpleMessage(
      "البريد الإلكتروني مطلوب",
    ),
    "required_email_or_fullname": MessageLookupByLibrary.simpleMessage(
      "البريد الإلكتروني أو الاسم مطلوب",
    ),
    "required_first_name": MessageLookupByLibrary.simpleMessage(
      "الاسم الأول مطلوب.",
    ),
    "required_last_name": MessageLookupByLibrary.simpleMessage(
      "اسم العائلة مطلوب.",
    ),
    "required_password": MessageLookupByLibrary.simpleMessage(
      "كلمة المرور مطلوبة",
    ),
    "required_professional_title": MessageLookupByLibrary.simpleMessage(
      "المسمى المهني مطلوب",
    ),
    "required_username": MessageLookupByLibrary.simpleMessage(
      "اسم المستخدم مطلوب",
    ),
    "resolution_proposals": MessageLookupByLibrary.simpleMessage(
      "مقترحات الحل",
    ),
    "resolution_request_hint": MessageLookupByLibrary.simpleMessage(
      "ما النتيجة أو الإصلاح الذي تطلبه؟ (10 أحرف على الأقل)...",
    ),
    "resubmit_contract": MessageLookupByLibrary.simpleMessage(
      "إعادة إرسال العقد",
    ),
    "resubmit_deliverable": MessageLookupByLibrary.simpleMessage(
      "إعادة تسليم العمل",
    ),
    "resulting_value": MessageLookupByLibrary.simpleMessage("القيمة الناتجة"),
    "retry": MessageLookupByLibrary.simpleMessage("إعادة المحاولة"),
    "review_client_feedback": MessageLookupByLibrary.simpleMessage(
      "مراجعة ملاحظات الزبون",
    ),
    "review_contract": MessageLookupByLibrary.simpleMessage("مراجعة العقد"),
    "review_deadline": MessageLookupByLibrary.simpleMessage(
      "الموعد النهائي للمراجعة",
    ),
    "review_deliverable": MessageLookupByLibrary.simpleMessage(
      "مراجعة التسليم",
    ),
    "review_invitation": MessageLookupByLibrary.simpleMessage("مراجعة الدعوة"),
    "review_overdue": MessageLookupByLibrary.simpleMessage("المراجعة متأخرة"),
    "revision_reason": MessageLookupByLibrary.simpleMessage("سبب طلب التعديل"),
    "revision_reason_hint": MessageLookupByLibrary.simpleMessage(
      "مثال: التصميم لا يتطابق مع معايير القبول",
    ),
    "save_and_preview_contract": MessageLookupByLibrary.simpleMessage(
      "حفظ و معاينة العقد",
    ),
    "save_changes": MessageLookupByLibrary.simpleMessage("حفظ التغييرات"),
    "scope_description": MessageLookupByLibrary.simpleMessage(
      "وصف نطاق التغيير",
    ),
    "scope_label": m13,
    "scope_length_error": MessageLookupByLibrary.simpleMessage(
      "يجب أن يكون وصف نطاق العمل بين 10 و4000 حرف",
    ),
    "scope_of_work": MessageLookupByLibrary.simpleMessage("نطاق العمل"),
    "scope_of_work_hint": MessageLookupByLibrary.simpleMessage(
      "صف المهام والمخرجات المشمولة في هذا المشروع",
    ),
    "search": MessageLookupByLibrary.simpleMessage("بحث"),
    "search_clients": MessageLookupByLibrary.simpleMessage(
      "البحث عن العملاء...",
    ),
    "search_projects_by_title": MessageLookupByLibrary.simpleMessage(
      "البحث عن المشاريع حسب العنوان...",
    ),
    "select_client": MessageLookupByLibrary.simpleMessage("اختر زبوناً"),
    "sent_by": MessageLookupByLibrary.simpleMessage("أُرسلت بواسطة"),
    "server_error": MessageLookupByLibrary.simpleMessage("حدث خطأ في الخادم"),
    "session_expired": MessageLookupByLibrary.simpleMessage("انتهت جلستك."),
    "session_expired_login_again": MessageLookupByLibrary.simpleMessage(
      "انتهت جلستك. يرجى تسجيل الدخول مرة أخرى.",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("الإعدادات"),
    "single_pending_cr_error": MessageLookupByLibrary.simpleMessage(
      "يُسمح بطلب تغيير واحد فقط قيد المراجعة لكل مشروع.",
    ),
    "something_went_wrong": MessageLookupByLibrary.simpleMessage("حدث خطأ ما"),
    "start_date": MessageLookupByLibrary.simpleMessage("تاريخ البدء"),
    "start_milestone": MessageLookupByLibrary.simpleMessage("بدء المرحلة"),
    "status_accepted": MessageLookupByLibrary.simpleMessage("تم القبول"),
    "status_approved": MessageLookupByLibrary.simpleMessage("معتمد"),
    "status_changes_requested": MessageLookupByLibrary.simpleMessage(
      "تعديلات مطلوبة",
    ),
    "status_draft": MessageLookupByLibrary.simpleMessage("مسودة"),
    "status_in_progress": MessageLookupByLibrary.simpleMessage("قيد التنفيذ"),
    "status_not_started": MessageLookupByLibrary.simpleMessage("لم تبدأ"),
    "status_pending_approval": MessageLookupByLibrary.simpleMessage(
      "بانتظار الموافقة",
    ),
    "status_submitted": MessageLookupByLibrary.simpleMessage("تم التسليم"),
    "step_add_client": MessageLookupByLibrary.simpleMessage("إضافة زبون"),
    "step_create_project": MessageLookupByLibrary.simpleMessage("إنشاء مشروع"),
    "step_prepare_contract": MessageLookupByLibrary.simpleMessage(
      "إعداد العقد",
    ),
    "step_send_for_approval": MessageLookupByLibrary.simpleMessage(
      "إرسال لموافقة الزبون",
    ),
    "submission_history": MessageLookupByLibrary.simpleMessage("سجل التسليمات"),
    "submission_notes": MessageLookupByLibrary.simpleMessage("ملاحظات التسليم"),
    "submission_notes_hint": MessageLookupByLibrary.simpleMessage(
      "صف العمل المنجز في هذا التسليم...",
    ),
    "submit_change_request": MessageLookupByLibrary.simpleMessage(
      "إرسال طلب التعديل",
    ),
    "submit_corrected_evidence": MessageLookupByLibrary.simpleMessage(
      "إرسال إثبات مصحح",
    ),
    "submit_deliverable": MessageLookupByLibrary.simpleMessage("تسليم العمل"),
    "submit_for_approval": MessageLookupByLibrary.simpleMessage(
      "إرسال للموافقة",
    ),
    "support_short": MessageLookupByLibrary.simpleMessage("الدعم"),
    "tab_activity_history": MessageLookupByLibrary.simpleMessage("سجل النشاط"),
    "tab_contract_criteria": MessageLookupByLibrary.simpleMessage(
      "العقد والمعايير",
    ),
    "tab_dispute_evidence": MessageLookupByLibrary.simpleMessage("أدلة النزاع"),
    "tab_messages": MessageLookupByLibrary.simpleMessage("الرسائل"),
    "tab_payment_evidence": MessageLookupByLibrary.simpleMessage("إثبات الدفع"),
    "tab_submissions": MessageLookupByLibrary.simpleMessage("التسليمات"),
    "table_view": MessageLookupByLibrary.simpleMessage("عرض الجدول"),
    "tap_photo": MessageLookupByLibrary.simpleMessage("اضغط لتغيير الصورة"),
    "tap_to_retry": MessageLookupByLibrary.simpleMessage(
      "اضغط لإعادة المحاولة",
    ),
    "this_month": MessageLookupByLibrary.simpleMessage("هذا الشهر"),
    "this_year": MessageLookupByLibrary.simpleMessage("هذه السنة"),
    "timeline": MessageLookupByLibrary.simpleMessage("الجدول الزمني"),
    "title": MessageLookupByLibrary.simpleMessage("العنوان"),
    "title_length_error": MessageLookupByLibrary.simpleMessage(
      "يجب أن يكون العنوان بين 3 و200 حرف",
    ),
    "title_too_short": MessageLookupByLibrary.simpleMessage(
      "العنوان قصير جدًا",
    ),
    "today": MessageLookupByLibrary.simpleMessage("اليوم"),
    "too_many_requests": MessageLookupByLibrary.simpleMessage(
      "طلبات كثيرة جدًا. يرجى المحاولة مرة أخرى بعد قليل.",
    ),
    "totalConfirmedPayments": MessageLookupByLibrary.simpleMessage(
      "إجمالي المدفوعات المؤكدة",
    ),
    "totalConfirmedPaymentsTooltip": MessageLookupByLibrary.simpleMessage(
      "إجمالي قيمة جميع المدفوعات المؤكدة حتى الآن.",
    ),
    "totalIncomeReceived": MessageLookupByLibrary.simpleMessage(
      "إجمالي الدخل المستلم",
    ),
    "totalIncomeReceivedTooltip": MessageLookupByLibrary.simpleMessage(
      "إجمالي الدخل الذي استلمته.",
    ),
    "totalUnpaidValue": MessageLookupByLibrary.simpleMessage(
      "إجمالي القيمة غير المدفوعة",
    ),
    "totalUnpaidValueTooltip": MessageLookupByLibrary.simpleMessage(
      "إجمالي القيمة التي لم يتم دفعها بعد.",
    ),
    "total_confirmed_payments": MessageLookupByLibrary.simpleMessage(
      "إجمالي المدفوعات المؤكدة",
    ),
    "total_confirmed_payments_tooltip": MessageLookupByLibrary.simpleMessage(
      "إجمالي قيمة جميع المدفوعات المؤكدة حتى الآن.",
    ),
    "total_income_received": MessageLookupByLibrary.simpleMessage(
      "إجمالي الدخل المستلم",
    ),
    "total_income_received_tooltip": MessageLookupByLibrary.simpleMessage(
      "إجمالي الدخل الذي استلمته.",
    ),
    "total_milestones": MessageLookupByLibrary.simpleMessage("إجمالي المراحل"),
    "total_paid": MessageLookupByLibrary.simpleMessage("إجمالي المدفوع"),
    "total_unpaid": MessageLookupByLibrary.simpleMessage("إجمالي غير المدفوع"),
    "total_unpaid_value": MessageLookupByLibrary.simpleMessage(
      "إجمالي القيمة غير المدفوعة",
    ),
    "total_unpaid_value_tooltip": MessageLookupByLibrary.simpleMessage(
      "إجمالي القيمة التي لم يتم دفعها بعد.",
    ),
    "total_value_optional": MessageLookupByLibrary.simpleMessage(
      "القيمة الكلية (اختياري)",
    ),
    "transaction_reference": MessageLookupByLibrary.simpleMessage(
      "الرقم المرجعي للعملية",
    ),
    "transaction_reference_hint": MessageLookupByLibrary.simpleMessage(
      "مثال: TRX-902188",
    ),
    "trend_months_12": MessageLookupByLibrary.simpleMessage("12 شهراً"),
    "trend_months_6": MessageLookupByLibrary.simpleMessage("6 أشهر"),
    "type_a_message": MessageLookupByLibrary.simpleMessage("اكتب رسالة..."),
    "unable_to_open_file": MessageLookupByLibrary.simpleMessage(
      "تعذّر فتح الملف. يرجى المحاولة مرة أخرى.",
    ),
    "unassign": MessageLookupByLibrary.simpleMessage("إلغاء التعيين"),
    "unassigned": MessageLookupByLibrary.simpleMessage("غير مُعيّن"),
    "unassigned_client": MessageLookupByLibrary.simpleMessage(
      "زبون غير مُعيّن",
    ),
    "unauthorized": MessageLookupByLibrary.simpleMessage("غير مصرح لك"),
    "unknown_error_occurred": MessageLookupByLibrary.simpleMessage(
      "حدث خطأ غير معروف",
    ),
    "upcoming_milestones": MessageLookupByLibrary.simpleMessage(
      "المراحل القادمة",
    ),
    "update_your_account_password": MessageLookupByLibrary.simpleMessage(
      "حدّث كلمة مرور حسابك",
    ),
    "upload_failed": MessageLookupByLibrary.simpleMessage("فشل الرفع"),
    "url_required": MessageLookupByLibrary.simpleMessage("الرابط مطلوب"),
    "username_invalid": MessageLookupByLibrary.simpleMessage(
      "يسمح باستخدام الأحرف والأرقام والشرطة السفلية فقط",
    ),
    "username_invalid_characters": MessageLookupByLibrary.simpleMessage(
      "يسمح باستخدام الأحرف والأرقام والشرطة السفلية فقط",
    ),
    "username_min_length": MessageLookupByLibrary.simpleMessage(
      "يجب ألا يقل اسم المستخدم عن 3 أحرف",
    ),
    "username_required": MessageLookupByLibrary.simpleMessage(
      "اسم المستخدم مطلوب",
    ),
    "validation_failed": MessageLookupByLibrary.simpleMessage(
      "فشل التحقق من صحة البيانات",
    ),
    "value_placeholder_hint": MessageLookupByLibrary.simpleMessage(
      "مثال: 5000",
    ),
    "version": m14,
    "view_all": MessageLookupByLibrary.simpleMessage("عرض الكل"),
    "view_approved_contract": MessageLookupByLibrary.simpleMessage(
      "عرض العقد المعتمد",
    ),
    "view_details": MessageLookupByLibrary.simpleMessage("عرض التفاصيل"),
    "view_dispute": MessageLookupByLibrary.simpleMessage("عرض النزاع"),
    "view_effective_agreement": MessageLookupByLibrary.simpleMessage(
      "عرض الاتفاقية السارية",
    ),
    "waiting_client_approval": MessageLookupByLibrary.simpleMessage(
      "بانتظار موافقة الزبون",
    ),
    "waiting_for_client": MessageLookupByLibrary.simpleMessage(
      "بانتظار الزبون",
    ),
    "waiting_for_freelancer": MessageLookupByLibrary.simpleMessage(
      "بانتظار المستقل",
    ),
    "waiting_for_other_party_review": MessageLookupByLibrary.simpleMessage(
      "في انتظار مراجعة الطرف الآخر لهذا المقترح.",
    ),
    "welcome_back": m15,
    "withdraw_change_request": MessageLookupByLibrary.simpleMessage(
      "سحب الطلب",
    ),
    "withdraw_change_request_confirmation":
        MessageLookupByLibrary.simpleMessage(
          "هل أنت متأكد أنك تريد سحب طلب التغيير هذا؟",
        ),
    "withdraw_contract": MessageLookupByLibrary.simpleMessage("سحب العقد"),
    "withdraw_dispute": MessageLookupByLibrary.simpleMessage("سحب النزاع"),
    "yesterday": MessageLookupByLibrary.simpleMessage("أمس"),
    "your_action_required": MessageLookupByLibrary.simpleMessage(
      "إجراء مطلوب منك",
    ),
    "zero_open_disputes_required": MessageLookupByLibrary.simpleMessage(
      "يجب ألا توجد أي نزاعات مفتوحة",
    ),
    "zero_pending_change_requests_required":
        MessageLookupByLibrary.simpleMessage(
          "يجب ألا توجد أي طلبات تغيير معلقة",
        ),
  };
}
