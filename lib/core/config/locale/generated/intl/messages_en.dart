// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(accepted, total) =>
      "${accepted} of ${total} Milestones Accepted";

  static String m1(number) => "Amendment #${number}";

  static String m2(number) => "Amendment #${number}";

  static String m3(actor) => "By: ${actor}";

  static String m4(value) => "Criteria: ${value}";

  static String m5(days) => "${days} days remaining";

  static String m6(value) => "Deliverable: ${value}";

  static String m7(count) => "${count} active";

  static String m8(date) => "Due: ${date}";

  static String m9(hours) => "${hours} hours remaining";

  static String m10(time) => "Updated: ${time}";

  static String m11(minLength) => "Must be at least ${minLength} characters";

  static String m12(reason) => "Reason: ${reason}";

  static String m13(scope) => "Scope: ${scope}";

  static String m14(version) => "Version ${version}";

  static String m15(name) => "Welcome back, ${name}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accept_deliverable": MessageLookupByLibrary.simpleMessage(
      "Accept Deliverable",
    ),
    "accept_invitation_confirmation": MessageLookupByLibrary.simpleMessage(
      "Accepting this invitation will establish collaboration and make the project visible in your active project list.",
    ),
    "accept_project": MessageLookupByLibrary.simpleMessage("Accept Project"),
    "accept_resolution": MessageLookupByLibrary.simpleMessage(
      "Accept Resolution",
    ),
    "acceptance_criteria": MessageLookupByLibrary.simpleMessage(
      "Acceptance Criteria",
    ),
    "acceptance_criteria_hint": MessageLookupByLibrary.simpleMessage(
      "Conditions required for client approval",
    ),
    "acceptance_disclaimer": MessageLookupByLibrary.simpleMessage(
      "Acceptance permanently locks this milestone and marks it eligible for payment. It does NOT transfer money immediately.",
    ),
    "acceptance_note_hint": MessageLookupByLibrary.simpleMessage(
      "Add an optional note to the freelancer...",
    ),
    "acceptance_note_optional": MessageLookupByLibrary.simpleMessage(
      "Optional Acceptance Note",
    ),
    "accepted": MessageLookupByLibrary.simpleMessage("Accepted"),
    "acceptedWorkValue": MessageLookupByLibrary.simpleMessage(
      "Accepted Work Value",
    ),
    "acceptedWorkValueTooltip": MessageLookupByLibrary.simpleMessage(
      "Total value of work that has been accepted.",
    ),
    "accepted_milestones": MessageLookupByLibrary.simpleMessage("Accepted"),
    "accepted_milestones_ratio": m0,
    "accepted_project_invitations": MessageLookupByLibrary.simpleMessage(
      "Accepted project invitations will appear here.",
    ),
    "accepted_work_value": MessageLookupByLibrary.simpleMessage(
      "Accepted Work Value",
    ),
    "accepted_work_value_tooltip": MessageLookupByLibrary.simpleMessage(
      "Total value of work that has been accepted.",
    ),
    "account": MessageLookupByLibrary.simpleMessage("Account"),
    "account_already_exists": MessageLookupByLibrary.simpleMessage(
      "An account with this email already exists",
    ),
    "account_information": MessageLookupByLibrary.simpleMessage(
      "Account Information",
    ),
    "account_type": MessageLookupByLibrary.simpleMessage("Account Type"),
    "action_center": MessageLookupByLibrary.simpleMessage("Action Center"),
    "action_conflicts_project_state": MessageLookupByLibrary.simpleMessage(
      "This action conflicts with the current project state.",
    ),
    "active": MessageLookupByLibrary.simpleMessage("Active"),
    "activity_timeline": MessageLookupByLibrary.simpleMessage(
      "Activity Timeline",
    ),
    "add_client": MessageLookupByLibrary.simpleMessage("Add Client"),
    "add_client_description": MessageLookupByLibrary.simpleMessage(
      "Enter the email of a registered client account to add them to your list.",
    ),
    "add_evidence": MessageLookupByLibrary.simpleMessage("Add Evidence"),
    "add_evidence_link": MessageLookupByLibrary.simpleMessage("Add Link"),
    "add_file": MessageLookupByLibrary.simpleMessage("Add File"),
    "add_files": MessageLookupByLibrary.simpleMessage("Add Files"),
    "add_milestone": MessageLookupByLibrary.simpleMessage("Add Milestone"),
    "adjust_search_terms": MessageLookupByLibrary.simpleMessage(
      "Try adjusting your search terms.",
    ),
    "all_caught_up": MessageLookupByLibrary.simpleMessage(
      "All caught up! No urgent actions require your attention.",
    ),
    "all_deliverables_accepted": MessageLookupByLibrary.simpleMessage(
      "All deliverables have been accepted!",
    ),
    "all_milestones_must_be_accepted": MessageLookupByLibrary.simpleMessage(
      "All milestones must be accepted",
    ),
    "all_payments_must_be_paid": MessageLookupByLibrary.simpleMessage(
      "All milestone payments must be paid",
    ),
    "all_time": MessageLookupByLibrary.simpleMessage("All time"),
    "allocated_value": MessageLookupByLibrary.simpleMessage("Allocated Value"),
    "allocation_complete": MessageLookupByLibrary.simpleMessage(
      "Allocation Complete",
    ),
    "allocation_exceeds_project_value": MessageLookupByLibrary.simpleMessage(
      "Allocation exceeds project value",
    ),
    "allocation_mode": MessageLookupByLibrary.simpleMessage("Allocation Mode"),
    "allocation_summary": MessageLookupByLibrary.simpleMessage(
      "Allocation Summary",
    ),
    "already_have_account": MessageLookupByLibrary.simpleMessage(
      "Already have an account?",
    ),
    "amendment_number": m1,
    "amendment_number_prefix": m2,
    "amendments_applied": MessageLookupByLibrary.simpleMessage(
      "amendments applied",
    ),
    "amount_awaiting_confirmation": MessageLookupByLibrary.simpleMessage(
      "Awaiting Confirmation",
    ),
    "amount_eligible": MessageLookupByLibrary.simpleMessage("Amount Eligible"),
    "amount_on_dispute_hold": MessageLookupByLibrary.simpleMessage(
      "Amount on Dispute Hold",
    ),
    "amount_with_issues": MessageLookupByLibrary.simpleMessage(
      "Amount With Issues",
    ),
    "app_title": MessageLookupByLibrary.simpleMessage("Meethaq"),
    "appearance": MessageLookupByLibrary.simpleMessage("Appearance"),
    "approval_date": MessageLookupByLibrary.simpleMessage("Approval Date"),
    "approve": MessageLookupByLibrary.simpleMessage("Approve"),
    "approve_change_request": MessageLookupByLibrary.simpleMessage(
      "Approve Change Request",
    ),
    "approve_change_request_confirmation": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to approve this change request? This will amend the contract.",
    ),
    "approve_contract": MessageLookupByLibrary.simpleMessage(
      "Approve Contract",
    ),
    "approvedProjectValue": MessageLookupByLibrary.simpleMessage(
      "Approved Project Value",
    ),
    "approvedProjectValueTooltip": MessageLookupByLibrary.simpleMessage(
      "Total agreed value of all approved projects.",
    ),
    "approved_by": MessageLookupByLibrary.simpleMessage("Approved By"),
    "approved_contract": MessageLookupByLibrary.simpleMessage(
      "Approved Contract",
    ),
    "approved_date": MessageLookupByLibrary.simpleMessage("Approved Date"),
    "approved_project_value": MessageLookupByLibrary.simpleMessage(
      "Approved Project Value",
    ),
    "approved_project_value_tooltip": MessageLookupByLibrary.simpleMessage(
      "Total agreed value of all approved projects.",
    ),
    "approved_tab": MessageLookupByLibrary.simpleMessage("Approved"),
    "assign_client": MessageLookupByLibrary.simpleMessage("Assign Client"),
    "assigned_client": MessageLookupByLibrary.simpleMessage("Assigned Client"),
    "assigned_freelancer": MessageLookupByLibrary.simpleMessage(
      "Assigned Freelancer",
    ),
    "at_least_one_milestone_required": MessageLookupByLibrary.simpleMessage(
      "At least one milestone is required.",
    ),
    "awaitingFreelancerConfirmation": MessageLookupByLibrary.simpleMessage(
      "Awaiting Confirmation",
    ),
    "awaitingFreelancerConfirmationTooltip":
        MessageLookupByLibrary.simpleMessage(
          "Payments waiting for freelancer confirmation.",
        ),
    "awaitingReceiptConfirmation": MessageLookupByLibrary.simpleMessage(
      "Awaiting Confirmation",
    ),
    "awaitingReceiptConfirmationTooltip": MessageLookupByLibrary.simpleMessage(
      "Payments waiting for receipt confirmation.",
    ),
    "awaiting_freelancer_confirmation": MessageLookupByLibrary.simpleMessage(
      "Awaiting Confirmation",
    ),
    "awaiting_freelancer_confirmation_tooltip":
        MessageLookupByLibrary.simpleMessage(
          "Payments waiting for freelancer confirmation.",
        ),
    "awaiting_receipt_confirmation": MessageLookupByLibrary.simpleMessage(
      "Awaiting Confirmation",
    ),
    "awaiting_receipt_confirmation_tooltip":
        MessageLookupByLibrary.simpleMessage(
          "Payments waiting for receipt confirmation.",
        ),
    "awaiting_review": MessageLookupByLibrary.simpleMessage("Awaiting Review"),
    "bad_certificate": MessageLookupByLibrary.simpleMessage("Bad certificate"),
    "bad_request": MessageLookupByLibrary.simpleMessage("Bad request"),
    "bio": MessageLookupByLibrary.simpleMessage("Bio"),
    "by_actor": m3,
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "cancel_project": MessageLookupByLibrary.simpleMessage("Cancel Project"),
    "cancel_project_confirmation": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to cancel this project? This will mark the project as cancelled and cannot be undone.",
    ),
    "cancelled": MessageLookupByLibrary.simpleMessage("Cancelled"),
    "card_loading": MessageLookupByLibrary.simpleMessage("Loading…"),
    "change": MessageLookupByLibrary.simpleMessage("Change"),
    "change_password": MessageLookupByLibrary.simpleMessage("Change Password"),
    "change_request_approved_success": MessageLookupByLibrary.simpleMessage(
      "Change request approved. Contract amendment ratified.",
    ),
    "change_request_details": MessageLookupByLibrary.simpleMessage(
      "Change Request Details",
    ),
    "change_request_pending_review": MessageLookupByLibrary.simpleMessage(
      "Pending your review",
    ),
    "change_request_reason": MessageLookupByLibrary.simpleMessage(
      "Reason for Change",
    ),
    "change_request_rejected_success": MessageLookupByLibrary.simpleMessage(
      "Change request rejected.",
    ),
    "change_request_submitted_success": MessageLookupByLibrary.simpleMessage(
      "Change request submitted successfully.",
    ),
    "change_request_title": MessageLookupByLibrary.simpleMessage(
      "Change Request Title",
    ),
    "change_request_withdrawn_success": MessageLookupByLibrary.simpleMessage(
      "Change request withdrawn.",
    ),
    "change_requests": MessageLookupByLibrary.simpleMessage("Change Requests"),
    "changes_requested_successfully": MessageLookupByLibrary.simpleMessage(
      "Changes requested successfully",
    ),
    "changes_required_error": MessageLookupByLibrary.simpleMessage(
      "Required changes description is required",
    ),
    "chart_view": MessageLookupByLibrary.simpleMessage("Chart View"),
    "chat_attachment_limit": MessageLookupByLibrary.simpleMessage(
      "Maximum 3 attachments allowed per message",
    ),
    "client": MessageLookupByLibrary.simpleMessage("Client"),
    "client_account_managed_message": MessageLookupByLibrary.simpleMessage(
      "Name and email are managed by the client\'s own account.",
    ),
    "client_added_successfully": MessageLookupByLibrary.simpleMessage(
      "Client added successfully",
    ),
    "client_already_in_list": MessageLookupByLibrary.simpleMessage(
      "This client is already in your list.",
    ),
    "client_description": MessageLookupByLibrary.simpleMessage(
      "Hire freelancers and manage my contracts and projects",
    ),
    "client_details": MessageLookupByLibrary.simpleMessage("Client Details"),
    "client_email": MessageLookupByLibrary.simpleMessage("Client Email"),
    "client_feedback": MessageLookupByLibrary.simpleMessage("Client Feedback"),
    "client_feedback_and_decisions": MessageLookupByLibrary.simpleMessage(
      "Client feedback and decisions",
    ),
    "client_first_use_guidance": MessageLookupByLibrary.simpleMessage(
      "Welcome to Meethaq! When you are invited to projects or collaborations start, they will appear here.",
    ),
    "client_information": MessageLookupByLibrary.simpleMessage(
      "Client Information",
    ),
    "client_not_found": MessageLookupByLibrary.simpleMessage(
      "Client not found.",
    ),
    "client_overview": MessageLookupByLibrary.simpleMessage("Client Overview"),
    "client_type": MessageLookupByLibrary.simpleMessage("Client"),
    "client_updated_successfully": MessageLookupByLibrary.simpleMessage(
      "Client updated successfully",
    ),
    "clients": MessageLookupByLibrary.simpleMessage("Clients"),
    "closed_tab": MessageLookupByLibrary.simpleMessage("Closed"),
    "company_name_optional": MessageLookupByLibrary.simpleMessage(
      "Company Name (optional)",
    ),
    "complete_project": MessageLookupByLibrary.simpleMessage(
      "Complete Project",
    ),
    "complete_project_confirm_body": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to mark this project as complete? This action is irreversible and finalizes the project contract and milestones. The server will check that every requirement below is met before completing.",
    ),
    "completed": MessageLookupByLibrary.simpleMessage("Completed"),
    "completion_checklist": MessageLookupByLibrary.simpleMessage(
      "Completion Checklist",
    ),
    "completion_eligible": MessageLookupByLibrary.simpleMessage(
      "Ready for Completion",
    ),
    "completion_server_check": MessageLookupByLibrary.simpleMessage(
      "The server checks these when you confirm — this is a reminder, not a live status.",
    ),
    "confirm_accept_resolution": MessageLookupByLibrary.simpleMessage(
      "Accepting this resolution will close the dispute. This can\'t be undone.",
    ),
    "confirm_acceptance": MessageLookupByLibrary.simpleMessage(
      "Confirm Acceptance",
    ),
    "confirm_approve_contract": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to approve this contract? Once approved, it becomes finalized and immutable.",
    ),
    "confirm_new_password": MessageLookupByLibrary.simpleMessage(
      "Confirm New Password",
    ),
    "confirm_new_password_required": MessageLookupByLibrary.simpleMessage(
      "Please confirm your new password",
    ),
    "confirm_receipt": MessageLookupByLibrary.simpleMessage("Confirm Receipt"),
    "confirm_submit_contract": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to submit this contract? It will be sent to the client for review.",
    ),
    "confirm_withdraw_contract": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to withdraw this contract? It will return to draft status.",
    ),
    "confirm_withdraw_dispute": MessageLookupByLibrary.simpleMessage(
      "Withdrawing removes the dispute and lifts the hold on this milestone. This can\'t be undone.",
    ),
    "confirmedPaymentsThisMonth": MessageLookupByLibrary.simpleMessage(
      "Confirmed This Month",
    ),
    "confirmedPaymentsThisMonthTooltip": MessageLookupByLibrary.simpleMessage(
      "Payments confirmed during the current month.",
    ),
    "confirmed_payments_this_month": MessageLookupByLibrary.simpleMessage(
      "Confirmed This Month",
    ),
    "confirmed_payments_this_month_tooltip":
        MessageLookupByLibrary.simpleMessage(
          "Payments confirmed during the current month.",
        ),
    "conflict_occurred": MessageLookupByLibrary.simpleMessage(
      "Conflict occurred",
    ),
    "contact_information": MessageLookupByLibrary.simpleMessage(
      "Contact Information",
    ),
    "continue_editing": MessageLookupByLibrary.simpleMessage(
      "Continue Editing",
    ),
    "contract": MessageLookupByLibrary.simpleMessage("Contract"),
    "contract_allocation_incomplete": MessageLookupByLibrary.simpleMessage(
      "Total allocated amount must equal project value",
    ),
    "contract_amendments": MessageLookupByLibrary.simpleMessage(
      "Contract Amendments",
    ),
    "contract_approved_successfully": MessageLookupByLibrary.simpleMessage(
      "Contract approved successfully",
    ),
    "contract_builder": MessageLookupByLibrary.simpleMessage(
      "Contract Builder",
    ),
    "contract_chronological_dates": MessageLookupByLibrary.simpleMessage(
      "Milestone due dates must follow sequential chronological order",
    ),
    "contract_criteria_required": MessageLookupByLibrary.simpleMessage(
      "All milestones must have acceptance criteria",
    ),
    "contract_deliverable_required": MessageLookupByLibrary.simpleMessage(
      "All milestones must have a deliverable",
    ),
    "contract_details": MessageLookupByLibrary.simpleMessage(
      "Contract Details",
    ),
    "contract_due_date_required": MessageLookupByLibrary.simpleMessage(
      "All milestones must have a due date",
    ),
    "contract_min_milestones": MessageLookupByLibrary.simpleMessage(
      "Add at least one milestone before submitting",
    ),
    "contract_requires_review": MessageLookupByLibrary.simpleMessage(
      "Contract Requires Review",
    ),
    "contract_scope_required": MessageLookupByLibrary.simpleMessage(
      "Please provide a scope of work (at least 10 characters)",
    ),
    "contract_submitted_successfully": MessageLookupByLibrary.simpleMessage(
      "Contract submitted successfully",
    ),
    "contract_terms_header": MessageLookupByLibrary.simpleMessage(
      "Contract Terms",
    ),
    "contract_title": MessageLookupByLibrary.simpleMessage("Contract Title"),
    "contract_title_hint": MessageLookupByLibrary.simpleMessage(
      "Enter contract title",
    ),
    "contract_title_required": MessageLookupByLibrary.simpleMessage(
      "Please enter a contract title (at least 3 characters)",
    ),
    "contract_withdrawn_successfully": MessageLookupByLibrary.simpleMessage(
      "Contract withdrawn successfully",
    ),
    "contracts": MessageLookupByLibrary.simpleMessage("Contracts"),
    "contracts_and_change_requests": MessageLookupByLibrary.simpleMessage(
      "Contracts & Change Requests",
    ),
    "correction_history": MessageLookupByLibrary.simpleMessage(
      "Correction History",
    ),
    "correction_requires_evidence": MessageLookupByLibrary.simpleMessage(
      "Provide an updated reference, notes, or at least one corrected receipt file.",
    ),
    "country": MessageLookupByLibrary.simpleMessage("Country"),
    "country_bahrain": MessageLookupByLibrary.simpleMessage("Bahrain"),
    "country_canada": MessageLookupByLibrary.simpleMessage("Canada"),
    "country_egypt": MessageLookupByLibrary.simpleMessage("Egypt"),
    "country_france": MessageLookupByLibrary.simpleMessage("France"),
    "country_germany": MessageLookupByLibrary.simpleMessage("Germany"),
    "country_iraq": MessageLookupByLibrary.simpleMessage("Iraq"),
    "country_jordan": MessageLookupByLibrary.simpleMessage("Jordan"),
    "country_kuwait": MessageLookupByLibrary.simpleMessage("Kuwait"),
    "country_lebanon": MessageLookupByLibrary.simpleMessage("Lebanon"),
    "country_oman": MessageLookupByLibrary.simpleMessage("Oman"),
    "country_other": MessageLookupByLibrary.simpleMessage("Other"),
    "country_palestine": MessageLookupByLibrary.simpleMessage("Palestine"),
    "country_qatar": MessageLookupByLibrary.simpleMessage("Qatar"),
    "country_saudi_arabia": MessageLookupByLibrary.simpleMessage(
      "Saudi Arabia",
    ),
    "country_syria": MessageLookupByLibrary.simpleMessage("Syria"),
    "country_turkey": MessageLookupByLibrary.simpleMessage("Turkey"),
    "country_united_arab_emirates": MessageLookupByLibrary.simpleMessage(
      "United Arab Emirates",
    ),
    "country_united_kingdom": MessageLookupByLibrary.simpleMessage(
      "United Kingdom",
    ),
    "country_united_states": MessageLookupByLibrary.simpleMessage(
      "United States",
    ),
    "country_yemen": MessageLookupByLibrary.simpleMessage("Yemen"),
    "cr_status_approved": MessageLookupByLibrary.simpleMessage("Approved"),
    "cr_status_draft": MessageLookupByLibrary.simpleMessage("Draft"),
    "cr_status_pending_approval": MessageLookupByLibrary.simpleMessage(
      "Pending Approval",
    ),
    "cr_status_rejected": MessageLookupByLibrary.simpleMessage("Rejected"),
    "cr_status_withdrawn": MessageLookupByLibrary.simpleMessage("Withdrawn"),
    "create_account": MessageLookupByLibrary.simpleMessage("Create Account"),
    "create_account_action": MessageLookupByLibrary.simpleMessage(
      "Create Account",
    ),
    "create_account_subtitle": MessageLookupByLibrary.simpleMessage(
      "Choose your account type and get started in minutes",
    ),
    "create_contract": MessageLookupByLibrary.simpleMessage("Create Contract"),
    "create_first_project": MessageLookupByLibrary.simpleMessage(
      "Create your first project to start tracking your work with clients.",
    ),
    "create_new_project": MessageLookupByLibrary.simpleMessage(
      "Create a new project",
    ),
    "create_project": MessageLookupByLibrary.simpleMessage("Create Project"),
    "create_project_description": MessageLookupByLibrary.simpleMessage(
      "Assign this project to an existing client to initiate collaboration.",
    ),
    "created": MessageLookupByLibrary.simpleMessage("Created"),
    "criteria_label": m4,
    "currency": MessageLookupByLibrary.simpleMessage("Currency"),
    "currency_three_letter_code": MessageLookupByLibrary.simpleMessage(
      "3-letter code",
    ),
    "current_outstanding": MessageLookupByLibrary.simpleMessage(
      "Current outstanding",
    ),
    "current_password": MessageLookupByLibrary.simpleMessage(
      "Current Password",
    ),
    "current_password_required": MessageLookupByLibrary.simpleMessage(
      "Current password is required",
    ),
    "current_project_value": MessageLookupByLibrary.simpleMessage(
      "Current Project Value",
    ),
    "current_value": MessageLookupByLibrary.simpleMessage("Current Value"),
    "dark_mode": MessageLookupByLibrary.simpleMessage("Dark mode"),
    "data_is_stale": MessageLookupByLibrary.simpleMessage(
      "Offline: Displaying previously saved data.",
    ),
    "days_remaining": m5,
    "delete_failed": MessageLookupByLibrary.simpleMessage("Delete failed"),
    "delete_milestone": MessageLookupByLibrary.simpleMessage(
      "Delete Milestone",
    ),
    "deliverable": MessageLookupByLibrary.simpleMessage("Deliverable"),
    "deliverable_hint": MessageLookupByLibrary.simpleMessage(
      "What tangible item will be delivered?",
    ),
    "deliverable_label": m6,
    "deliverables_awaiting_review": MessageLookupByLibrary.simpleMessage(
      "Deliverables Awaiting Review",
    ),
    "describe_evidence_hint": MessageLookupByLibrary.simpleMessage(
      "Describe this evidence (min 5 characters)...",
    ),
    "description_hint": MessageLookupByLibrary.simpleMessage(
      "Describe deliverables, milestones, or scope...",
    ),
    "description_optional": MessageLookupByLibrary.simpleMessage(
      "Description (optional)",
    ),
    "dispute_category": MessageLookupByLibrary.simpleMessage(
      "Dispute Category",
    ),
    "dispute_category_acceptance_disagreement":
        MessageLookupByLibrary.simpleMessage("Acceptance Disagreement"),
    "dispute_category_deliverable_quality":
        MessageLookupByLibrary.simpleMessage("Deliverable Quality"),
    "dispute_category_missed_deadline": MessageLookupByLibrary.simpleMessage(
      "Missed Deadline",
    ),
    "dispute_category_other": MessageLookupByLibrary.simpleMessage("Other"),
    "dispute_category_payment_issue": MessageLookupByLibrary.simpleMessage(
      "Payment Issue",
    ),
    "dispute_category_scope_disagreement": MessageLookupByLibrary.simpleMessage(
      "Scope Disagreement",
    ),
    "dispute_description": MessageLookupByLibrary.simpleMessage("Description"),
    "dispute_description_hint": MessageLookupByLibrary.simpleMessage(
      "Detail the nature of the disagreement (min 10 characters)...",
    ),
    "dispute_hold_notice": MessageLookupByLibrary.simpleMessage(
      "This milestone payment is on hold due to an active dispute.",
    ),
    "dispute_not_found": MessageLookupByLibrary.simpleMessage(
      "Dispute not found.",
    ),
    "dispute_opened_success": MessageLookupByLibrary.simpleMessage(
      "Dispute opened successfully. Operational hold applied.",
    ),
    "dispute_status_open": MessageLookupByLibrary.simpleMessage("Open Dispute"),
    "dispute_status_resolution_proposed": MessageLookupByLibrary.simpleMessage(
      "Resolution Proposed",
    ),
    "dispute_status_resolved": MessageLookupByLibrary.simpleMessage("Resolved"),
    "disputed_milestone_badge": MessageLookupByLibrary.simpleMessage(
      "Disputed",
    ),
    "disputes": MessageLookupByLibrary.simpleMessage("Disputes"),
    "disputes_active_count": m7,
    "disputes_coming_soon": MessageLookupByLibrary.simpleMessage(
      "Full dispute details coming soon",
    ),
    "disputes_none_active": MessageLookupByLibrary.simpleMessage(
      "No active disputes",
    ),
    "disputes_summary": MessageLookupByLibrary.simpleMessage("Disputes"),
    "dont_have_account": MessageLookupByLibrary.simpleMessage(
      "Don\'t have an account?",
    ),
    "due_date": MessageLookupByLibrary.simpleMessage("Due Date"),
    "due_label": m8,
    "edit_client": MessageLookupByLibrary.simpleMessage("Edit Client"),
    "edit_details": MessageLookupByLibrary.simpleMessage("Edit Details"),
    "edit_milestone": MessageLookupByLibrary.simpleMessage("Edit Milestone"),
    "edit_profile": MessageLookupByLibrary.simpleMessage("Edit Profile"),
    "edit_project": MessageLookupByLibrary.simpleMessage("Edit Project"),
    "effective_contract": MessageLookupByLibrary.simpleMessage(
      "Effective Agreement",
    ),
    "effective_date": MessageLookupByLibrary.simpleMessage("Effective Date"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "email_already_exists": MessageLookupByLibrary.simpleMessage(
      "An account with this email already exists",
    ),
    "email_or_fullName": MessageLookupByLibrary.simpleMessage(
      "Email Or Full Name",
    ),
    "emptyCurrency": MessageLookupByLibrary.simpleMessage(""),
    "emptyDefinitionTooltip": MessageLookupByLibrary.simpleMessage(""),
    "emptyDisputeCurrency": MessageLookupByLibrary.simpleMessage(""),
    "emptyGreeting": MessageLookupByLibrary.simpleMessage(""),
    "emptyGuidanceMessage": MessageLookupByLibrary.simpleMessage(""),
    "emptyPeriodCurrency": MessageLookupByLibrary.simpleMessage(""),
    "emptyUserName": MessageLookupByLibrary.simpleMessage(""),
    "enter_change_feedback": MessageLookupByLibrary.simpleMessage(
      "Explain what changes are needed (minimum 10 characters)",
    ),
    "enter_valid_amount": MessageLookupByLibrary.simpleMessage(
      "Enter a valid amount",
    ),
    "error_during_communication": MessageLookupByLibrary.simpleMessage(
      "Error during communication",
    ),
    "evidence_attachments_optional": MessageLookupByLibrary.simpleMessage(
      "Evidence Attachments (Optional)",
    ),
    "evidence_exported_success": MessageLookupByLibrary.simpleMessage(
      "Evidence package exported successfully.",
    ),
    "evidence_files": MessageLookupByLibrary.simpleMessage("Evidence Files"),
    "evidence_link_hint": MessageLookupByLibrary.simpleMessage(
      "e.g. Figma Prototype, Staging URL",
    ),
    "evidence_links": MessageLookupByLibrary.simpleMessage("Evidence Links"),
    "evidence_package": MessageLookupByLibrary.simpleMessage(
      "Evidence Package",
    ),
    "evidence_required_error": MessageLookupByLibrary.simpleMessage(
      "At least one evidence file or link is required",
    ),
    "execution_no_activity_yet": MessageLookupByLibrary.simpleMessage(
      "No activity yet",
    ),
    "execution_open_chat": MessageLookupByLibrary.simpleMessage("Open chat"),
    "execution_overview": MessageLookupByLibrary.simpleMessage(
      "Activity & Chat",
    ),
    "execution_view_activity": MessageLookupByLibrary.simpleMessage(
      "View activity",
    ),
    "expected_end_date": MessageLookupByLibrary.simpleMessage(
      "Expected End Date",
    ),
    "export_evidence_package": MessageLookupByLibrary.simpleMessage(
      "Export Package",
    ),
    "external_link": MessageLookupByLibrary.simpleMessage("External link"),
    "external_link_hint": MessageLookupByLibrary.simpleMessage(
      "Paste the link to the evidence (e.g. a shared file, message, or delivery)",
    ),
    "failed_to_change_password": MessageLookupByLibrary.simpleMessage(
      "Failed to change password",
    ),
    "failed_to_load_clients": MessageLookupByLibrary.simpleMessage(
      "Failed to load clients",
    ),
    "failed_to_load_profile": MessageLookupByLibrary.simpleMessage(
      "Failed to load profile",
    ),
    "failed_to_load_section": MessageLookupByLibrary.simpleMessage(
      "Unable to load section.",
    ),
    "failed_update_profile": MessageLookupByLibrary.simpleMessage(
      "Failed to update profile",
    ),
    "filter_next_30_days": MessageLookupByLibrary.simpleMessage("Next 30 Days"),
    "filter_next_7_days": MessageLookupByLibrary.simpleMessage("Next 7 Days"),
    "filter_overdue": MessageLookupByLibrary.simpleMessage("Overdue"),
    "financial_overview": MessageLookupByLibrary.simpleMessage(
      "Financial Overview",
    ),
    "financial_trend": MessageLookupByLibrary.simpleMessage("Financial Trend"),
    "first_name": MessageLookupByLibrary.simpleMessage("First Name"),
    "first_name_min_length": MessageLookupByLibrary.simpleMessage(
      "First name must be at least 2 characters",
    ),
    "fixed_amount": MessageLookupByLibrary.simpleMessage("Fixed Amount"),
    "forgot_password": MessageLookupByLibrary.simpleMessage("Forgot Password?"),
    "freelancer": MessageLookupByLibrary.simpleMessage("Freelancer"),
    "freelancer_description": MessageLookupByLibrary.simpleMessage(
      "Offer my services and work on projects for clients",
    ),
    "freelancer_information": MessageLookupByLibrary.simpleMessage(
      "Freelancer Information",
    ),
    "freelancers_overview": MessageLookupByLibrary.simpleMessage(
      "Freelancers Overview",
    ),
    "full_name": MessageLookupByLibrary.simpleMessage("Full Name"),
    "futureMilestoneValue": MessageLookupByLibrary.simpleMessage(
      "Future Milestone Value",
    ),
    "futureMilestoneValueTooltip": MessageLookupByLibrary.simpleMessage(
      "Total value of milestones scheduled for the future.",
    ),
    "future_milestone_value": MessageLookupByLibrary.simpleMessage(
      "Future Milestone Value",
    ),
    "future_milestone_value_tooltip": MessageLookupByLibrary.simpleMessage(
      "Total value of milestones scheduled for the future.",
    ),
    "general_terms": MessageLookupByLibrary.simpleMessage("General Terms"),
    "general_terms_hint": MessageLookupByLibrary.simpleMessage(
      "Specify revision limits, communication rules, or agreed conditions",
    ),
    "hide_milestones": MessageLookupByLibrary.simpleMessage("Hide milestones"),
    "home": MessageLookupByLibrary.simpleMessage("Home"),
    "hours_remaining": m9,
    "image_selected_will_be_wired": MessageLookupByLibrary.simpleMessage(
      "Image selected — upload will be wired once the backend endpoint is confirmed.",
    ),
    "in_progress": MessageLookupByLibrary.simpleMessage("In Progress"),
    "incomeReceivedThisMonth": MessageLookupByLibrary.simpleMessage(
      "Received This Month",
    ),
    "incomeReceivedThisMonthTooltip": MessageLookupByLibrary.simpleMessage(
      "Income received during the current month.",
    ),
    "income_received_this_month": MessageLookupByLibrary.simpleMessage(
      "Received This Month",
    ),
    "income_received_this_month_tooltip": MessageLookupByLibrary.simpleMessage(
      "Income received during the current month.",
    ),
    "internal_server_error": MessageLookupByLibrary.simpleMessage(
      "Internal server error",
    ),
    "invalid_data_submitted": MessageLookupByLibrary.simpleMessage(
      "Invalid data submitted.",
    ),
    "invalid_email": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid email address.",
    ),
    "invalid_phone": MessageLookupByLibrary.simpleMessage(
      "Enter a valid phone number",
    ),
    "invalid_phone_number": MessageLookupByLibrary.simpleMessage(
      "Enter a valid phone number",
    ),
    "invalid_url": MessageLookupByLibrary.simpleMessage(
      "Enter a valid HTTP/HTTPS URL",
    ),
    "invitation_already_accepted": MessageLookupByLibrary.simpleMessage(
      "This invitation has been accepted",
    ),
    "invitation_details": MessageLookupByLibrary.simpleMessage(
      "Invitation Details",
    ),
    "invitation_no_longer_available": MessageLookupByLibrary.simpleMessage(
      "This invitation has already been accepted or is no longer available.",
    ),
    "invitation_not_found": MessageLookupByLibrary.simpleMessage(
      "Invitation not found.",
    ),
    "invitations": MessageLookupByLibrary.simpleMessage("Invitations"),
    "invited_you_to_collaborate": MessageLookupByLibrary.simpleMessage(
      "Invited you to collaborate",
    ),
    "keep_project": MessageLookupByLibrary.simpleMessage("Keep Project"),
    "language_change": MessageLookupByLibrary.simpleMessage("Language Change"),
    "last_month": MessageLookupByLibrary.simpleMessage("Last Month"),
    "last_name": MessageLookupByLibrary.simpleMessage("Last Name"),
    "last_name_min_length": MessageLookupByLibrary.simpleMessage(
      "Last name must be at least 2 characters",
    ),
    "last_updated_at": m10,
    "last_year": MessageLookupByLibrary.simpleMessage("Last Year"),
    "late_freelancer_submission": MessageLookupByLibrary.simpleMessage(
      "Late Submission",
    ),
    "latest_version": MessageLookupByLibrary.simpleMessage("Latest Version"),
    "light_mode": MessageLookupByLibrary.simpleMessage("Light mode"),
    "link_title": MessageLookupByLibrary.simpleMessage("Link Title"),
    "link_url": MessageLookupByLibrary.simpleMessage("URL"),
    "load_more": MessageLookupByLibrary.simpleMessage("Load more"),
    "loading_clients": MessageLookupByLibrary.simpleMessage(
      "Loading clients...",
    ),
    "local_storage_error": MessageLookupByLibrary.simpleMessage(
      "Local storage error",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Login"),
    "login_action": MessageLookupByLibrary.simpleMessage("Login"),
    "login_subtitle": MessageLookupByLibrary.simpleMessage(
      "Enter your details to continue to the dashboard",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("Logout"),
    "logout_confirmation": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to log out?",
    ),
    "logout_failed": MessageLookupByLibrary.simpleMessage("Logout failed"),
    "mark_all_read": MessageLookupByLibrary.simpleMessage("Mark all as read"),
    "metric_definition": MessageLookupByLibrary.simpleMessage(
      "Metric Definition",
    ),
    "milestone": MessageLookupByLibrary.simpleMessage("Milestone"),
    "milestone_actions_paused_dispute": MessageLookupByLibrary.simpleMessage(
      "Acceptance and payment actions are paused while this dispute is active.",
    ),
    "milestone_description": MessageLookupByLibrary.simpleMessage(
      "Milestone Description",
    ),
    "milestone_details": MessageLookupByLibrary.simpleMessage(
      "Milestone Details",
    ),
    "milestone_overdue": MessageLookupByLibrary.simpleMessage("Overdue"),
    "milestone_payment": MessageLookupByLibrary.simpleMessage(
      "Milestone Payment",
    ),
    "milestone_payment_status": MessageLookupByLibrary.simpleMessage(
      "Milestone Payment Status",
    ),
    "milestone_status_accepted": MessageLookupByLibrary.simpleMessage(
      "Accepted",
    ),
    "milestone_status_in_progress": MessageLookupByLibrary.simpleMessage(
      "In progress",
    ),
    "milestone_status_not_started": MessageLookupByLibrary.simpleMessage(
      "Not started",
    ),
    "milestone_status_revision_requested": MessageLookupByLibrary.simpleMessage(
      "Changes requested",
    ),
    "milestone_status_submitted": MessageLookupByLibrary.simpleMessage(
      "Awaiting review",
    ),
    "milestone_title": MessageLookupByLibrary.simpleMessage("Milestone Title"),
    "milestones": MessageLookupByLibrary.simpleMessage("Milestones"),
    "min_length": m11,
    "modified_badge": MessageLookupByLibrary.simpleMessage("Modified"),
    "my_projects": MessageLookupByLibrary.simpleMessage("My Projects"),
    "needs_your_attention": MessageLookupByLibrary.simpleMessage(
      "Needs Your Attention",
    ),
    "new_badge": MessageLookupByLibrary.simpleMessage("NEW"),
    "new_change_request": MessageLookupByLibrary.simpleMessage(
      "New Change Request",
    ),
    "new_password": MessageLookupByLibrary.simpleMessage("New Password"),
    "new_project": MessageLookupByLibrary.simpleMessage("New Project"),
    "next_pick_file": MessageLookupByLibrary.simpleMessage("Next: pick file"),
    "no_active_projects": MessageLookupByLibrary.simpleMessage(
      "No active projects",
    ),
    "no_activity_recorded": MessageLookupByLibrary.simpleMessage(
      "No activity recorded yet",
    ),
    "no_amendments_ratified": MessageLookupByLibrary.simpleMessage(
      "No amendments have been ratified yet.",
    ),
    "no_change_requests": MessageLookupByLibrary.simpleMessage(
      "No change requests",
    ),
    "no_client_assigned": MessageLookupByLibrary.simpleMessage(
      "No client assigned",
    ),
    "no_clients_available": MessageLookupByLibrary.simpleMessage(
      "No clients available. Add a client first.",
    ),
    "no_clients_found": MessageLookupByLibrary.simpleMessage(
      "No clients found",
    ),
    "no_contract_created": MessageLookupByLibrary.simpleMessage(
      "No contract has been created for this project yet.",
    ),
    "no_contract_terms": MessageLookupByLibrary.simpleMessage(
      "No contract terms summary available.",
    ),
    "no_description_for_project": MessageLookupByLibrary.simpleMessage(
      "No description provided for this project.",
    ),
    "no_evidence_files": MessageLookupByLibrary.simpleMessage(
      "No evidence files attached yet.",
    ),
    "no_evidence_package": MessageLookupByLibrary.simpleMessage(
      "No evidence package data available.",
    ),
    "no_internet_connection": MessageLookupByLibrary.simpleMessage(
      "No internet connection",
    ),
    "no_matching_projects": MessageLookupByLibrary.simpleMessage(
      "No matching projects",
    ),
    "no_messages_yet": MessageLookupByLibrary.simpleMessage(
      "No messages yet. Start the conversation!",
    ),
    "no_milestones_found": MessageLookupByLibrary.simpleMessage(
      "No milestones found.",
    ),
    "no_milestones_yet": MessageLookupByLibrary.simpleMessage(
      "No milestones yet",
    ),
    "no_notifications": MessageLookupByLibrary.simpleMessage(
      "No notifications",
    ),
    "no_pending_invitations": MessageLookupByLibrary.simpleMessage(
      "No pending invitations",
    ),
    "no_pending_invitations_description": MessageLookupByLibrary.simpleMessage(
      "When freelancers invite you to collaborate on projects, you will see them here.",
    ),
    "no_project_description": MessageLookupByLibrary.simpleMessage(
      "No project description provided.",
    ),
    "no_projects_for_client": MessageLookupByLibrary.simpleMessage(
      "No projects for this client yet.",
    ),
    "no_projects_yet": MessageLookupByLibrary.simpleMessage("No projects yet"),
    "no_resolution_proposals": MessageLookupByLibrary.simpleMessage(
      "No resolution proposals have been submitted yet.",
    ),
    "no_submissions_yet": MessageLookupByLibrary.simpleMessage(
      "No deliverables submitted yet.",
    ),
    "no_supplementary_evidence": MessageLookupByLibrary.simpleMessage(
      "No supplementary evidence uploaded.",
    ),
    "non_custodial_disclaimer": MessageLookupByLibrary.simpleMessage(
      "Meethaq is an informational tracking ledger and does not hold, escrow, or transmit funds.",
    ),
    "notYetEligible": MessageLookupByLibrary.simpleMessage("Not Yet Eligible"),
    "notYetEligibleTooltip": MessageLookupByLibrary.simpleMessage(
      "Amounts that are not yet eligible for payment.",
    ),
    "not_allowed": MessageLookupByLibrary.simpleMessage("Not allowed."),
    "not_now": MessageLookupByLibrary.simpleMessage("Not now"),
    "not_set": MessageLookupByLibrary.simpleMessage("Not set"),
    "not_started": MessageLookupByLibrary.simpleMessage("Not Started"),
    "not_yet_eligible": MessageLookupByLibrary.simpleMessage(
      "Not Yet Eligible",
    ),
    "not_yet_eligible_tooltip": MessageLookupByLibrary.simpleMessage(
      "Amounts that are not yet eligible for payment.",
    ),
    "notes": MessageLookupByLibrary.simpleMessage("Notes"),
    "notes_optional": MessageLookupByLibrary.simpleMessage("Notes (optional)"),
    "notes_required_error": MessageLookupByLibrary.simpleMessage(
      "Submission notes are required",
    ),
    "notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
    "onDisputeHold": MessageLookupByLibrary.simpleMessage("On Dispute Hold"),
    "onDisputeHoldTooltip": MessageLookupByLibrary.simpleMessage(
      "Amounts currently on hold due to an open dispute.",
    ),
    "on_dispute_hold": MessageLookupByLibrary.simpleMessage("On Dispute Hold"),
    "on_dispute_hold_tooltip": MessageLookupByLibrary.simpleMessage(
      "Amounts currently on hold due to an open dispute.",
    ),
    "onboarding_progression": MessageLookupByLibrary.simpleMessage(
      "Onboarding Progress",
    ),
    "only_freelancers_manage_clients": MessageLookupByLibrary.simpleMessage(
      "Only freelancers can manage clients.",
    ),
    "open_dispute": MessageLookupByLibrary.simpleMessage("Open Dispute"),
    "overdue_client_review": MessageLookupByLibrary.simpleMessage(
      "Client Review Overdue",
    ),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "password_changed_successfully": MessageLookupByLibrary.simpleMessage(
      "Password changed successfully",
    ),
    "password_char_required": MessageLookupByLibrary.simpleMessage(
      "Password must contain at least one character.",
    ),
    "password_min_length": MessageLookupByLibrary.simpleMessage(
      "Password must be at least 8 characters long.",
    ),
    "password_num_required": MessageLookupByLibrary.simpleMessage(
      "Password must contain at least one number.",
    ),
    "password_special_char_required": MessageLookupByLibrary.simpleMessage(
      "Password must contain a special character.",
    ),
    "passwords_do_not_match": MessageLookupByLibrary.simpleMessage(
      "Passwords do not match",
    ),
    "paymentIssues": MessageLookupByLibrary.simpleMessage("Payment Issues"),
    "paymentIssuesTooltip": MessageLookupByLibrary.simpleMessage(
      "Payments that encountered an issue and need attention.",
    ),
    "payment_amount": MessageLookupByLibrary.simpleMessage("Payment Amount"),
    "payment_confirmed_success": MessageLookupByLibrary.simpleMessage(
      "Payment receipt confirmed successfully.",
    ),
    "payment_date": MessageLookupByLibrary.simpleMessage("Payment Date"),
    "payment_evidence_receipts": MessageLookupByLibrary.simpleMessage(
      "Payment Evidence / Receipts",
    ),
    "payment_evidence_submitted": MessageLookupByLibrary.simpleMessage(
      "Corrected payment evidence submitted.",
    ),
    "payment_issue_hint": MessageLookupByLibrary.simpleMessage(
      "Describe the payment discrepancy or issue in detail...",
    ),
    "payment_issue_reported": MessageLookupByLibrary.simpleMessage(
      "Payment issue reported.",
    ),
    "payment_issues": MessageLookupByLibrary.simpleMessage("Payment Issues"),
    "payment_issues_tooltip": MessageLookupByLibrary.simpleMessage(
      "Payments that encountered an issue and need attention.",
    ),
    "payment_method": MessageLookupByLibrary.simpleMessage("Payment Method"),
    "payment_method_bank_transfer": MessageLookupByLibrary.simpleMessage(
      "Bank Transfer",
    ),
    "payment_method_cash": MessageLookupByLibrary.simpleMessage("Cash"),
    "payment_method_instapay": MessageLookupByLibrary.simpleMessage("Instapay"),
    "payment_method_other": MessageLookupByLibrary.simpleMessage("Other"),
    "payment_method_stc_pay": MessageLookupByLibrary.simpleMessage("STC Pay"),
    "payment_notes": MessageLookupByLibrary.simpleMessage("Payment Notes"),
    "payment_notes_hint": MessageLookupByLibrary.simpleMessage(
      "Optional notes for the freelancer...",
    ),
    "payment_receipts": MessageLookupByLibrary.simpleMessage(
      "Payment Receipts",
    ),
    "payment_recorded_success": MessageLookupByLibrary.simpleMessage(
      "Payment recorded successfully.",
    ),
    "payment_requires_reference_or_file": MessageLookupByLibrary.simpleMessage(
      "Please provide either a transaction reference or at least one receipt file.",
    ),
    "payment_status_awaiting_confirmation":
        MessageLookupByLibrary.simpleMessage("Awaiting Confirmation"),
    "payment_status_eligible": MessageLookupByLibrary.simpleMessage(
      "Eligible for Payment",
    ),
    "payment_status_issue_reported": MessageLookupByLibrary.simpleMessage(
      "Issue Reported",
    ),
    "payment_status_not_eligible": MessageLookupByLibrary.simpleMessage(
      "Not Eligible",
    ),
    "payment_status_paid": MessageLookupByLibrary.simpleMessage("Paid"),
    "payments_awaiting_confirmation": MessageLookupByLibrary.simpleMessage(
      "Awaiting confirmation",
    ),
    "payments_no_activity_yet": MessageLookupByLibrary.simpleMessage(
      "No payments yet",
    ),
    "payments_summary": MessageLookupByLibrary.simpleMessage("Payments"),
    "payments_total_paid": MessageLookupByLibrary.simpleMessage("Paid"),
    "payments_total_unpaid": MessageLookupByLibrary.simpleMessage("Unpaid"),
    "payments_view_details": MessageLookupByLibrary.simpleMessage(
      "View payment details",
    ),
    "pending": MessageLookupByLibrary.simpleMessage("Pending"),
    "pending_status": MessageLookupByLibrary.simpleMessage("Pending"),
    "pending_tab": MessageLookupByLibrary.simpleMessage("Pending"),
    "percentage": MessageLookupByLibrary.simpleMessage("Percentage"),
    "personal_information": MessageLookupByLibrary.simpleMessage(
      "Personal Information",
    ),
    "phone": MessageLookupByLibrary.simpleMessage("Phone"),
    "phone_number": MessageLookupByLibrary.simpleMessage("Phone Number"),
    "phone_number_required": MessageLookupByLibrary.simpleMessage(
      "Phone number is required",
    ),
    "photo_removed": MessageLookupByLibrary.simpleMessage("Photo removed."),
    "please_assign_client": MessageLookupByLibrary.simpleMessage(
      "Please assign a client",
    ),
    "preview_contract": MessageLookupByLibrary.simpleMessage(
      "Preview Contract",
    ),
    "professional": MessageLookupByLibrary.simpleMessage("Professional"),
    "professional_title": MessageLookupByLibrary.simpleMessage(
      "Professional Title",
    ),
    "professional_title_required": MessageLookupByLibrary.simpleMessage(
      "Professional title is required",
    ),
    "profile": MessageLookupByLibrary.simpleMessage("Profile"),
    "project_accepted_successfully": MessageLookupByLibrary.simpleMessage(
      "Project accepted successfully",
    ),
    "project_chat": MessageLookupByLibrary.simpleMessage("Project Chat"),
    "project_completed_success": MessageLookupByLibrary.simpleMessage(
      "Project successfully completed!",
    ),
    "project_completion": MessageLookupByLibrary.simpleMessage(
      "Project Completion",
    ),
    "project_created_successfully": MessageLookupByLibrary.simpleMessage(
      "Project created successfully",
    ),
    "project_details": MessageLookupByLibrary.simpleMessage("Project Details"),
    "project_information": MessageLookupByLibrary.simpleMessage(
      "Project Information",
    ),
    "project_not_found": MessageLookupByLibrary.simpleMessage(
      "Project not found.",
    ),
    "project_overview": MessageLookupByLibrary.simpleMessage(
      "Project Overview",
    ),
    "project_payment_summary": MessageLookupByLibrary.simpleMessage(
      "Payment Summary",
    ),
    "project_scope_description": MessageLookupByLibrary.simpleMessage(
      "Project Scope & Description",
    ),
    "project_status_managed_separately": MessageLookupByLibrary.simpleMessage(
      "Client and project status are managed separately from the Project Details screen.",
    ),
    "project_title": MessageLookupByLibrary.simpleMessage("Project Title"),
    "project_title_hint": MessageLookupByLibrary.simpleMessage(
      "e.g. Mobile App Redesign",
    ),
    "project_title_required": MessageLookupByLibrary.simpleMessage(
      "Project title is required",
    ),
    "project_total_value_required_for_contract":
        MessageLookupByLibrary.simpleMessage(
          "This project has no total value set. Please edit the project and add a value before creating a contract.",
        ),
    "project_updated_successfully": MessageLookupByLibrary.simpleMessage(
      "Project updated successfully",
    ),
    "project_value": MessageLookupByLibrary.simpleMessage("Project Value"),
    "projects": MessageLookupByLibrary.simpleMessage("Projects"),
    "propose_resolution": MessageLookupByLibrary.simpleMessage(
      "Propose Resolution",
    ),
    "proposed_milestone_terms": MessageLookupByLibrary.simpleMessage(
      "Proposed Milestone Terms",
    ),
    "proposed_milestones": MessageLookupByLibrary.simpleMessage(
      "Proposed Milestones",
    ),
    "proposed_project_value": MessageLookupByLibrary.simpleMessage(
      "Proposed Project Value",
    ),
    "proposed_resolution_hint": MessageLookupByLibrary.simpleMessage(
      "Enter proposed resolution terms (min 10 characters)...",
    ),
    "proposed_terms": MessageLookupByLibrary.simpleMessage(
      "Proposed Resolution Terms",
    ),
    "proposed_value": MessageLookupByLibrary.simpleMessage("Proposed Value"),
    "provide_rejection_reason": MessageLookupByLibrary.simpleMessage(
      "Provide reason for rejection...",
    ),
    "ratified": MessageLookupByLibrary.simpleMessage("Ratified"),
    "readyForClientPayment": MessageLookupByLibrary.simpleMessage(
      "Ready for Client Payment",
    ),
    "readyForClientPaymentTooltip": MessageLookupByLibrary.simpleMessage(
      "Amounts ready to be paid by the client.",
    ),
    "readyForPayment": MessageLookupByLibrary.simpleMessage(
      "Ready for Payment",
    ),
    "readyForPaymentTooltip": MessageLookupByLibrary.simpleMessage(
      "Amounts approved and ready to be paid.",
    ),
    "ready_for_client_payment": MessageLookupByLibrary.simpleMessage(
      "Ready for Client Payment",
    ),
    "ready_for_client_payment_tooltip": MessageLookupByLibrary.simpleMessage(
      "Amounts ready to be paid by the client.",
    ),
    "ready_for_payment": MessageLookupByLibrary.simpleMessage(
      "Ready for Payment",
    ),
    "ready_for_payment_tooltip": MessageLookupByLibrary.simpleMessage(
      "Amounts approved and ready to be paid.",
    ),
    "reason_for_rejection": MessageLookupByLibrary.simpleMessage(
      "Reason for Rejection",
    ),
    "reason_label": m12,
    "reason_length_error": MessageLookupByLibrary.simpleMessage(
      "Reason must be 10-4000 characters",
    ),
    "reason_required_error": MessageLookupByLibrary.simpleMessage(
      "Revision reason is required",
    ),
    "recent_activity": MessageLookupByLibrary.simpleMessage("Recent Activity"),
    "recent_messages": MessageLookupByLibrary.simpleMessage("Recent Messages"),
    "record_payment": MessageLookupByLibrary.simpleMessage("Record Payment"),
    "registration_success_missing_user": MessageLookupByLibrary.simpleMessage(
      "Registration succeeded but user data is missing.",
    ),
    "reject": MessageLookupByLibrary.simpleMessage("Reject"),
    "reject_change_request": MessageLookupByLibrary.simpleMessage(
      "Reject Change Request",
    ),
    "reject_resolution": MessageLookupByLibrary.simpleMessage(
      "Reject Resolution",
    ),
    "rejected": MessageLookupByLibrary.simpleMessage("Rejected"),
    "rejection_reason_hint": MessageLookupByLibrary.simpleMessage(
      "Enter reason for rejecting this resolution proposal...",
    ),
    "remaining_value": MessageLookupByLibrary.simpleMessage("Remaining Value"),
    "remind_client": MessageLookupByLibrary.simpleMessage("Remind Client"),
    "reminder_cooldown_message": MessageLookupByLibrary.simpleMessage(
      "A reminder was recently sent. Please wait before reminding again.",
    ),
    "remove": MessageLookupByLibrary.simpleMessage("Remove"),
    "remove_milestone": MessageLookupByLibrary.simpleMessage(
      "Remove milestone?",
    ),
    "report_payment_issue": MessageLookupByLibrary.simpleMessage(
      "Report Payment Issue",
    ),
    "request_cancelled": MessageLookupByLibrary.simpleMessage(
      "Request cancelled",
    ),
    "request_changes": MessageLookupByLibrary.simpleMessage("Request Changes"),
    "request_failed": MessageLookupByLibrary.simpleMessage("Request failed"),
    "request_revision": MessageLookupByLibrary.simpleMessage(
      "Request Revision",
    ),
    "requested_info_not_found": MessageLookupByLibrary.simpleMessage(
      "Requested information not found",
    ),
    "requested_resolution": MessageLookupByLibrary.simpleMessage(
      "Requested Resolution",
    ),
    "requests_tab": MessageLookupByLibrary.simpleMessage("Requests"),
    "required_changes": MessageLookupByLibrary.simpleMessage(
      "Required Changes",
    ),
    "required_changes_hint": MessageLookupByLibrary.simpleMessage(
      "e.g. Add mobile responsive views for tablet and phone",
    ),
    "required_email": MessageLookupByLibrary.simpleMessage("Email is required"),
    "required_email_or_fullname": MessageLookupByLibrary.simpleMessage(
      "Email or Full Name is required",
    ),
    "required_first_name": MessageLookupByLibrary.simpleMessage(
      "First name is required.",
    ),
    "required_last_name": MessageLookupByLibrary.simpleMessage(
      "Last name is required.",
    ),
    "required_password": MessageLookupByLibrary.simpleMessage(
      "Password is required",
    ),
    "required_professional_title": MessageLookupByLibrary.simpleMessage(
      "Professional title is required",
    ),
    "required_username": MessageLookupByLibrary.simpleMessage(
      "Username is required",
    ),
    "resolution_proposals": MessageLookupByLibrary.simpleMessage(
      "Resolution Proposals",
    ),
    "resolution_request_hint": MessageLookupByLibrary.simpleMessage(
      "What outcome or fix are you requesting? (min 10 characters)...",
    ),
    "resubmit_contract": MessageLookupByLibrary.simpleMessage(
      "Resubmit Contract",
    ),
    "resubmit_deliverable": MessageLookupByLibrary.simpleMessage(
      "Submit Revised Deliverable",
    ),
    "resulting_value": MessageLookupByLibrary.simpleMessage("Resulting Value"),
    "retry": MessageLookupByLibrary.simpleMessage("Retry"),
    "review_client_feedback": MessageLookupByLibrary.simpleMessage(
      "Review Client Feedback",
    ),
    "review_contract": MessageLookupByLibrary.simpleMessage("Review Contract"),
    "review_deadline": MessageLookupByLibrary.simpleMessage("Review Deadline"),
    "review_deliverable": MessageLookupByLibrary.simpleMessage(
      "Review Deliverable",
    ),
    "review_invitation": MessageLookupByLibrary.simpleMessage(
      "Review Invitation",
    ),
    "review_overdue": MessageLookupByLibrary.simpleMessage("Review Overdue"),
    "revision_reason": MessageLookupByLibrary.simpleMessage("Revision Reason"),
    "revision_reason_hint": MessageLookupByLibrary.simpleMessage(
      "e.g. Design does not match acceptance criteria",
    ),
    "save_and_preview_contract": MessageLookupByLibrary.simpleMessage(
      "ٍSave and Preview Contract",
    ),
    "save_changes": MessageLookupByLibrary.simpleMessage("Save Changes"),
    "scope_description": MessageLookupByLibrary.simpleMessage(
      "Scope Description",
    ),
    "scope_label": m13,
    "scope_length_error": MessageLookupByLibrary.simpleMessage(
      "Scope change must be 10-4000 characters",
    ),
    "scope_of_work": MessageLookupByLibrary.simpleMessage("Scope of Work"),
    "scope_of_work_hint": MessageLookupByLibrary.simpleMessage(
      "Describe the tasks and deliverables included in this project",
    ),
    "search": MessageLookupByLibrary.simpleMessage("Search"),
    "search_clients": MessageLookupByLibrary.simpleMessage("Search clients..."),
    "search_projects_by_title": MessageLookupByLibrary.simpleMessage(
      "Search projects by title...",
    ),
    "select_client": MessageLookupByLibrary.simpleMessage("Select a client"),
    "sent_by": MessageLookupByLibrary.simpleMessage("Sent By"),
    "server_error": MessageLookupByLibrary.simpleMessage("Server error"),
    "session_expired": MessageLookupByLibrary.simpleMessage(
      "Your session has expired.",
    ),
    "session_expired_login_again": MessageLookupByLibrary.simpleMessage(
      "Your session has expired. Please log in again.",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "single_pending_cr_error": MessageLookupByLibrary.simpleMessage(
      "Only one change request may be pending approval at a time.",
    ),
    "something_went_wrong": MessageLookupByLibrary.simpleMessage(
      "Something went wrong",
    ),
    "start_date": MessageLookupByLibrary.simpleMessage("Start Date"),
    "start_milestone": MessageLookupByLibrary.simpleMessage("Start Milestone"),
    "status_accepted": MessageLookupByLibrary.simpleMessage("Accepted"),
    "status_approved": MessageLookupByLibrary.simpleMessage("Approved"),
    "status_changes_requested": MessageLookupByLibrary.simpleMessage(
      "Changes Requested",
    ),
    "status_draft": MessageLookupByLibrary.simpleMessage("Draft"),
    "status_in_progress": MessageLookupByLibrary.simpleMessage("In Progress"),
    "status_not_started": MessageLookupByLibrary.simpleMessage("Not Started"),
    "status_pending_approval": MessageLookupByLibrary.simpleMessage(
      "Pending Approval",
    ),
    "status_submitted": MessageLookupByLibrary.simpleMessage("Submitted"),
    "step_add_client": MessageLookupByLibrary.simpleMessage("Add Client"),
    "step_create_project": MessageLookupByLibrary.simpleMessage(
      "Create Project",
    ),
    "step_prepare_contract": MessageLookupByLibrary.simpleMessage(
      "Prepare Contract",
    ),
    "step_send_for_approval": MessageLookupByLibrary.simpleMessage(
      "Send for Client Approval",
    ),
    "submission_history": MessageLookupByLibrary.simpleMessage(
      "Submission History",
    ),
    "submission_notes": MessageLookupByLibrary.simpleMessage(
      "Submission Notes",
    ),
    "submission_notes_hint": MessageLookupByLibrary.simpleMessage(
      "Describe the work completed for this deliverable...",
    ),
    "submit_change_request": MessageLookupByLibrary.simpleMessage(
      "Submit Change Request",
    ),
    "submit_corrected_evidence": MessageLookupByLibrary.simpleMessage(
      "Submit Corrected Evidence",
    ),
    "submit_deliverable": MessageLookupByLibrary.simpleMessage(
      "Submit Deliverable",
    ),
    "submit_for_approval": MessageLookupByLibrary.simpleMessage(
      "Submit for Approval",
    ),
    "support_short": MessageLookupByLibrary.simpleMessage("Support"),
    "tab_activity_history": MessageLookupByLibrary.simpleMessage(
      "Activity history",
    ),
    "tab_contract_criteria": MessageLookupByLibrary.simpleMessage(
      "Contract & Criteria",
    ),
    "tab_dispute_evidence": MessageLookupByLibrary.simpleMessage(
      "Dispute Evidence",
    ),
    "tab_messages": MessageLookupByLibrary.simpleMessage("Messages"),
    "tab_payment_evidence": MessageLookupByLibrary.simpleMessage(
      "Payment Evidence",
    ),
    "tab_submissions": MessageLookupByLibrary.simpleMessage("Submissions"),
    "table_view": MessageLookupByLibrary.simpleMessage("Table View"),
    "tap_photo": MessageLookupByLibrary.simpleMessage("Tap to change photo"),
    "tap_to_retry": MessageLookupByLibrary.simpleMessage("Tap to retry"),
    "this_month": MessageLookupByLibrary.simpleMessage("This Month"),
    "this_year": MessageLookupByLibrary.simpleMessage("This Year"),
    "timeline": MessageLookupByLibrary.simpleMessage("Timeline"),
    "title": MessageLookupByLibrary.simpleMessage("Title"),
    "title_length_error": MessageLookupByLibrary.simpleMessage(
      "Title must be 3-200 characters",
    ),
    "title_too_short": MessageLookupByLibrary.simpleMessage(
      "Title is too short",
    ),
    "today": MessageLookupByLibrary.simpleMessage("Today"),
    "too_many_requests": MessageLookupByLibrary.simpleMessage(
      "Too many requests. Please try again shortly.",
    ),
    "totalConfirmedPayments": MessageLookupByLibrary.simpleMessage(
      "Total Confirmed Payments",
    ),
    "totalConfirmedPaymentsTooltip": MessageLookupByLibrary.simpleMessage(
      "Total value of all payments confirmed so far.",
    ),
    "totalIncomeReceived": MessageLookupByLibrary.simpleMessage(
      "Total Income Received",
    ),
    "totalIncomeReceivedTooltip": MessageLookupByLibrary.simpleMessage(
      "Total income you have received.",
    ),
    "totalUnpaidValue": MessageLookupByLibrary.simpleMessage(
      "Total Unpaid Value",
    ),
    "totalUnpaidValueTooltip": MessageLookupByLibrary.simpleMessage(
      "Total value that has not yet been paid.",
    ),
    "total_confirmed_payments": MessageLookupByLibrary.simpleMessage(
      "Total Confirmed Payments",
    ),
    "total_confirmed_payments_tooltip": MessageLookupByLibrary.simpleMessage(
      "Total value of all payments confirmed so far.",
    ),
    "total_income_received": MessageLookupByLibrary.simpleMessage(
      "Total Income Received",
    ),
    "total_income_received_tooltip": MessageLookupByLibrary.simpleMessage(
      "Total income you have received.",
    ),
    "total_milestones": MessageLookupByLibrary.simpleMessage(
      "Total Milestones",
    ),
    "total_paid": MessageLookupByLibrary.simpleMessage("Total Paid"),
    "total_unpaid": MessageLookupByLibrary.simpleMessage("Total Unpaid"),
    "total_unpaid_value": MessageLookupByLibrary.simpleMessage(
      "Total Unpaid Value",
    ),
    "total_unpaid_value_tooltip": MessageLookupByLibrary.simpleMessage(
      "Total value that has not yet been paid.",
    ),
    "total_value_optional": MessageLookupByLibrary.simpleMessage(
      "Total Value (optional)",
    ),
    "transaction_reference": MessageLookupByLibrary.simpleMessage(
      "Transaction Reference",
    ),
    "transaction_reference_hint": MessageLookupByLibrary.simpleMessage(
      "e.g. TRX-902188",
    ),
    "trend_months_12": MessageLookupByLibrary.simpleMessage("12 Months"),
    "trend_months_6": MessageLookupByLibrary.simpleMessage("6 Months"),
    "type_a_message": MessageLookupByLibrary.simpleMessage("Type a message..."),
    "unable_to_open_file": MessageLookupByLibrary.simpleMessage(
      "Unable to open the file. Please try again.",
    ),
    "unassign": MessageLookupByLibrary.simpleMessage("Unassign"),
    "unassigned": MessageLookupByLibrary.simpleMessage("Unassigned"),
    "unassigned_client": MessageLookupByLibrary.simpleMessage(
      "Unassigned Client",
    ),
    "unauthorized": MessageLookupByLibrary.simpleMessage("Unauthorized"),
    "unknown_error_occurred": MessageLookupByLibrary.simpleMessage(
      "Unknown error occurred",
    ),
    "upcoming_milestones": MessageLookupByLibrary.simpleMessage(
      "Upcoming Milestones",
    ),
    "update_your_account_password": MessageLookupByLibrary.simpleMessage(
      "Update your account password",
    ),
    "upload_failed": MessageLookupByLibrary.simpleMessage("Upload failed"),
    "url_required": MessageLookupByLibrary.simpleMessage("URL is required"),
    "username_invalid": MessageLookupByLibrary.simpleMessage(
      "Only letters, numbers, and underscores allowed",
    ),
    "username_invalid_characters": MessageLookupByLibrary.simpleMessage(
      "Only letters, numbers, and underscores are allowed",
    ),
    "username_min_length": MessageLookupByLibrary.simpleMessage(
      "Username must be at least 3 characters",
    ),
    "username_required": MessageLookupByLibrary.simpleMessage(
      "Username is required",
    ),
    "validation_failed": MessageLookupByLibrary.simpleMessage(
      "Validation failed",
    ),
    "value_placeholder_hint": MessageLookupByLibrary.simpleMessage("e.g. 5000"),
    "version": m14,
    "view_all": MessageLookupByLibrary.simpleMessage("View All"),
    "view_approved_contract": MessageLookupByLibrary.simpleMessage(
      "View Approved Contract",
    ),
    "view_details": MessageLookupByLibrary.simpleMessage("View Details"),
    "view_dispute": MessageLookupByLibrary.simpleMessage("View Dispute"),
    "view_effective_agreement": MessageLookupByLibrary.simpleMessage(
      "View Effective Agreement",
    ),
    "waiting_client_approval": MessageLookupByLibrary.simpleMessage(
      "Waiting for Client Approval",
    ),
    "waiting_for_client": MessageLookupByLibrary.simpleMessage(
      "Waiting for Client",
    ),
    "waiting_for_freelancer": MessageLookupByLibrary.simpleMessage(
      "Waiting for Freelancer",
    ),
    "waiting_for_other_party_review": MessageLookupByLibrary.simpleMessage(
      "Waiting for the other party to review this proposal.",
    ),
    "welcome_back": m15,
    "withdraw_change_request": MessageLookupByLibrary.simpleMessage("Withdraw"),
    "withdraw_change_request_confirmation":
        MessageLookupByLibrary.simpleMessage(
          "Are you sure you want to withdraw this change request?",
        ),
    "withdraw_contract": MessageLookupByLibrary.simpleMessage(
      "Withdraw Contract",
    ),
    "withdraw_dispute": MessageLookupByLibrary.simpleMessage(
      "Withdraw Dispute",
    ),
    "yesterday": MessageLookupByLibrary.simpleMessage("Yesterday"),
    "your_action_required": MessageLookupByLibrary.simpleMessage(
      "Your Action Required",
    ),
    "zero_open_disputes_required": MessageLookupByLibrary.simpleMessage(
      "No open disputes permitted",
    ),
    "zero_pending_change_requests_required":
        MessageLookupByLibrary.simpleMessage(
          "No pending change requests permitted",
        ),
  };
}
