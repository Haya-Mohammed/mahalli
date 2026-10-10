// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Language Change`
  String get language_change {
    return Intl.message(
      'Language Change',
      name: 'language_change',
      desc: '',
      args: [],
    );
  }

  /// `Appearance`
  String get appearance {
    return Intl.message('Appearance', name: 'appearance', desc: '', args: []);
  }

  /// `Light mode`
  String get light_mode {
    return Intl.message('Light mode', name: 'light_mode', desc: '', args: []);
  }

  /// `Dark mode`
  String get dark_mode {
    return Intl.message('Dark mode', name: 'dark_mode', desc: '', args: []);
  }

  /// `Meethaq`
  String get app_title {
    return Intl.message('Meethaq', name: 'app_title', desc: '', args: []);
  }

  /// `Please enter a valid email address.`
  String get invalid_email {
    return Intl.message(
      'Please enter a valid email address.',
      name: 'invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters long.`
  String get password_min_length {
    return Intl.message(
      'Password must be at least 8 characters long.',
      name: 'password_min_length',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one character.`
  String get password_char_required {
    return Intl.message(
      'Password must contain at least one character.',
      name: 'password_char_required',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one number.`
  String get password_num_required {
    return Intl.message(
      'Password must contain at least one number.',
      name: 'password_num_required',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain a special character.`
  String get password_special_char_required {
    return Intl.message(
      'Password must contain a special character.',
      name: 'password_special_char_required',
      desc: '',
      args: [],
    );
  }

  /// `First name is required.`
  String get required_first_name {
    return Intl.message(
      'First name is required.',
      name: 'required_first_name',
      desc: '',
      args: [],
    );
  }

  /// `Last name is required.`
  String get required_last_name {
    return Intl.message(
      'Last name is required.',
      name: 'required_last_name',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get required_email {
    return Intl.message(
      'Email is required',
      name: 'required_email',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get required_password {
    return Intl.message(
      'Password is required',
      name: 'required_password',
      desc: '',
      args: [],
    );
  }

  /// `Email or Full Name is required`
  String get required_email_or_fullname {
    return Intl.message(
      'Email or Full Name is required',
      name: 'required_email_or_fullname',
      desc: '',
      args: [],
    );
  }

  /// `Must be at least {minLength} characters`
  String min_length(int minLength) {
    return Intl.message(
      'Must be at least $minLength characters',
      name: 'min_length',
      desc: 'Validation message for minimum field length',
      args: [minLength],
    );
  }

  /// `Username is required`
  String get required_username {
    return Intl.message(
      'Username is required',
      name: 'required_username',
      desc: '',
      args: [],
    );
  }

  /// `Username must be at least 3 characters`
  String get username_min_length {
    return Intl.message(
      'Username must be at least 3 characters',
      name: 'username_min_length',
      desc: '',
      args: [],
    );
  }

  /// `Only letters, numbers, and underscores allowed`
  String get username_invalid {
    return Intl.message(
      'Only letters, numbers, and underscores allowed',
      name: 'username_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid phone number`
  String get invalid_phone {
    return Intl.message(
      'Enter a valid phone number',
      name: 'invalid_phone',
      desc: '',
      args: [],
    );
  }

  /// `Professional title is required`
  String get required_professional_title {
    return Intl.message(
      'Professional title is required',
      name: 'required_professional_title',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get first_name {
    return Intl.message('First Name', name: 'first_name', desc: '', args: []);
  }

  /// `Last Name`
  String get last_name {
    return Intl.message('Last Name', name: 'last_name', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Email Or Full Name`
  String get email_or_fullName {
    return Intl.message(
      'Email Or Full Name',
      name: 'email_or_fullName',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Enter your details to continue to the dashboard`
  String get login_subtitle {
    return Intl.message(
      'Enter your details to continue to the dashboard',
      name: 'login_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login_action {
    return Intl.message('Login', name: 'login_action', desc: '', args: []);
  }

  /// `Forgot Password?`
  String get forgot_password {
    return Intl.message(
      'Forgot Password?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dont_have_account {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dont_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get already_have_account {
    return Intl.message(
      'Already have an account?',
      name: 'already_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Support`
  String get support_short {
    return Intl.message('Support', name: 'support_short', desc: '', args: []);
  }

  /// `An account with this email already exists`
  String get account_already_exists {
    return Intl.message(
      'An account with this email already exists',
      name: 'account_already_exists',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get create_account {
    return Intl.message(
      'Create Account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `Choose your account type and get started in minutes`
  String get create_account_subtitle {
    return Intl.message(
      'Choose your account type and get started in minutes',
      name: 'create_account_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get create_account_action {
    return Intl.message(
      'Create Account',
      name: 'create_account_action',
      desc: '',
      args: [],
    );
  }

  /// `Account Type`
  String get account_type {
    return Intl.message(
      'Account Type',
      name: 'account_type',
      desc: '',
      args: [],
    );
  }

  /// `Freelancer`
  String get freelancer {
    return Intl.message('Freelancer', name: 'freelancer', desc: '', args: []);
  }

  /// `Offer my services and work on projects for clients`
  String get freelancer_description {
    return Intl.message(
      'Offer my services and work on projects for clients',
      name: 'freelancer_description',
      desc: '',
      args: [],
    );
  }

  /// `Client`
  String get client {
    return Intl.message('Client', name: 'client', desc: '', args: []);
  }

  /// `Client`
  String get client_type {
    return Intl.message('Client', name: 'client_type', desc: '', args: []);
  }

  /// `Hire freelancers and manage my contracts and projects`
  String get client_description {
    return Intl.message(
      'Hire freelancers and manage my contracts and projects',
      name: 'client_description',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: 'Button label to retry a failed load',
      args: [],
    );
  }

  /// `Tap to change photo`
  String get tap_photo {
    return Intl.message(
      'Tap to change photo',
      name: 'tap_photo',
      desc: '',
      args: [],
    );
  }

  /// `Failed to update profile`
  String get failed_update_profile {
    return Intl.message(
      'Failed to update profile',
      name: 'failed_update_profile',
      desc: '',
      args: [],
    );
  }

  /// `Photo removed.`
  String get photo_removed {
    return Intl.message(
      'Photo removed.',
      name: 'photo_removed',
      desc: '',
      args: [],
    );
  }

  /// `Image selected — upload will be wired once the backend endpoint is confirmed.`
  String get image_selected_will_be_wired {
    return Intl.message(
      'Image selected — upload will be wired once the backend endpoint is confirmed.',
      name: 'image_selected_will_be_wired',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to log out?`
  String get logout_confirmation {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'logout_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Account Information`
  String get account_information {
    return Intl.message(
      'Account Information',
      name: 'account_information',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message('Account', name: 'account', desc: '', args: []);
  }

  /// `Phone Number`
  String get phone_number {
    return Intl.message(
      'Phone Number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message('Country', name: 'country', desc: '', args: []);
  }

  /// `Title`
  String get title {
    return Intl.message('Title', name: 'title', desc: '', args: []);
  }

  /// `Bio`
  String get bio {
    return Intl.message('Bio', name: 'bio', desc: '', args: []);
  }

  /// `Professional`
  String get professional {
    return Intl.message(
      'Professional',
      name: 'professional',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Edit Profile`
  String get edit_profile {
    return Intl.message(
      'Edit Profile',
      name: 'edit_profile',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get change_password {
    return Intl.message(
      'Change Password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get save_changes {
    return Intl.message(
      'Save Changes',
      name: 'save_changes',
      desc: '',
      args: [],
    );
  }

  /// `Professional Title`
  String get professional_title {
    return Intl.message(
      'Professional Title',
      name: 'professional_title',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get personal_information {
    return Intl.message(
      'Personal Information',
      name: 'personal_information',
      desc: '',
      args: [],
    );
  }

  /// `Contact Information`
  String get contact_information {
    return Intl.message(
      'Contact Information',
      name: 'contact_information',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get full_name {
    return Intl.message('Full Name', name: 'full_name', desc: '', args: []);
  }

  /// `Something went wrong`
  String get something_went_wrong {
    return Intl.message(
      'Something went wrong',
      name: 'something_went_wrong',
      desc: '',
      args: [],
    );
  }

  /// `An account with this email already exists`
  String get email_already_exists {
    return Intl.message(
      'An account with this email already exists',
      name: 'email_already_exists',
      desc: '',
      args: [],
    );
  }

  /// `Password changed successfully`
  String get password_changed_successfully {
    return Intl.message(
      'Password changed successfully',
      name: 'password_changed_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Update your account password`
  String get update_your_account_password {
    return Intl.message(
      'Update your account password',
      name: 'update_your_account_password',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get current_password {
    return Intl.message(
      'Current Password',
      name: 'current_password',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get new_password {
    return Intl.message(
      'New Password',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get confirm_new_password {
    return Intl.message(
      'Confirm New Password',
      name: 'confirm_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Projects`
  String get projects {
    return Intl.message('Projects', name: 'projects', desc: '', args: []);
  }

  /// `Invitations`
  String get invitations {
    return Intl.message('Invitations', name: 'invitations', desc: '', args: []);
  }

  /// `Clients`
  String get clients {
    return Intl.message('Clients', name: 'clients', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Add Client`
  String get add_client {
    return Intl.message('Add Client', name: 'add_client', desc: '', args: []);
  }

  /// `Client added successfully`
  String get client_added_successfully {
    return Intl.message(
      'Client added successfully',
      name: 'client_added_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Enter the email of a registered client account to add them to your list.`
  String get add_client_description {
    return Intl.message(
      'Enter the email of a registered client account to add them to your list.',
      name: 'add_client_description',
      desc: '',
      args: [],
    );
  }

  /// `Client Email`
  String get client_email {
    return Intl.message(
      'Client Email',
      name: 'client_email',
      desc: '',
      args: [],
    );
  }

  /// `Company Name (optional)`
  String get company_name_optional {
    return Intl.message(
      'Company Name (optional)',
      name: 'company_name_optional',
      desc: '',
      args: [],
    );
  }

  /// `Notes (optional)`
  String get notes_optional {
    return Intl.message(
      'Notes (optional)',
      name: 'notes_optional',
      desc: '',
      args: [],
    );
  }

  /// `Client Details`
  String get client_details {
    return Intl.message(
      'Client Details',
      name: 'client_details',
      desc: '',
      args: [],
    );
  }

  /// `Edit Client`
  String get edit_client {
    return Intl.message('Edit Client', name: 'edit_client', desc: '', args: []);
  }

  /// `Client updated successfully`
  String get client_updated_successfully {
    return Intl.message(
      'Client updated successfully',
      name: 'client_updated_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Name and email are managed by the client's own account.`
  String get client_account_managed_message {
    return Intl.message(
      'Name and email are managed by the client\'s own account.',
      name: 'client_account_managed_message',
      desc: '',
      args: [],
    );
  }

  /// `Edit Details`
  String get edit_details {
    return Intl.message(
      'Edit Details',
      name: 'edit_details',
      desc: '',
      args: [],
    );
  }

  /// `Search clients...`
  String get search_clients {
    return Intl.message(
      'Search clients...',
      name: 'search_clients',
      desc: '',
      args: [],
    );
  }

  /// `No clients found`
  String get no_clients_found {
    return Intl.message(
      'No clients found',
      name: 'no_clients_found',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message('Phone', name: 'phone', desc: '', args: []);
  }

  /// `Notes`
  String get notes {
    return Intl.message('Notes', name: 'notes', desc: '', args: []);
  }

  /// `Loading clients...`
  String get loading_clients {
    return Intl.message(
      'Loading clients...',
      name: 'loading_clients',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load clients`
  String get failed_to_load_clients {
    return Intl.message(
      'Failed to load clients',
      name: 'failed_to_load_clients',
      desc: '',
      args: [],
    );
  }

  /// `No clients available. Add a client first.`
  String get no_clients_available {
    return Intl.message(
      'No clients available. Add a client first.',
      name: 'no_clients_available',
      desc: '',
      args: [],
    );
  }

  /// `Select a client`
  String get select_client {
    return Intl.message(
      'Select a client',
      name: 'select_client',
      desc: '',
      args: [],
    );
  }

  /// `Unassigned Client`
  String get unassigned_client {
    return Intl.message(
      'Unassigned Client',
      name: 'unassigned_client',
      desc: '',
      args: [],
    );
  }

  /// `Unassigned`
  String get unassigned {
    return Intl.message('Unassigned', name: 'unassigned', desc: '', args: []);
  }

  /// `New Project`
  String get new_project {
    return Intl.message('New Project', name: 'new_project', desc: '', args: []);
  }

  /// `Create a new project`
  String get create_new_project {
    return Intl.message(
      'Create a new project',
      name: 'create_new_project',
      desc: '',
      args: [],
    );
  }

  /// `Assign this project to an existing client to initiate collaboration.`
  String get create_project_description {
    return Intl.message(
      'Assign this project to an existing client to initiate collaboration.',
      name: 'create_project_description',
      desc: '',
      args: [],
    );
  }

  /// `Project Information`
  String get project_information {
    return Intl.message(
      'Project Information',
      name: 'project_information',
      desc: '',
      args: [],
    );
  }

  /// `Project Title`
  String get project_title {
    return Intl.message(
      'Project Title',
      name: 'project_title',
      desc: '',
      args: [],
    );
  }

  /// `e.g. Mobile App Redesign`
  String get project_title_hint {
    return Intl.message(
      'e.g. Mobile App Redesign',
      name: 'project_title_hint',
      desc: '',
      args: [],
    );
  }

  /// `Description (optional)`
  String get description_optional {
    return Intl.message(
      'Description (optional)',
      name: 'description_optional',
      desc: '',
      args: [],
    );
  }

  /// `Describe deliverables, milestones, or scope...`
  String get description_hint {
    return Intl.message(
      'Describe deliverables, milestones, or scope...',
      name: 'description_hint',
      desc: '',
      args: [],
    );
  }

  /// `Create Project`
  String get create_project {
    return Intl.message(
      'Create Project',
      name: 'create_project',
      desc: '',
      args: [],
    );
  }

  /// `Project created successfully`
  String get project_created_successfully {
    return Intl.message(
      'Project created successfully',
      name: 'project_created_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Edit Project`
  String get edit_project {
    return Intl.message(
      'Edit Project',
      name: 'edit_project',
      desc: '',
      args: [],
    );
  }

  /// `Project updated successfully`
  String get project_updated_successfully {
    return Intl.message(
      'Project updated successfully',
      name: 'project_updated_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Client and project status are managed separately from the Project Details screen.`
  String get project_status_managed_separately {
    return Intl.message(
      'Client and project status are managed separately from the Project Details screen.',
      name: 'project_status_managed_separately',
      desc: '',
      args: [],
    );
  }

  /// `Search projects by title...`
  String get search_projects_by_title {
    return Intl.message(
      'Search projects by title...',
      name: 'search_projects_by_title',
      desc: '',
      args: [],
    );
  }

  /// `View Details`
  String get view_details {
    return Intl.message(
      'View Details',
      name: 'view_details',
      desc: '',
      args: [],
    );
  }

  /// `No matching projects`
  String get no_matching_projects {
    return Intl.message(
      'No matching projects',
      name: 'no_matching_projects',
      desc: '',
      args: [],
    );
  }

  /// `No projects yet`
  String get no_projects_yet {
    return Intl.message(
      'No projects yet',
      name: 'no_projects_yet',
      desc: '',
      args: [],
    );
  }

  /// `Try adjusting your search terms.`
  String get adjust_search_terms {
    return Intl.message(
      'Try adjusting your search terms.',
      name: 'adjust_search_terms',
      desc: '',
      args: [],
    );
  }

  /// `Create your first project to start tracking your work with clients.`
  String get create_first_project {
    return Intl.message(
      'Create your first project to start tracking your work with clients.',
      name: 'create_first_project',
      desc: '',
      args: [],
    );
  }

  /// `Project Details`
  String get project_details {
    return Intl.message(
      'Project Details',
      name: 'project_details',
      desc: '',
      args: [],
    );
  }

  /// `Client Information`
  String get client_information {
    return Intl.message(
      'Client Information',
      name: 'client_information',
      desc: '',
      args: [],
    );
  }

  /// `Assigned Client`
  String get assigned_client {
    return Intl.message(
      'Assigned Client',
      name: 'assigned_client',
      desc: '',
      args: [],
    );
  }

  /// `No client assigned`
  String get no_client_assigned {
    return Intl.message(
      'No client assigned',
      name: 'no_client_assigned',
      desc: '',
      args: [],
    );
  }

  /// `Assign Client`
  String get assign_client {
    return Intl.message(
      'Assign Client',
      name: 'assign_client',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get change {
    return Intl.message('Change', name: 'change', desc: '', args: []);
  }

  /// `Unassign`
  String get unassign {
    return Intl.message('Unassign', name: 'unassign', desc: '', args: []);
  }

  /// `Project Scope & Description`
  String get project_scope_description {
    return Intl.message(
      'Project Scope & Description',
      name: 'project_scope_description',
      desc: '',
      args: [],
    );
  }

  /// `No project description provided.`
  String get no_project_description {
    return Intl.message(
      'No project description provided.',
      name: 'no_project_description',
      desc: '',
      args: [],
    );
  }

  /// `No projects for this client yet.`
  String get no_projects_for_client {
    return Intl.message(
      'No projects for this client yet.',
      name: 'no_projects_for_client',
      desc: '',
      args: [],
    );
  }

  /// `No description provided for this project.`
  String get no_description_for_project {
    return Intl.message(
      'No description provided for this project.',
      name: 'no_description_for_project',
      desc: '',
      args: [],
    );
  }

  /// `Timeline`
  String get timeline {
    return Intl.message('Timeline', name: 'timeline', desc: '', args: []);
  }

  /// `Created`
  String get created {
    return Intl.message('Created', name: 'created', desc: '', args: []);
  }

  /// `Accepted`
  String get accepted {
    return Intl.message('Accepted', name: 'accepted', desc: '', args: []);
  }

  /// `Cancel Project`
  String get cancel_project {
    return Intl.message(
      'Cancel Project',
      name: 'cancel_project',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to cancel this project? This will mark the project as cancelled and cannot be undone.`
  String get cancel_project_confirmation {
    return Intl.message(
      'Are you sure you want to cancel this project? This will mark the project as cancelled and cannot be undone.',
      name: 'cancel_project_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Keep Project`
  String get keep_project {
    return Intl.message(
      'Keep Project',
      name: 'keep_project',
      desc: '',
      args: [],
    );
  }

  /// `Project title is required`
  String get project_title_required {
    return Intl.message(
      'Project title is required',
      name: 'project_title_required',
      desc: '',
      args: [],
    );
  }

  /// `Title is too short`
  String get title_too_short {
    return Intl.message(
      'Title is too short',
      name: 'title_too_short',
      desc: '',
      args: [],
    );
  }

  /// `Please assign a client`
  String get please_assign_client {
    return Intl.message(
      'Please assign a client',
      name: 'please_assign_client',
      desc: '',
      args: [],
    );
  }

  /// `Not Started`
  String get not_started {
    return Intl.message('Not Started', name: 'not_started', desc: '', args: []);
  }

  /// `In Progress`
  String get in_progress {
    return Intl.message('In Progress', name: 'in_progress', desc: '', args: []);
  }

  /// `Active`
  String get active {
    return Intl.message('Active', name: 'active', desc: '', args: []);
  }

  /// `Pending`
  String get pending {
    return Intl.message('Pending', name: 'pending', desc: '', args: []);
  }

  /// `Completed`
  String get completed {
    return Intl.message('Completed', name: 'completed', desc: '', args: []);
  }

  /// `Cancelled`
  String get cancelled {
    return Intl.message('Cancelled', name: 'cancelled', desc: '', args: []);
  }

  /// `Rejected`
  String get rejected {
    return Intl.message('Rejected', name: 'rejected', desc: '', args: []);
  }

  /// `Invalid data submitted.`
  String get invalid_data_submitted {
    return Intl.message(
      'Invalid data submitted.',
      name: 'invalid_data_submitted',
      desc: '',
      args: [],
    );
  }

  /// `Your session has expired.`
  String get session_expired {
    return Intl.message(
      'Your session has expired.',
      name: 'session_expired',
      desc: '',
      args: [],
    );
  }

  /// `Your session has expired. Please log in again.`
  String get session_expired_login_again {
    return Intl.message(
      'Your session has expired. Please log in again.',
      name: 'session_expired_login_again',
      desc: '',
      args: [],
    );
  }

  /// `Not allowed.`
  String get not_allowed {
    return Intl.message(
      'Not allowed.',
      name: 'not_allowed',
      desc: '',
      args: [],
    );
  }

  /// `Request failed`
  String get request_failed {
    return Intl.message(
      'Request failed',
      name: 'request_failed',
      desc: '',
      args: [],
    );
  }

  /// `Project not found.`
  String get project_not_found {
    return Intl.message(
      'Project not found.',
      name: 'project_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Client not found.`
  String get client_not_found {
    return Intl.message(
      'Client not found.',
      name: 'client_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Invitation not found.`
  String get invitation_not_found {
    return Intl.message(
      'Invitation not found.',
      name: 'invitation_not_found',
      desc: '',
      args: [],
    );
  }

  /// `This action conflicts with the current project state.`
  String get action_conflicts_project_state {
    return Intl.message(
      'This action conflicts with the current project state.',
      name: 'action_conflicts_project_state',
      desc: '',
      args: [],
    );
  }

  /// `Only freelancers can manage clients.`
  String get only_freelancers_manage_clients {
    return Intl.message(
      'Only freelancers can manage clients.',
      name: 'only_freelancers_manage_clients',
      desc: '',
      args: [],
    );
  }

  /// `This client is already in your list.`
  String get client_already_in_list {
    return Intl.message(
      'This client is already in your list.',
      name: 'client_already_in_list',
      desc: '',
      args: [],
    );
  }

  /// `Too many requests. Please try again shortly.`
  String get too_many_requests {
    return Intl.message(
      'Too many requests. Please try again shortly.',
      name: 'too_many_requests',
      desc: '',
      args: [],
    );
  }

  /// `My Projects`
  String get my_projects {
    return Intl.message('My Projects', name: 'my_projects', desc: '', args: []);
  }

  /// `Accepted project invitations will appear here.`
  String get accepted_project_invitations {
    return Intl.message(
      'Accepted project invitations will appear here.',
      name: 'accepted_project_invitations',
      desc: '',
      args: [],
    );
  }

  /// `Freelancer Information`
  String get freelancer_information {
    return Intl.message(
      'Freelancer Information',
      name: 'freelancer_information',
      desc: '',
      args: [],
    );
  }

  /// `Assigned Freelancer`
  String get assigned_freelancer {
    return Intl.message(
      'Assigned Freelancer',
      name: 'assigned_freelancer',
      desc: '',
      args: [],
    );
  }

  /// `Sent By`
  String get sent_by {
    return Intl.message('Sent By', name: 'sent_by', desc: '', args: []);
  }

  /// `Invited you to collaborate`
  String get invited_you_to_collaborate {
    return Intl.message(
      'Invited you to collaborate',
      name: 'invited_you_to_collaborate',
      desc: '',
      args: [],
    );
  }

  /// `Review Invitation`
  String get review_invitation {
    return Intl.message(
      'Review Invitation',
      name: 'review_invitation',
      desc: '',
      args: [],
    );
  }

  /// `No pending invitations`
  String get no_pending_invitations {
    return Intl.message(
      'No pending invitations',
      name: 'no_pending_invitations',
      desc: '',
      args: [],
    );
  }

  /// `When freelancers invite you to collaborate on projects, you will see them here.`
  String get no_pending_invitations_description {
    return Intl.message(
      'When freelancers invite you to collaborate on projects, you will see them here.',
      name: 'no_pending_invitations_description',
      desc: '',
      args: [],
    );
  }

  /// `Accept Project`
  String get accept_project {
    return Intl.message(
      'Accept Project',
      name: 'accept_project',
      desc: '',
      args: [],
    );
  }

  /// `Accepting this invitation will establish collaboration and make the project visible in your active project list.`
  String get accept_invitation_confirmation {
    return Intl.message(
      'Accepting this invitation will establish collaboration and make the project visible in your active project list.',
      name: 'accept_invitation_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Not now`
  String get not_now {
    return Intl.message('Not now', name: 'not_now', desc: '', args: []);
  }

  /// `Project accepted successfully`
  String get project_accepted_successfully {
    return Intl.message(
      'Project accepted successfully',
      name: 'project_accepted_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Invitation Details`
  String get invitation_details {
    return Intl.message(
      'Invitation Details',
      name: 'invitation_details',
      desc: '',
      args: [],
    );
  }

  /// `This invitation has been accepted`
  String get invitation_already_accepted {
    return Intl.message(
      'This invitation has been accepted',
      name: 'invitation_already_accepted',
      desc: '',
      args: [],
    );
  }

  /// `This invitation has already been accepted or is no longer available.`
  String get invitation_no_longer_available {
    return Intl.message(
      'This invitation has already been accepted or is no longer available.',
      name: 'invitation_no_longer_available',
      desc: '',
      args: [],
    );
  }

  /// `Not set`
  String get not_set {
    return Intl.message('Not set', name: 'not_set', desc: '', args: []);
  }

  /// `Logout failed`
  String get logout_failed {
    return Intl.message(
      'Logout failed',
      name: 'logout_failed',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load profile`
  String get failed_to_load_profile {
    return Intl.message(
      'Failed to load profile',
      name: 'failed_to_load_profile',
      desc: '',
      args: [],
    );
  }

  /// `Upload failed`
  String get upload_failed {
    return Intl.message(
      'Upload failed',
      name: 'upload_failed',
      desc: '',
      args: [],
    );
  }

  /// `Delete failed`
  String get delete_failed {
    return Intl.message(
      'Delete failed',
      name: 'delete_failed',
      desc: '',
      args: [],
    );
  }

  /// `Current password is required`
  String get current_password_required {
    return Intl.message(
      'Current password is required',
      name: 'current_password_required',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm your new password`
  String get confirm_new_password_required {
    return Intl.message(
      'Please confirm your new password',
      name: 'confirm_new_password_required',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwords_do_not_match {
    return Intl.message(
      'Passwords do not match',
      name: 'passwords_do_not_match',
      desc: '',
      args: [],
    );
  }

  /// `Failed to change password`
  String get failed_to_change_password {
    return Intl.message(
      'Failed to change password',
      name: 'failed_to_change_password',
      desc: '',
      args: [],
    );
  }

  /// `Registration succeeded but user data is missing.`
  String get registration_success_missing_user {
    return Intl.message(
      'Registration succeeded but user data is missing.',
      name: 'registration_success_missing_user',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `No internet connection`
  String get no_internet_connection {
    return Intl.message(
      'No internet connection',
      name: 'no_internet_connection',
      desc: '',
      args: [],
    );
  }

  /// `Local storage error`
  String get local_storage_error {
    return Intl.message(
      'Local storage error',
      name: 'local_storage_error',
      desc: '',
      args: [],
    );
  }

  /// `Server error`
  String get server_error {
    return Intl.message(
      'Server error',
      name: 'server_error',
      desc: '',
      args: [],
    );
  }

  /// `Error during communication`
  String get error_during_communication {
    return Intl.message(
      'Error during communication',
      name: 'error_during_communication',
      desc: '',
      args: [],
    );
  }

  /// `Bad request`
  String get bad_request {
    return Intl.message('Bad request', name: 'bad_request', desc: '', args: []);
  }

  /// `Unauthorized`
  String get unauthorized {
    return Intl.message(
      'Unauthorized',
      name: 'unauthorized',
      desc: '',
      args: [],
    );
  }

  /// `Requested information not found`
  String get requested_info_not_found {
    return Intl.message(
      'Requested information not found',
      name: 'requested_info_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Conflict occurred`
  String get conflict_occurred {
    return Intl.message(
      'Conflict occurred',
      name: 'conflict_occurred',
      desc: '',
      args: [],
    );
  }

  /// `Validation failed`
  String get validation_failed {
    return Intl.message(
      'Validation failed',
      name: 'validation_failed',
      desc: '',
      args: [],
    );
  }

  /// `Internal server error`
  String get internal_server_error {
    return Intl.message(
      'Internal server error',
      name: 'internal_server_error',
      desc: '',
      args: [],
    );
  }

  /// `Bad certificate`
  String get bad_certificate {
    return Intl.message(
      'Bad certificate',
      name: 'bad_certificate',
      desc: '',
      args: [],
    );
  }

  /// `Request cancelled`
  String get request_cancelled {
    return Intl.message(
      'Request cancelled',
      name: 'request_cancelled',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error occurred`
  String get unknown_error_occurred {
    return Intl.message(
      'Unknown error occurred',
      name: 'unknown_error_occurred',
      desc: '',
      args: [],
    );
  }

  /// `First name must be at least 2 characters`
  String get first_name_min_length {
    return Intl.message(
      'First name must be at least 2 characters',
      name: 'first_name_min_length',
      desc: '',
      args: [],
    );
  }

  /// `Last name must be at least 2 characters`
  String get last_name_min_length {
    return Intl.message(
      'Last name must be at least 2 characters',
      name: 'last_name_min_length',
      desc: '',
      args: [],
    );
  }

  /// `Username is required`
  String get username_required {
    return Intl.message(
      'Username is required',
      name: 'username_required',
      desc: '',
      args: [],
    );
  }

  /// `Only letters, numbers, and underscores are allowed`
  String get username_invalid_characters {
    return Intl.message(
      'Only letters, numbers, and underscores are allowed',
      name: 'username_invalid_characters',
      desc: '',
      args: [],
    );
  }

  /// `Phone number is required`
  String get phone_number_required {
    return Intl.message(
      'Phone number is required',
      name: 'phone_number_required',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid phone number`
  String get invalid_phone_number {
    return Intl.message(
      'Enter a valid phone number',
      name: 'invalid_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Professional title is required`
  String get professional_title_required {
    return Intl.message(
      'Professional title is required',
      name: 'professional_title_required',
      desc: '',
      args: [],
    );
  }

  /// `Contract`
  String get contract {
    return Intl.message('Contract', name: 'contract', desc: '', args: []);
  }

  /// `Contracts`
  String get contracts {
    return Intl.message('Contracts', name: 'contracts', desc: '', args: []);
  }

  /// `Contract Details`
  String get contract_details {
    return Intl.message(
      'Contract Details',
      name: 'contract_details',
      desc: '',
      args: [],
    );
  }

  /// `Contract Title`
  String get contract_title {
    return Intl.message(
      'Contract Title',
      name: 'contract_title',
      desc: '',
      args: [],
    );
  }

  /// `Enter contract title`
  String get contract_title_hint {
    return Intl.message(
      'Enter contract title',
      name: 'contract_title_hint',
      desc: '',
      args: [],
    );
  }

  /// `Scope of Work`
  String get scope_of_work {
    return Intl.message(
      'Scope of Work',
      name: 'scope_of_work',
      desc: '',
      args: [],
    );
  }

  /// `Describe the tasks and deliverables included in this project`
  String get scope_of_work_hint {
    return Intl.message(
      'Describe the tasks and deliverables included in this project',
      name: 'scope_of_work_hint',
      desc: '',
      args: [],
    );
  }

  /// `General Terms`
  String get general_terms {
    return Intl.message(
      'General Terms',
      name: 'general_terms',
      desc: '',
      args: [],
    );
  }

  /// `Specify revision limits, communication rules, or agreed conditions`
  String get general_terms_hint {
    return Intl.message(
      'Specify revision limits, communication rules, or agreed conditions',
      name: 'general_terms_hint',
      desc: '',
      args: [],
    );
  }

  /// `Start Date`
  String get start_date {
    return Intl.message('Start Date', name: 'start_date', desc: '', args: []);
  }

  /// `Expected End Date`
  String get expected_end_date {
    return Intl.message(
      'Expected End Date',
      name: 'expected_end_date',
      desc: '',
      args: [],
    );
  }

  /// `Milestones`
  String get milestones {
    return Intl.message('Milestones', name: 'milestones', desc: '', args: []);
  }

  /// `Milestone`
  String get milestone {
    return Intl.message('Milestone', name: 'milestone', desc: '', args: []);
  }

  /// `No milestones yet`
  String get no_milestones_yet {
    return Intl.message(
      'No milestones yet',
      name: 'no_milestones_yet',
      desc: '',
      args: [],
    );
  }

  /// `Add Milestone`
  String get add_milestone {
    return Intl.message(
      'Add Milestone',
      name: 'add_milestone',
      desc: '',
      args: [],
    );
  }

  /// `Edit Milestone`
  String get edit_milestone {
    return Intl.message(
      'Edit Milestone',
      name: 'edit_milestone',
      desc: '',
      args: [],
    );
  }

  /// `Delete Milestone`
  String get delete_milestone {
    return Intl.message(
      'Delete Milestone',
      name: 'delete_milestone',
      desc: '',
      args: [],
    );
  }

  /// `Milestone Title`
  String get milestone_title {
    return Intl.message(
      'Milestone Title',
      name: 'milestone_title',
      desc: '',
      args: [],
    );
  }

  /// `Milestone Description`
  String get milestone_description {
    return Intl.message(
      'Milestone Description',
      name: 'milestone_description',
      desc: '',
      args: [],
    );
  }

  /// `Deliverable`
  String get deliverable {
    return Intl.message('Deliverable', name: 'deliverable', desc: '', args: []);
  }

  /// `What tangible item will be delivered?`
  String get deliverable_hint {
    return Intl.message(
      'What tangible item will be delivered?',
      name: 'deliverable_hint',
      desc: '',
      args: [],
    );
  }

  /// `Acceptance Criteria`
  String get acceptance_criteria {
    return Intl.message(
      'Acceptance Criteria',
      name: 'acceptance_criteria',
      desc: '',
      args: [],
    );
  }

  /// `Conditions required for client approval`
  String get acceptance_criteria_hint {
    return Intl.message(
      'Conditions required for client approval',
      name: 'acceptance_criteria_hint',
      desc: '',
      args: [],
    );
  }

  /// `Due Date`
  String get due_date {
    return Intl.message('Due Date', name: 'due_date', desc: '', args: []);
  }

  /// `Allocation Mode`
  String get allocation_mode {
    return Intl.message(
      'Allocation Mode',
      name: 'allocation_mode',
      desc: '',
      args: [],
    );
  }

  /// `Fixed Amount`
  String get fixed_amount {
    return Intl.message(
      'Fixed Amount',
      name: 'fixed_amount',
      desc: '',
      args: [],
    );
  }

  /// `Percentage`
  String get percentage {
    return Intl.message('Percentage', name: 'percentage', desc: '', args: []);
  }

  /// `Project Value`
  String get project_value {
    return Intl.message(
      'Project Value',
      name: 'project_value',
      desc: '',
      args: [],
    );
  }

  /// `Allocated Value`
  String get allocated_value {
    return Intl.message(
      'Allocated Value',
      name: 'allocated_value',
      desc: '',
      args: [],
    );
  }

  /// `Remaining Value`
  String get remaining_value {
    return Intl.message(
      'Remaining Value',
      name: 'remaining_value',
      desc: '',
      args: [],
    );
  }

  /// `Contract Builder`
  String get contract_builder {
    return Intl.message(
      'Contract Builder',
      name: 'contract_builder',
      desc: '',
      args: [],
    );
  }

  /// `Preview Contract`
  String get preview_contract {
    return Intl.message(
      'Preview Contract',
      name: 'preview_contract',
      desc: '',
      args: [],
    );
  }

  /// `ٍSave and Preview Contract`
  String get save_and_preview_contract {
    return Intl.message(
      'ٍSave and Preview Contract',
      name: 'save_and_preview_contract',
      desc: '',
      args: [],
    );
  }

  /// `Submit for Approval`
  String get submit_for_approval {
    return Intl.message(
      'Submit for Approval',
      name: 'submit_for_approval',
      desc: '',
      args: [],
    );
  }

  /// `Withdraw Contract`
  String get withdraw_contract {
    return Intl.message(
      'Withdraw Contract',
      name: 'withdraw_contract',
      desc: '',
      args: [],
    );
  }

  /// `Review Contract`
  String get review_contract {
    return Intl.message(
      'Review Contract',
      name: 'review_contract',
      desc: '',
      args: [],
    );
  }

  /// `Approve Contract`
  String get approve_contract {
    return Intl.message(
      'Approve Contract',
      name: 'approve_contract',
      desc: '',
      args: [],
    );
  }

  /// `Request Changes`
  String get request_changes {
    return Intl.message(
      'Request Changes',
      name: 'request_changes',
      desc: '',
      args: [],
    );
  }

  /// `Client Feedback`
  String get client_feedback {
    return Intl.message(
      'Client Feedback',
      name: 'client_feedback',
      desc: '',
      args: [],
    );
  }

  /// `Explain what changes are needed (minimum 10 characters)`
  String get enter_change_feedback {
    return Intl.message(
      'Explain what changes are needed (minimum 10 characters)',
      name: 'enter_change_feedback',
      desc: '',
      args: [],
    );
  }

  /// `Resubmit Contract`
  String get resubmit_contract {
    return Intl.message(
      'Resubmit Contract',
      name: 'resubmit_contract',
      desc: '',
      args: [],
    );
  }

  /// `Approved Contract`
  String get approved_contract {
    return Intl.message(
      'Approved Contract',
      name: 'approved_contract',
      desc: '',
      args: [],
    );
  }

  /// `Approved By`
  String get approved_by {
    return Intl.message('Approved By', name: 'approved_by', desc: '', args: []);
  }

  /// `Approval Date`
  String get approval_date {
    return Intl.message(
      'Approval Date',
      name: 'approval_date',
      desc: '',
      args: [],
    );
  }

  /// `Draft`
  String get status_draft {
    return Intl.message('Draft', name: 'status_draft', desc: '', args: []);
  }

  /// `Pending Approval`
  String get status_pending_approval {
    return Intl.message(
      'Pending Approval',
      name: 'status_pending_approval',
      desc: '',
      args: [],
    );
  }

  /// `Changes Requested`
  String get status_changes_requested {
    return Intl.message(
      'Changes Requested',
      name: 'status_changes_requested',
      desc: '',
      args: [],
    );
  }

  /// `Approved`
  String get status_approved {
    return Intl.message(
      'Approved',
      name: 'status_approved',
      desc: '',
      args: [],
    );
  }

  /// `Create Contract`
  String get create_contract {
    return Intl.message(
      'Create Contract',
      name: 'create_contract',
      desc: '',
      args: [],
    );
  }

  /// `Continue Editing`
  String get continue_editing {
    return Intl.message(
      'Continue Editing',
      name: 'continue_editing',
      desc: '',
      args: [],
    );
  }

  /// `Waiting for Client Approval`
  String get waiting_client_approval {
    return Intl.message(
      'Waiting for Client Approval',
      name: 'waiting_client_approval',
      desc: '',
      args: [],
    );
  }

  /// `Review Client Feedback`
  String get review_client_feedback {
    return Intl.message(
      'Review Client Feedback',
      name: 'review_client_feedback',
      desc: '',
      args: [],
    );
  }

  /// `View Approved Contract`
  String get view_approved_contract {
    return Intl.message(
      'View Approved Contract',
      name: 'view_approved_contract',
      desc: '',
      args: [],
    );
  }

  /// `Contract Requires Review`
  String get contract_requires_review {
    return Intl.message(
      'Contract Requires Review',
      name: 'contract_requires_review',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a contract title (at least 3 characters)`
  String get contract_title_required {
    return Intl.message(
      'Please enter a contract title (at least 3 characters)',
      name: 'contract_title_required',
      desc: '',
      args: [],
    );
  }

  /// `Please provide a scope of work (at least 10 characters)`
  String get contract_scope_required {
    return Intl.message(
      'Please provide a scope of work (at least 10 characters)',
      name: 'contract_scope_required',
      desc: '',
      args: [],
    );
  }

  /// `Add at least one milestone before submitting`
  String get contract_min_milestones {
    return Intl.message(
      'Add at least one milestone before submitting',
      name: 'contract_min_milestones',
      desc: '',
      args: [],
    );
  }

  /// `All milestones must have a deliverable`
  String get contract_deliverable_required {
    return Intl.message(
      'All milestones must have a deliverable',
      name: 'contract_deliverable_required',
      desc: '',
      args: [],
    );
  }

  /// `All milestones must have acceptance criteria`
  String get contract_criteria_required {
    return Intl.message(
      'All milestones must have acceptance criteria',
      name: 'contract_criteria_required',
      desc: '',
      args: [],
    );
  }

  /// `All milestones must have a due date`
  String get contract_due_date_required {
    return Intl.message(
      'All milestones must have a due date',
      name: 'contract_due_date_required',
      desc: '',
      args: [],
    );
  }

  /// `Total allocated amount must equal project value`
  String get contract_allocation_incomplete {
    return Intl.message(
      'Total allocated amount must equal project value',
      name: 'contract_allocation_incomplete',
      desc: '',
      args: [],
    );
  }

  /// `Milestone due dates must follow sequential chronological order`
  String get contract_chronological_dates {
    return Intl.message(
      'Milestone due dates must follow sequential chronological order',
      name: 'contract_chronological_dates',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to submit this contract? It will be sent to the client for review.`
  String get confirm_submit_contract {
    return Intl.message(
      'Are you sure you want to submit this contract? It will be sent to the client for review.',
      name: 'confirm_submit_contract',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to withdraw this contract? It will return to draft status.`
  String get confirm_withdraw_contract {
    return Intl.message(
      'Are you sure you want to withdraw this contract? It will return to draft status.',
      name: 'confirm_withdraw_contract',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to approve this contract? Once approved, it becomes finalized and immutable.`
  String get confirm_approve_contract {
    return Intl.message(
      'Are you sure you want to approve this contract? Once approved, it becomes finalized and immutable.',
      name: 'confirm_approve_contract',
      desc: '',
      args: [],
    );
  }

  /// `Contract submitted successfully`
  String get contract_submitted_successfully {
    return Intl.message(
      'Contract submitted successfully',
      name: 'contract_submitted_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Contract withdrawn successfully`
  String get contract_withdrawn_successfully {
    return Intl.message(
      'Contract withdrawn successfully',
      name: 'contract_withdrawn_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Contract approved successfully`
  String get contract_approved_successfully {
    return Intl.message(
      'Contract approved successfully',
      name: 'contract_approved_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Changes requested successfully`
  String get changes_requested_successfully {
    return Intl.message(
      'Changes requested successfully',
      name: 'changes_requested_successfully',
      desc: '',
      args: [],
    );
  }

  /// `No contract has been created for this project yet.`
  String get no_contract_created {
    return Intl.message(
      'No contract has been created for this project yet.',
      name: 'no_contract_created',
      desc: '',
      args: [],
    );
  }

  /// `Allocation Summary`
  String get allocation_summary {
    return Intl.message(
      'Allocation Summary',
      name: 'allocation_summary',
      desc: '',
      args: [],
    );
  }

  /// `Allocation Complete`
  String get allocation_complete {
    return Intl.message(
      'Allocation Complete',
      name: 'allocation_complete',
      desc: '',
      args: [],
    );
  }

  /// `Allocation exceeds project value`
  String get allocation_exceeds_project_value {
    return Intl.message(
      'Allocation exceeds project value',
      name: 'allocation_exceeds_project_value',
      desc: '',
      args: [],
    );
  }

  /// `This project has no total value set. Please edit the project and add a value before creating a contract.`
  String get project_total_value_required_for_contract {
    return Intl.message(
      'This project has no total value set. Please edit the project and add a value before creating a contract.',
      name: 'project_total_value_required_for_contract',
      desc: '',
      args: [],
    );
  }

  /// `Total Value (optional)`
  String get total_value_optional {
    return Intl.message(
      'Total Value (optional)',
      name: 'total_value_optional',
      desc: '',
      args: [],
    );
  }

  /// `Not Started`
  String get status_not_started {
    return Intl.message(
      'Not Started',
      name: 'status_not_started',
      desc: '',
      args: [],
    );
  }

  /// `In Progress`
  String get status_in_progress {
    return Intl.message(
      'In Progress',
      name: 'status_in_progress',
      desc: '',
      args: [],
    );
  }

  /// `Submitted`
  String get status_submitted {
    return Intl.message(
      'Submitted',
      name: 'status_submitted',
      desc: '',
      args: [],
    );
  }

  /// `Accepted`
  String get status_accepted {
    return Intl.message(
      'Accepted',
      name: 'status_accepted',
      desc: '',
      args: [],
    );
  }

  /// `Start Milestone`
  String get start_milestone {
    return Intl.message(
      'Start Milestone',
      name: 'start_milestone',
      desc: '',
      args: [],
    );
  }

  /// `Submit Deliverable`
  String get submit_deliverable {
    return Intl.message(
      'Submit Deliverable',
      name: 'submit_deliverable',
      desc: '',
      args: [],
    );
  }

  /// `Submit Revised Deliverable`
  String get resubmit_deliverable {
    return Intl.message(
      'Submit Revised Deliverable',
      name: 'resubmit_deliverable',
      desc: '',
      args: [],
    );
  }

  /// `Accept Deliverable`
  String get accept_deliverable {
    return Intl.message(
      'Accept Deliverable',
      name: 'accept_deliverable',
      desc: '',
      args: [],
    );
  }

  /// `Request Revision`
  String get request_revision {
    return Intl.message(
      'Request Revision',
      name: 'request_revision',
      desc: '',
      args: [],
    );
  }

  /// `Remind Client`
  String get remind_client {
    return Intl.message(
      'Remind Client',
      name: 'remind_client',
      desc: '',
      args: [],
    );
  }

  /// `Submission Notes`
  String get submission_notes {
    return Intl.message(
      'Submission Notes',
      name: 'submission_notes',
      desc: '',
      args: [],
    );
  }

  /// `Describe the work completed for this deliverable...`
  String get submission_notes_hint {
    return Intl.message(
      'Describe the work completed for this deliverable...',
      name: 'submission_notes_hint',
      desc: '',
      args: [],
    );
  }

  /// `Evidence Files`
  String get evidence_files {
    return Intl.message(
      'Evidence Files',
      name: 'evidence_files',
      desc: '',
      args: [],
    );
  }

  /// `Evidence Links`
  String get evidence_links {
    return Intl.message(
      'Evidence Links',
      name: 'evidence_links',
      desc: '',
      args: [],
    );
  }

  /// `Add Link`
  String get add_evidence_link {
    return Intl.message(
      'Add Link',
      name: 'add_evidence_link',
      desc: '',
      args: [],
    );
  }

  /// `URL`
  String get link_url {
    return Intl.message('URL', name: 'link_url', desc: '', args: []);
  }

  /// `Link Title`
  String get link_title {
    return Intl.message('Link Title', name: 'link_title', desc: '', args: []);
  }

  /// `Review Deadline`
  String get review_deadline {
    return Intl.message(
      'Review Deadline',
      name: 'review_deadline',
      desc: '',
      args: [],
    );
  }

  /// `Review Overdue`
  String get review_overdue {
    return Intl.message(
      'Review Overdue',
      name: 'review_overdue',
      desc: '',
      args: [],
    );
  }

  /// `{days} days remaining`
  String days_remaining(Object days) {
    return Intl.message(
      '$days days remaining',
      name: 'days_remaining',
      desc: '',
      args: [days],
    );
  }

  /// `{hours} hours remaining`
  String hours_remaining(Object hours) {
    return Intl.message(
      '$hours hours remaining',
      name: 'hours_remaining',
      desc: '',
      args: [hours],
    );
  }

  /// `Submission History`
  String get submission_history {
    return Intl.message(
      'Submission History',
      name: 'submission_history',
      desc: '',
      args: [],
    );
  }

  /// `Version {version}`
  String version(Object version) {
    return Intl.message(
      'Version $version',
      name: 'version',
      desc: '',
      args: [version],
    );
  }

  /// `Latest Version`
  String get latest_version {
    return Intl.message(
      'Latest Version',
      name: 'latest_version',
      desc: '',
      args: [],
    );
  }

  /// `Revision Reason`
  String get revision_reason {
    return Intl.message(
      'Revision Reason',
      name: 'revision_reason',
      desc: '',
      args: [],
    );
  }

  /// `Required Changes`
  String get required_changes {
    return Intl.message(
      'Required Changes',
      name: 'required_changes',
      desc: '',
      args: [],
    );
  }

  /// `Optional Acceptance Note`
  String get acceptance_note_optional {
    return Intl.message(
      'Optional Acceptance Note',
      name: 'acceptance_note_optional',
      desc: '',
      args: [],
    );
  }

  /// `Acceptance permanently locks this milestone and marks it eligible for payment. It does NOT transfer money immediately.`
  String get acceptance_disclaimer {
    return Intl.message(
      'Acceptance permanently locks this milestone and marks it eligible for payment. It does NOT transfer money immediately.',
      name: 'acceptance_disclaimer',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Acceptance`
  String get confirm_acceptance {
    return Intl.message(
      'Confirm Acceptance',
      name: 'confirm_acceptance',
      desc: '',
      args: [],
    );
  }

  /// `A reminder was recently sent. Please wait before reminding again.`
  String get reminder_cooldown_message {
    return Intl.message(
      'A reminder was recently sent. Please wait before reminding again.',
      name: 'reminder_cooldown_message',
      desc: '',
      args: [],
    );
  }

  /// `Project Chat`
  String get project_chat {
    return Intl.message(
      'Project Chat',
      name: 'project_chat',
      desc: '',
      args: [],
    );
  }

  /// `Type a message...`
  String get type_a_message {
    return Intl.message(
      'Type a message...',
      name: 'type_a_message',
      desc: '',
      args: [],
    );
  }

  /// `Maximum 3 attachments allowed per message`
  String get chat_attachment_limit {
    return Intl.message(
      'Maximum 3 attachments allowed per message',
      name: 'chat_attachment_limit',
      desc: '',
      args: [],
    );
  }

  /// `Activity & Chat`
  String get execution_overview {
    return Intl.message(
      'Activity & Chat',
      name: 'execution_overview',
      desc: '',
      args: [],
    );
  }

  /// `Total Milestones`
  String get total_milestones {
    return Intl.message(
      'Total Milestones',
      name: 'total_milestones',
      desc: '',
      args: [],
    );
  }

  /// `Accepted`
  String get accepted_milestones {
    return Intl.message(
      'Accepted',
      name: 'accepted_milestones',
      desc: '',
      args: [],
    );
  }

  /// `Awaiting Review`
  String get awaiting_review {
    return Intl.message(
      'Awaiting Review',
      name: 'awaiting_review',
      desc: '',
      args: [],
    );
  }

  /// `All deliverables have been accepted!`
  String get all_deliverables_accepted {
    return Intl.message(
      'All deliverables have been accepted!',
      name: 'all_deliverables_accepted',
      desc: '',
      args: [],
    );
  }

  /// `Activity Timeline`
  String get activity_timeline {
    return Intl.message(
      'Activity Timeline',
      name: 'activity_timeline',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Mark all as read`
  String get mark_all_read {
    return Intl.message(
      'Mark all as read',
      name: 'mark_all_read',
      desc: '',
      args: [],
    );
  }

  /// `No notifications`
  String get no_notifications {
    return Intl.message(
      'No notifications',
      name: 'no_notifications',
      desc: '',
      args: [],
    );
  }

  /// `No messages yet. Start the conversation!`
  String get no_messages_yet {
    return Intl.message(
      'No messages yet. Start the conversation!',
      name: 'no_messages_yet',
      desc: '',
      args: [],
    );
  }

  /// `No deliverables submitted yet.`
  String get no_submissions_yet {
    return Intl.message(
      'No deliverables submitted yet.',
      name: 'no_submissions_yet',
      desc: '',
      args: [],
    );
  }

  /// `Submission notes are required`
  String get notes_required_error {
    return Intl.message(
      'Submission notes are required',
      name: 'notes_required_error',
      desc: '',
      args: [],
    );
  }

  /// `At least one evidence file or link is required`
  String get evidence_required_error {
    return Intl.message(
      'At least one evidence file or link is required',
      name: 'evidence_required_error',
      desc: '',
      args: [],
    );
  }

  /// `Revision reason is required`
  String get reason_required_error {
    return Intl.message(
      'Revision reason is required',
      name: 'reason_required_error',
      desc: '',
      args: [],
    );
  }

  /// `Required changes description is required`
  String get changes_required_error {
    return Intl.message(
      'Required changes description is required',
      name: 'changes_required_error',
      desc: '',
      args: [],
    );
  }

  /// `Not Eligible`
  String get payment_status_not_eligible {
    return Intl.message(
      'Not Eligible',
      name: 'payment_status_not_eligible',
      desc: '',
      args: [],
    );
  }

  /// `Eligible for Payment`
  String get payment_status_eligible {
    return Intl.message(
      'Eligible for Payment',
      name: 'payment_status_eligible',
      desc: '',
      args: [],
    );
  }

  /// `Awaiting Confirmation`
  String get payment_status_awaiting_confirmation {
    return Intl.message(
      'Awaiting Confirmation',
      name: 'payment_status_awaiting_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Paid`
  String get payment_status_paid {
    return Intl.message(
      'Paid',
      name: 'payment_status_paid',
      desc: '',
      args: [],
    );
  }

  /// `Issue Reported`
  String get payment_status_issue_reported {
    return Intl.message(
      'Issue Reported',
      name: 'payment_status_issue_reported',
      desc: '',
      args: [],
    );
  }

  /// `Record Payment`
  String get record_payment {
    return Intl.message(
      'Record Payment',
      name: 'record_payment',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Receipt`
  String get confirm_receipt {
    return Intl.message(
      'Confirm Receipt',
      name: 'confirm_receipt',
      desc: '',
      args: [],
    );
  }

  /// `Report Payment Issue`
  String get report_payment_issue {
    return Intl.message(
      'Report Payment Issue',
      name: 'report_payment_issue',
      desc: '',
      args: [],
    );
  }

  /// `Submit Corrected Evidence`
  String get submit_corrected_evidence {
    return Intl.message(
      'Submit Corrected Evidence',
      name: 'submit_corrected_evidence',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get payment_method {
    return Intl.message(
      'Payment Method',
      name: 'payment_method',
      desc: '',
      args: [],
    );
  }

  /// `Payment Date`
  String get payment_date {
    return Intl.message(
      'Payment Date',
      name: 'payment_date',
      desc: '',
      args: [],
    );
  }

  /// `Transaction Reference`
  String get transaction_reference {
    return Intl.message(
      'Transaction Reference',
      name: 'transaction_reference',
      desc: '',
      args: [],
    );
  }

  /// `Payment Notes`
  String get payment_notes {
    return Intl.message(
      'Payment Notes',
      name: 'payment_notes',
      desc: '',
      args: [],
    );
  }

  /// `Payment Amount`
  String get payment_amount {
    return Intl.message(
      'Payment Amount',
      name: 'payment_amount',
      desc: '',
      args: [],
    );
  }

  /// `Payment Receipts`
  String get payment_receipts {
    return Intl.message(
      'Payment Receipts',
      name: 'payment_receipts',
      desc: '',
      args: [],
    );
  }

  /// `This milestone payment is on hold due to an active dispute.`
  String get dispute_hold_notice {
    return Intl.message(
      'This milestone payment is on hold due to an active dispute.',
      name: 'dispute_hold_notice',
      desc: '',
      args: [],
    );
  }

  /// `Payment Summary`
  String get project_payment_summary {
    return Intl.message(
      'Payment Summary',
      name: 'project_payment_summary',
      desc: '',
      args: [],
    );
  }

  /// `Approved Project Value`
  String get approved_project_value {
    return Intl.message(
      'Approved Project Value',
      name: 'approved_project_value',
      desc: '',
      args: [],
    );
  }

  /// `Total Paid`
  String get total_paid {
    return Intl.message('Total Paid', name: 'total_paid', desc: '', args: []);
  }

  /// `Total Unpaid`
  String get total_unpaid {
    return Intl.message(
      'Total Unpaid',
      name: 'total_unpaid',
      desc: '',
      args: [],
    );
  }

  /// `Amount Eligible`
  String get amount_eligible {
    return Intl.message(
      'Amount Eligible',
      name: 'amount_eligible',
      desc: '',
      args: [],
    );
  }

  /// `Awaiting Confirmation`
  String get amount_awaiting_confirmation {
    return Intl.message(
      'Awaiting Confirmation',
      name: 'amount_awaiting_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Amount With Issues`
  String get amount_with_issues {
    return Intl.message(
      'Amount With Issues',
      name: 'amount_with_issues',
      desc: '',
      args: [],
    );
  }

  /// `Amount on Dispute Hold`
  String get amount_on_dispute_hold {
    return Intl.message(
      'Amount on Dispute Hold',
      name: 'amount_on_dispute_hold',
      desc: '',
      args: [],
    );
  }

  /// `Meethaq is an informational tracking ledger and does not hold, escrow, or transmit funds.`
  String get non_custodial_disclaimer {
    return Intl.message(
      'Meethaq is an informational tracking ledger and does not hold, escrow, or transmit funds.',
      name: 'non_custodial_disclaimer',
      desc: '',
      args: [],
    );
  }

  /// `Change Requests`
  String get change_requests {
    return Intl.message(
      'Change Requests',
      name: 'change_requests',
      desc: '',
      args: [],
    );
  }

  /// `New Change Request`
  String get new_change_request {
    return Intl.message(
      'New Change Request',
      name: 'new_change_request',
      desc: '',
      args: [],
    );
  }

  /// `Change Request Title`
  String get change_request_title {
    return Intl.message(
      'Change Request Title',
      name: 'change_request_title',
      desc: '',
      args: [],
    );
  }

  /// `Reason for Change`
  String get change_request_reason {
    return Intl.message(
      'Reason for Change',
      name: 'change_request_reason',
      desc: '',
      args: [],
    );
  }

  /// `Scope Description`
  String get scope_description {
    return Intl.message(
      'Scope Description',
      name: 'scope_description',
      desc: '',
      args: [],
    );
  }

  /// `Proposed Project Value`
  String get proposed_project_value {
    return Intl.message(
      'Proposed Project Value',
      name: 'proposed_project_value',
      desc: '',
      args: [],
    );
  }

  /// `Current Project Value`
  String get current_project_value {
    return Intl.message(
      'Current Project Value',
      name: 'current_project_value',
      desc: '',
      args: [],
    );
  }

  /// `Approve Change Request`
  String get approve_change_request {
    return Intl.message(
      'Approve Change Request',
      name: 'approve_change_request',
      desc: '',
      args: [],
    );
  }

  /// `Reject Change Request`
  String get reject_change_request {
    return Intl.message(
      'Reject Change Request',
      name: 'reject_change_request',
      desc: '',
      args: [],
    );
  }

  /// `Withdraw`
  String get withdraw_change_request {
    return Intl.message(
      'Withdraw',
      name: 'withdraw_change_request',
      desc: '',
      args: [],
    );
  }

  /// `Draft`
  String get cr_status_draft {
    return Intl.message('Draft', name: 'cr_status_draft', desc: '', args: []);
  }

  /// `Pending Approval`
  String get cr_status_pending_approval {
    return Intl.message(
      'Pending Approval',
      name: 'cr_status_pending_approval',
      desc: '',
      args: [],
    );
  }

  /// `Approved`
  String get cr_status_approved {
    return Intl.message(
      'Approved',
      name: 'cr_status_approved',
      desc: '',
      args: [],
    );
  }

  /// `Rejected`
  String get cr_status_rejected {
    return Intl.message(
      'Rejected',
      name: 'cr_status_rejected',
      desc: '',
      args: [],
    );
  }

  /// `Withdrawn`
  String get cr_status_withdrawn {
    return Intl.message(
      'Withdrawn',
      name: 'cr_status_withdrawn',
      desc: '',
      args: [],
    );
  }

  /// `Contract Amendments`
  String get contract_amendments {
    return Intl.message(
      'Contract Amendments',
      name: 'contract_amendments',
      desc: '',
      args: [],
    );
  }

  /// `Amendment #{number}`
  String amendment_number(Object number) {
    return Intl.message(
      'Amendment #$number',
      name: 'amendment_number',
      desc: '',
      args: [number],
    );
  }

  /// `Effective Agreement`
  String get effective_contract {
    return Intl.message(
      'Effective Agreement',
      name: 'effective_contract',
      desc: '',
      args: [],
    );
  }

  /// `View Effective Agreement`
  String get view_effective_agreement {
    return Intl.message(
      'View Effective Agreement',
      name: 'view_effective_agreement',
      desc: '',
      args: [],
    );
  }

  /// `Only one change request may be pending approval at a time.`
  String get single_pending_cr_error {
    return Intl.message(
      'Only one change request may be pending approval at a time.',
      name: 'single_pending_cr_error',
      desc: '',
      args: [],
    );
  }

  /// `Disputes`
  String get disputes {
    return Intl.message('Disputes', name: 'disputes', desc: '', args: []);
  }

  /// `Open Dispute`
  String get open_dispute {
    return Intl.message(
      'Open Dispute',
      name: 'open_dispute',
      desc: '',
      args: [],
    );
  }

  /// `Dispute Category`
  String get dispute_category {
    return Intl.message(
      'Dispute Category',
      name: 'dispute_category',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get dispute_description {
    return Intl.message(
      'Description',
      name: 'dispute_description',
      desc: '',
      args: [],
    );
  }

  /// `Requested Resolution`
  String get requested_resolution {
    return Intl.message(
      'Requested Resolution',
      name: 'requested_resolution',
      desc: '',
      args: [],
    );
  }

  /// `Deliverable Quality`
  String get dispute_category_deliverable_quality {
    return Intl.message(
      'Deliverable Quality',
      name: 'dispute_category_deliverable_quality',
      desc: '',
      args: [],
    );
  }

  /// `Scope Disagreement`
  String get dispute_category_scope_disagreement {
    return Intl.message(
      'Scope Disagreement',
      name: 'dispute_category_scope_disagreement',
      desc: '',
      args: [],
    );
  }

  /// `Missed Deadline`
  String get dispute_category_missed_deadline {
    return Intl.message(
      'Missed Deadline',
      name: 'dispute_category_missed_deadline',
      desc: '',
      args: [],
    );
  }

  /// `Acceptance Disagreement`
  String get dispute_category_acceptance_disagreement {
    return Intl.message(
      'Acceptance Disagreement',
      name: 'dispute_category_acceptance_disagreement',
      desc: '',
      args: [],
    );
  }

  /// `Payment Issue`
  String get dispute_category_payment_issue {
    return Intl.message(
      'Payment Issue',
      name: 'dispute_category_payment_issue',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get dispute_category_other {
    return Intl.message(
      'Other',
      name: 'dispute_category_other',
      desc: '',
      args: [],
    );
  }

  /// `Open Dispute`
  String get dispute_status_open {
    return Intl.message(
      'Open Dispute',
      name: 'dispute_status_open',
      desc: '',
      args: [],
    );
  }

  /// `Resolution Proposed`
  String get dispute_status_resolution_proposed {
    return Intl.message(
      'Resolution Proposed',
      name: 'dispute_status_resolution_proposed',
      desc: '',
      args: [],
    );
  }

  /// `Resolved`
  String get dispute_status_resolved {
    return Intl.message(
      'Resolved',
      name: 'dispute_status_resolved',
      desc: '',
      args: [],
    );
  }

  /// `Evidence Package`
  String get evidence_package {
    return Intl.message(
      'Evidence Package',
      name: 'evidence_package',
      desc: '',
      args: [],
    );
  }

  /// `Export Package`
  String get export_evidence_package {
    return Intl.message(
      'Export Package',
      name: 'export_evidence_package',
      desc: '',
      args: [],
    );
  }

  /// `Propose Resolution`
  String get propose_resolution {
    return Intl.message(
      'Propose Resolution',
      name: 'propose_resolution',
      desc: '',
      args: [],
    );
  }

  /// `Accept Resolution`
  String get accept_resolution {
    return Intl.message(
      'Accept Resolution',
      name: 'accept_resolution',
      desc: '',
      args: [],
    );
  }

  /// `Reject Resolution`
  String get reject_resolution {
    return Intl.message(
      'Reject Resolution',
      name: 'reject_resolution',
      desc: '',
      args: [],
    );
  }

  /// `Proposed Resolution Terms`
  String get proposed_terms {
    return Intl.message(
      'Proposed Resolution Terms',
      name: 'proposed_terms',
      desc: '',
      args: [],
    );
  }

  /// `Disputed`
  String get disputed_milestone_badge {
    return Intl.message(
      'Disputed',
      name: 'disputed_milestone_badge',
      desc: '',
      args: [],
    );
  }

  /// `Project Completion`
  String get project_completion {
    return Intl.message(
      'Project Completion',
      name: 'project_completion',
      desc: '',
      args: [],
    );
  }

  /// `Complete Project`
  String get complete_project {
    return Intl.message(
      'Complete Project',
      name: 'complete_project',
      desc: '',
      args: [],
    );
  }

  /// `Completion Checklist`
  String get completion_checklist {
    return Intl.message(
      'Completion Checklist',
      name: 'completion_checklist',
      desc: '',
      args: [],
    );
  }

  /// `Ready for Completion`
  String get completion_eligible {
    return Intl.message(
      'Ready for Completion',
      name: 'completion_eligible',
      desc: '',
      args: [],
    );
  }

  /// `All milestones must be accepted`
  String get all_milestones_must_be_accepted {
    return Intl.message(
      'All milestones must be accepted',
      name: 'all_milestones_must_be_accepted',
      desc: '',
      args: [],
    );
  }

  /// `All milestone payments must be paid`
  String get all_payments_must_be_paid {
    return Intl.message(
      'All milestone payments must be paid',
      name: 'all_payments_must_be_paid',
      desc: '',
      args: [],
    );
  }

  /// `No open disputes permitted`
  String get zero_open_disputes_required {
    return Intl.message(
      'No open disputes permitted',
      name: 'zero_open_disputes_required',
      desc: '',
      args: [],
    );
  }

  /// `No pending change requests permitted`
  String get zero_pending_change_requests_required {
    return Intl.message(
      'No pending change requests permitted',
      name: 'zero_pending_change_requests_required',
      desc: '',
      args: [],
    );
  }

  /// `Project successfully completed!`
  String get project_completed_success {
    return Intl.message(
      'Project successfully completed!',
      name: 'project_completed_success',
      desc: '',
      args: [],
    );
  }

  /// `Milestone Payment`
  String get milestone_payment {
    return Intl.message(
      'Milestone Payment',
      name: 'milestone_payment',
      desc: '',
      args: [],
    );
  }

  /// `Currency`
  String get currency {
    return Intl.message('Currency', name: 'currency', desc: '', args: []);
  }

  /// `e.g. TRX-902188`
  String get transaction_reference_hint {
    return Intl.message(
      'e.g. TRX-902188',
      name: 'transaction_reference_hint',
      desc: '',
      args: [],
    );
  }

  /// `Optional notes for the freelancer...`
  String get payment_notes_hint {
    return Intl.message(
      'Optional notes for the freelancer...',
      name: 'payment_notes_hint',
      desc: '',
      args: [],
    );
  }

  /// `Add File`
  String get add_file {
    return Intl.message('Add File', name: 'add_file', desc: '', args: []);
  }

  /// `Correction History`
  String get correction_history {
    return Intl.message(
      'Correction History',
      name: 'correction_history',
      desc: '',
      args: [],
    );
  }

  /// `Payment Evidence / Receipts`
  String get payment_evidence_receipts {
    return Intl.message(
      'Payment Evidence / Receipts',
      name: 'payment_evidence_receipts',
      desc: '',
      args: [],
    );
  }

  /// `Bank Transfer`
  String get payment_method_bank_transfer {
    return Intl.message(
      'Bank Transfer',
      name: 'payment_method_bank_transfer',
      desc: '',
      args: [],
    );
  }

  /// `Instapay`
  String get payment_method_instapay {
    return Intl.message(
      'Instapay',
      name: 'payment_method_instapay',
      desc: '',
      args: [],
    );
  }

  /// `STC Pay`
  String get payment_method_stc_pay {
    return Intl.message(
      'STC Pay',
      name: 'payment_method_stc_pay',
      desc: '',
      args: [],
    );
  }

  /// `Cash`
  String get payment_method_cash {
    return Intl.message(
      'Cash',
      name: 'payment_method_cash',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get payment_method_other {
    return Intl.message(
      'Other',
      name: 'payment_method_other',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid amount`
  String get enter_valid_amount {
    return Intl.message(
      'Enter a valid amount',
      name: 'enter_valid_amount',
      desc: '',
      args: [],
    );
  }

  /// `3-letter code`
  String get currency_three_letter_code {
    return Intl.message(
      '3-letter code',
      name: 'currency_three_letter_code',
      desc: '',
      args: [],
    );
  }

  /// `Provide an updated reference, notes, or at least one corrected receipt file.`
  String get correction_requires_evidence {
    return Intl.message(
      'Provide an updated reference, notes, or at least one corrected receipt file.',
      name: 'correction_requires_evidence',
      desc: '',
      args: [],
    );
  }

  /// `Please provide either a transaction reference or at least one receipt file.`
  String get payment_requires_reference_or_file {
    return Intl.message(
      'Please provide either a transaction reference or at least one receipt file.',
      name: 'payment_requires_reference_or_file',
      desc: '',
      args: [],
    );
  }

  /// `Unable to open the file. Please try again.`
  String get unable_to_open_file {
    return Intl.message(
      'Unable to open the file. Please try again.',
      name: 'unable_to_open_file',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back, {name}`
  String welcome_back(Object name) {
    return Intl.message(
      'Welcome back, $name',
      name: 'welcome_back',
      desc: '',
      args: [name],
    );
  }

  /// `Needs Your Attention`
  String get needs_your_attention {
    return Intl.message(
      'Needs Your Attention',
      name: 'needs_your_attention',
      desc: '',
      args: [],
    );
  }

  /// `Financial Overview`
  String get financial_overview {
    return Intl.message(
      'Financial Overview',
      name: 'financial_overview',
      desc: '',
      args: [],
    );
  }

  /// `Financial Trend`
  String get financial_trend {
    return Intl.message(
      'Financial Trend',
      name: 'financial_trend',
      desc: '',
      args: [],
    );
  }

  /// `Project Overview`
  String get project_overview {
    return Intl.message(
      'Project Overview',
      name: 'project_overview',
      desc: '',
      args: [],
    );
  }

  /// `Deliverables Awaiting Review`
  String get deliverables_awaiting_review {
    return Intl.message(
      'Deliverables Awaiting Review',
      name: 'deliverables_awaiting_review',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming Milestones`
  String get upcoming_milestones {
    return Intl.message(
      'Upcoming Milestones',
      name: 'upcoming_milestones',
      desc: '',
      args: [],
    );
  }

  /// `Client Overview`
  String get client_overview {
    return Intl.message(
      'Client Overview',
      name: 'client_overview',
      desc: '',
      args: [],
    );
  }

  /// `Freelancers Overview`
  String get freelancers_overview {
    return Intl.message(
      'Freelancers Overview',
      name: 'freelancers_overview',
      desc: '',
      args: [],
    );
  }

  /// `Contracts & Change Requests`
  String get contracts_and_change_requests {
    return Intl.message(
      'Contracts & Change Requests',
      name: 'contracts_and_change_requests',
      desc: '',
      args: [],
    );
  }

  /// `Disputes`
  String get disputes_summary {
    return Intl.message(
      'Disputes',
      name: 'disputes_summary',
      desc: '',
      args: [],
    );
  }

  /// `Recent Messages`
  String get recent_messages {
    return Intl.message(
      'Recent Messages',
      name: 'recent_messages',
      desc: '',
      args: [],
    );
  }

  /// `Recent Activity`
  String get recent_activity {
    return Intl.message(
      'Recent Activity',
      name: 'recent_activity',
      desc: '',
      args: [],
    );
  }

  /// `Your Action Required`
  String get your_action_required {
    return Intl.message(
      'Your Action Required',
      name: 'your_action_required',
      desc: '',
      args: [],
    );
  }

  /// `Waiting for Client`
  String get waiting_for_client {
    return Intl.message(
      'Waiting for Client',
      name: 'waiting_for_client',
      desc: '',
      args: [],
    );
  }

  /// `Waiting for Freelancer`
  String get waiting_for_freelancer {
    return Intl.message(
      'Waiting for Freelancer',
      name: 'waiting_for_freelancer',
      desc: '',
      args: [],
    );
  }

  /// `All caught up! No urgent actions require your attention.`
  String get all_caught_up {
    return Intl.message(
      'All caught up! No urgent actions require your attention.',
      name: 'all_caught_up',
      desc: '',
      args: [],
    );
  }

  /// `Next 7 Days`
  String get filter_next_7_days {
    return Intl.message(
      'Next 7 Days',
      name: 'filter_next_7_days',
      desc: '',
      args: [],
    );
  }

  /// `Next 30 Days`
  String get filter_next_30_days {
    return Intl.message(
      'Next 30 Days',
      name: 'filter_next_30_days',
      desc: '',
      args: [],
    );
  }

  /// `Overdue`
  String get filter_overdue {
    return Intl.message('Overdue', name: 'filter_overdue', desc: '', args: []);
  }

  /// `Late Submission`
  String get late_freelancer_submission {
    return Intl.message(
      'Late Submission',
      name: 'late_freelancer_submission',
      desc: '',
      args: [],
    );
  }

  /// `Client Review Overdue`
  String get overdue_client_review {
    return Intl.message(
      'Client Review Overdue',
      name: 'overdue_client_review',
      desc: '',
      args: [],
    );
  }

  /// `Total Income Received`
  String get total_income_received {
    return Intl.message(
      'Total Income Received',
      name: 'total_income_received',
      desc: '',
      args: [],
    );
  }

  /// `Received This Month`
  String get income_received_this_month {
    return Intl.message(
      'Received This Month',
      name: 'income_received_this_month',
      desc: '',
      args: [],
    );
  }

  /// `Total Confirmed Payments`
  String get total_confirmed_payments {
    return Intl.message(
      'Total Confirmed Payments',
      name: 'total_confirmed_payments',
      desc: '',
      args: [],
    );
  }

  /// `Confirmed This Month`
  String get confirmed_payments_this_month {
    return Intl.message(
      'Confirmed This Month',
      name: 'confirmed_payments_this_month',
      desc: '',
      args: [],
    );
  }

  /// `Accepted Work Value`
  String get accepted_work_value {
    return Intl.message(
      'Accepted Work Value',
      name: 'accepted_work_value',
      desc: '',
      args: [],
    );
  }

  /// `Total Unpaid Value`
  String get total_unpaid_value {
    return Intl.message(
      'Total Unpaid Value',
      name: 'total_unpaid_value',
      desc: '',
      args: [],
    );
  }

  /// `Ready for Client Payment`
  String get ready_for_client_payment {
    return Intl.message(
      'Ready for Client Payment',
      name: 'ready_for_client_payment',
      desc: '',
      args: [],
    );
  }

  /// `Ready for Payment`
  String get ready_for_payment {
    return Intl.message(
      'Ready for Payment',
      name: 'ready_for_payment',
      desc: '',
      args: [],
    );
  }

  /// `Awaiting Confirmation`
  String get awaiting_receipt_confirmation {
    return Intl.message(
      'Awaiting Confirmation',
      name: 'awaiting_receipt_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Awaiting Confirmation`
  String get awaiting_freelancer_confirmation {
    return Intl.message(
      'Awaiting Confirmation',
      name: 'awaiting_freelancer_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Payment Issues`
  String get payment_issues {
    return Intl.message(
      'Payment Issues',
      name: 'payment_issues',
      desc: '',
      args: [],
    );
  }

  /// `On Dispute Hold`
  String get on_dispute_hold {
    return Intl.message(
      'On Dispute Hold',
      name: 'on_dispute_hold',
      desc: '',
      args: [],
    );
  }

  /// `Not Yet Eligible`
  String get not_yet_eligible {
    return Intl.message(
      'Not Yet Eligible',
      name: 'not_yet_eligible',
      desc: '',
      args: [],
    );
  }

  /// `Future Milestone Value`
  String get future_milestone_value {
    return Intl.message(
      'Future Milestone Value',
      name: 'future_milestone_value',
      desc: '',
      args: [],
    );
  }

  /// `6 Months`
  String get trend_months_6 {
    return Intl.message('6 Months', name: 'trend_months_6', desc: '', args: []);
  }

  /// `12 Months`
  String get trend_months_12 {
    return Intl.message(
      '12 Months',
      name: 'trend_months_12',
      desc: '',
      args: [],
    );
  }

  /// `Table View`
  String get table_view {
    return Intl.message('Table View', name: 'table_view', desc: '', args: []);
  }

  /// `Chart View`
  String get chart_view {
    return Intl.message('Chart View', name: 'chart_view', desc: '', args: []);
  }

  /// `Metric Definition`
  String get metric_definition {
    return Intl.message(
      'Metric Definition',
      name: 'metric_definition',
      desc: '',
      args: [],
    );
  }

  /// `Updated: {time}`
  String last_updated_at(Object time) {
    return Intl.message(
      'Updated: $time',
      name: 'last_updated_at',
      desc: '',
      args: [time],
    );
  }

  /// `Offline: Displaying previously saved data.`
  String get data_is_stale {
    return Intl.message(
      'Offline: Displaying previously saved data.',
      name: 'data_is_stale',
      desc: '',
      args: [],
    );
  }

  /// `Unable to load section.`
  String get failed_to_load_section {
    return Intl.message(
      'Unable to load section.',
      name: 'failed_to_load_section',
      desc: '',
      args: [],
    );
  }

  /// `Tap to retry`
  String get tap_to_retry {
    return Intl.message(
      'Tap to retry',
      name: 'tap_to_retry',
      desc: '',
      args: [],
    );
  }

  /// `Onboarding Progress`
  String get onboarding_progression {
    return Intl.message(
      'Onboarding Progress',
      name: 'onboarding_progression',
      desc: '',
      args: [],
    );
  }

  /// `Add Client`
  String get step_add_client {
    return Intl.message(
      'Add Client',
      name: 'step_add_client',
      desc: '',
      args: [],
    );
  }

  /// `Create Project`
  String get step_create_project {
    return Intl.message(
      'Create Project',
      name: 'step_create_project',
      desc: '',
      args: [],
    );
  }

  /// `Prepare Contract`
  String get step_prepare_contract {
    return Intl.message(
      'Prepare Contract',
      name: 'step_prepare_contract',
      desc: '',
      args: [],
    );
  }

  /// `Send for Client Approval`
  String get step_send_for_approval {
    return Intl.message(
      'Send for Client Approval',
      name: 'step_send_for_approval',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Meethaq! When you are invited to projects or collaborations start, they will appear here.`
  String get client_first_use_guidance {
    return Intl.message(
      'Welcome to Meethaq! When you are invited to projects or collaborations start, they will appear here.',
      name: 'client_first_use_guidance',
      desc: '',
      args: [],
    );
  }

  /// `{accepted} of {total} Milestones Accepted`
  String accepted_milestones_ratio(Object accepted, Object total) {
    return Intl.message(
      '$accepted of $total Milestones Accepted',
      name: 'accepted_milestones_ratio',
      desc: '',
      args: [accepted, total],
    );
  }

  /// `View All`
  String get view_all {
    return Intl.message('View All', name: 'view_all', desc: '', args: []);
  }

  /// `No activity recorded yet`
  String get no_activity_recorded {
    return Intl.message(
      'No activity recorded yet',
      name: 'no_activity_recorded',
      desc: '',
      args: [],
    );
  }

  /// `Load more`
  String get load_more {
    return Intl.message('Load more', name: 'load_more', desc: '', args: []);
  }

  /// `By: {actor}`
  String by_actor(String actor) {
    return Intl.message(
      'By: $actor',
      name: 'by_actor',
      desc: '',
      args: [actor],
    );
  }

  /// `Requests`
  String get requests_tab {
    return Intl.message('Requests', name: 'requests_tab', desc: '', args: []);
  }

  /// `Pending`
  String get pending_tab {
    return Intl.message('Pending', name: 'pending_tab', desc: '', args: []);
  }

  /// `Approved`
  String get approved_tab {
    return Intl.message('Approved', name: 'approved_tab', desc: '', args: []);
  }

  /// `Closed`
  String get closed_tab {
    return Intl.message('Closed', name: 'closed_tab', desc: '', args: []);
  }

  /// `Change Request Details`
  String get change_request_details {
    return Intl.message(
      'Change Request Details',
      name: 'change_request_details',
      desc: '',
      args: [],
    );
  }

  /// `Provide reason for rejection...`
  String get provide_rejection_reason {
    return Intl.message(
      'Provide reason for rejection...',
      name: 'provide_rejection_reason',
      desc: '',
      args: [],
    );
  }

  /// `Reason: {reason}`
  String reason_label(String reason) {
    return Intl.message(
      'Reason: $reason',
      name: 'reason_label',
      desc: '',
      args: [reason],
    );
  }

  /// `Scope: {scope}`
  String scope_label(String scope) {
    return Intl.message(
      'Scope: $scope',
      name: 'scope_label',
      desc: '',
      args: [scope],
    );
  }

  /// `No change requests`
  String get no_change_requests {
    return Intl.message(
      'No change requests',
      name: 'no_change_requests',
      desc: '',
      args: [],
    );
  }

  /// `No amendments have been ratified yet.`
  String get no_amendments_ratified {
    return Intl.message(
      'No amendments have been ratified yet.',
      name: 'no_amendments_ratified',
      desc: '',
      args: [],
    );
  }

  /// `Submit Change Request`
  String get submit_change_request {
    return Intl.message(
      'Submit Change Request',
      name: 'submit_change_request',
      desc: '',
      args: [],
    );
  }

  /// `Proposed Milestones`
  String get proposed_milestones {
    return Intl.message(
      'Proposed Milestones',
      name: 'proposed_milestones',
      desc: '',
      args: [],
    );
  }

  /// `Proposed Milestone Terms`
  String get proposed_milestone_terms {
    return Intl.message(
      'Proposed Milestone Terms',
      name: 'proposed_milestone_terms',
      desc: '',
      args: [],
    );
  }

  /// `Resulting Value`
  String get resulting_value {
    return Intl.message(
      'Resulting Value',
      name: 'resulting_value',
      desc: '',
      args: [],
    );
  }

  /// `Effective Date`
  String get effective_date {
    return Intl.message(
      'Effective Date',
      name: 'effective_date',
      desc: '',
      args: [],
    );
  }

  /// `Approved Date`
  String get approved_date {
    return Intl.message(
      'Approved Date',
      name: 'approved_date',
      desc: '',
      args: [],
    );
  }

  /// `Ratified`
  String get ratified {
    return Intl.message('Ratified', name: 'ratified', desc: '', args: []);
  }

  /// `Current Value`
  String get current_value {
    return Intl.message(
      'Current Value',
      name: 'current_value',
      desc: '',
      args: [],
    );
  }

  /// `Proposed Value`
  String get proposed_value {
    return Intl.message(
      'Proposed Value',
      name: 'proposed_value',
      desc: '',
      args: [],
    );
  }

  /// `NEW`
  String get new_badge {
    return Intl.message('NEW', name: 'new_badge', desc: '', args: []);
  }

  /// `Deliverable: {value}`
  String deliverable_label(String value) {
    return Intl.message(
      'Deliverable: $value',
      name: 'deliverable_label',
      desc: '',
      args: [value],
    );
  }

  /// `Criteria: {value}`
  String criteria_label(String value) {
    return Intl.message(
      'Criteria: $value',
      name: 'criteria_label',
      desc: '',
      args: [value],
    );
  }

  /// `Due: {date}`
  String due_label(String date) {
    return Intl.message(
      'Due: $date',
      name: 'due_label',
      desc: '',
      args: [date],
    );
  }

  /// `Amendment #{number}`
  String amendment_number_prefix(int number) {
    return Intl.message(
      'Amendment #$number',
      name: 'amendment_number_prefix',
      desc: '',
      args: [number],
    );
  }

  /// `No active projects`
  String get no_active_projects {
    return Intl.message(
      'No active projects',
      name: 'no_active_projects',
      desc: '',
      args: [],
    );
  }

  /// `Add Evidence`
  String get add_evidence {
    return Intl.message(
      'Add Evidence',
      name: 'add_evidence',
      desc: '',
      args: [],
    );
  }

  /// `Describe this evidence (min 5 characters)...`
  String get describe_evidence_hint {
    return Intl.message(
      'Describe this evidence (min 5 characters)...',
      name: 'describe_evidence_hint',
      desc: '',
      args: [],
    );
  }

  /// `Next: pick file`
  String get next_pick_file {
    return Intl.message(
      'Next: pick file',
      name: 'next_pick_file',
      desc: '',
      args: [],
    );
  }

  /// `Enter proposed resolution terms (min 10 characters)...`
  String get proposed_resolution_hint {
    return Intl.message(
      'Enter proposed resolution terms (min 10 characters)...',
      name: 'proposed_resolution_hint',
      desc: '',
      args: [],
    );
  }

  /// `Dispute not found.`
  String get dispute_not_found {
    return Intl.message(
      'Dispute not found.',
      name: 'dispute_not_found',
      desc: '',
      args: [],
    );
  }

  /// `No resolution proposals have been submitted yet.`
  String get no_resolution_proposals {
    return Intl.message(
      'No resolution proposals have been submitted yet.',
      name: 'no_resolution_proposals',
      desc: '',
      args: [],
    );
  }

  /// `No supplementary evidence uploaded.`
  String get no_supplementary_evidence {
    return Intl.message(
      'No supplementary evidence uploaded.',
      name: 'no_supplementary_evidence',
      desc: '',
      args: [],
    );
  }

  /// `Withdraw Dispute`
  String get withdraw_dispute {
    return Intl.message(
      'Withdraw Dispute',
      name: 'withdraw_dispute',
      desc: '',
      args: [],
    );
  }

  /// `Resolution Proposals`
  String get resolution_proposals {
    return Intl.message(
      'Resolution Proposals',
      name: 'resolution_proposals',
      desc: '',
      args: [],
    );
  }

  /// `No evidence package data available.`
  String get no_evidence_package {
    return Intl.message(
      'No evidence package data available.',
      name: 'no_evidence_package',
      desc: '',
      args: [],
    );
  }

  /// `Contract & Criteria`
  String get tab_contract_criteria {
    return Intl.message(
      'Contract & Criteria',
      name: 'tab_contract_criteria',
      desc: '',
      args: [],
    );
  }

  /// `Submissions`
  String get tab_submissions {
    return Intl.message(
      'Submissions',
      name: 'tab_submissions',
      desc: '',
      args: [],
    );
  }

  /// `Payment Evidence`
  String get tab_payment_evidence {
    return Intl.message(
      'Payment Evidence',
      name: 'tab_payment_evidence',
      desc: '',
      args: [],
    );
  }

  /// `Dispute Evidence`
  String get tab_dispute_evidence {
    return Intl.message(
      'Dispute Evidence',
      name: 'tab_dispute_evidence',
      desc: '',
      args: [],
    );
  }

  /// `Contract Terms`
  String get contract_terms_header {
    return Intl.message(
      'Contract Terms',
      name: 'contract_terms_header',
      desc: '',
      args: [],
    );
  }

  /// `No contract terms summary available.`
  String get no_contract_terms {
    return Intl.message(
      'No contract terms summary available.',
      name: 'no_contract_terms',
      desc: '',
      args: [],
    );
  }

  /// `Detail the nature of the disagreement (min 10 characters)...`
  String get dispute_description_hint {
    return Intl.message(
      'Detail the nature of the disagreement (min 10 characters)...',
      name: 'dispute_description_hint',
      desc: '',
      args: [],
    );
  }

  /// `What outcome or fix are you requesting? (min 10 characters)...`
  String get resolution_request_hint {
    return Intl.message(
      'What outcome or fix are you requesting? (min 10 characters)...',
      name: 'resolution_request_hint',
      desc: '',
      args: [],
    );
  }

  /// `Evidence Attachments (Optional)`
  String get evidence_attachments_optional {
    return Intl.message(
      'Evidence Attachments (Optional)',
      name: 'evidence_attachments_optional',
      desc: '',
      args: [],
    );
  }

  /// `Enter reason for rejecting this resolution proposal...`
  String get rejection_reason_hint {
    return Intl.message(
      'Enter reason for rejecting this resolution proposal...',
      name: 'rejection_reason_hint',
      desc: '',
      args: [],
    );
  }

  /// `Reject`
  String get reject {
    return Intl.message('Reject', name: 'reject', desc: '', args: []);
  }

  /// `Pending`
  String get pending_status {
    return Intl.message('Pending', name: 'pending_status', desc: '', args: []);
  }

  /// `Milestone Details`
  String get milestone_details {
    return Intl.message(
      'Milestone Details',
      name: 'milestone_details',
      desc: '',
      args: [],
    );
  }

  /// `Review Deliverable`
  String get review_deliverable {
    return Intl.message(
      'Review Deliverable',
      name: 'review_deliverable',
      desc: '',
      args: [],
    );
  }

  /// `Add an optional note to the freelancer...`
  String get acceptance_note_hint {
    return Intl.message(
      'Add an optional note to the freelancer...',
      name: 'acceptance_note_hint',
      desc: '',
      args: [],
    );
  }

  /// `Add Files`
  String get add_files {
    return Intl.message('Add Files', name: 'add_files', desc: '', args: []);
  }

  /// `No evidence files attached yet.`
  String get no_evidence_files {
    return Intl.message(
      'No evidence files attached yet.',
      name: 'no_evidence_files',
      desc: '',
      args: [],
    );
  }

  /// `e.g. Figma Prototype, Staging URL`
  String get evidence_link_hint {
    return Intl.message(
      'e.g. Figma Prototype, Staging URL',
      name: 'evidence_link_hint',
      desc: '',
      args: [],
    );
  }

  /// `e.g. Design does not match acceptance criteria`
  String get revision_reason_hint {
    return Intl.message(
      'e.g. Design does not match acceptance criteria',
      name: 'revision_reason_hint',
      desc: '',
      args: [],
    );
  }

  /// `e.g. Add mobile responsive views for tablet and phone`
  String get required_changes_hint {
    return Intl.message(
      'e.g. Add mobile responsive views for tablet and phone',
      name: 'required_changes_hint',
      desc: '',
      args: [],
    );
  }

  /// `No milestones found.`
  String get no_milestones_found {
    return Intl.message(
      'No milestones found.',
      name: 'no_milestones_found',
      desc: '',
      args: [],
    );
  }

  /// `Milestone Payment Status`
  String get milestone_payment_status {
    return Intl.message(
      'Milestone Payment Status',
      name: 'milestone_payment_status',
      desc: '',
      args: [],
    );
  }

  /// `Describe the payment discrepancy or issue in detail...`
  String get payment_issue_hint {
    return Intl.message(
      'Describe the payment discrepancy or issue in detail...',
      name: 'payment_issue_hint',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to mark this project as complete? This action is irreversible and finalizes the project contract and milestones. The server will check that every requirement below is met before completing.`
  String get complete_project_confirm_body {
    return Intl.message(
      'Are you sure you want to mark this project as complete? This action is irreversible and finalizes the project contract and milestones. The server will check that every requirement below is met before completing.',
      name: 'complete_project_confirm_body',
      desc: '',
      args: [],
    );
  }

  /// `The server checks these when you confirm — this is a reminder, not a live status.`
  String get completion_server_check {
    return Intl.message(
      'The server checks these when you confirm — this is a reminder, not a live status.',
      name: 'completion_server_check',
      desc: '',
      args: [],
    );
  }

  /// `e.g. 5000`
  String get value_placeholder_hint {
    return Intl.message(
      'e.g. 5000',
      name: 'value_placeholder_hint',
      desc: '',
      args: [],
    );
  }

  /// `Approve`
  String get approve {
    return Intl.message('Approve', name: 'approve', desc: '', args: []);
  }

  /// `URL is required`
  String get url_required {
    return Intl.message(
      'URL is required',
      name: 'url_required',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid HTTP/HTTPS URL`
  String get invalid_url {
    return Intl.message(
      'Enter a valid HTTP/HTTPS URL',
      name: 'invalid_url',
      desc: '',
      args: [],
    );
  }

  /// `Reason for Rejection`
  String get reason_for_rejection {
    return Intl.message(
      'Reason for Rejection',
      name: 'reason_for_rejection',
      desc: '',
      args: [],
    );
  }

  /// `Waiting for the other party to review this proposal.`
  String get waiting_for_other_party_review {
    return Intl.message(
      'Waiting for the other party to review this proposal.',
      name: 'waiting_for_other_party_review',
      desc: '',
      args: [],
    );
  }

  /// `Payment recorded successfully.`
  String get payment_recorded_success {
    return Intl.message(
      'Payment recorded successfully.',
      name: 'payment_recorded_success',
      desc: '',
      args: [],
    );
  }

  /// `Payment receipt confirmed successfully.`
  String get payment_confirmed_success {
    return Intl.message(
      'Payment receipt confirmed successfully.',
      name: 'payment_confirmed_success',
      desc: '',
      args: [],
    );
  }

  /// `Payment issue reported.`
  String get payment_issue_reported {
    return Intl.message(
      'Payment issue reported.',
      name: 'payment_issue_reported',
      desc: '',
      args: [],
    );
  }

  /// `Corrected payment evidence submitted.`
  String get payment_evidence_submitted {
    return Intl.message(
      'Corrected payment evidence submitted.',
      name: 'payment_evidence_submitted',
      desc: '',
      args: [],
    );
  }

  /// `Dispute opened successfully. Operational hold applied.`
  String get dispute_opened_success {
    return Intl.message(
      'Dispute opened successfully. Operational hold applied.',
      name: 'dispute_opened_success',
      desc: '',
      args: [],
    );
  }

  /// `Evidence package exported successfully.`
  String get evidence_exported_success {
    return Intl.message(
      'Evidence package exported successfully.',
      name: 'evidence_exported_success',
      desc: '',
      args: [],
    );
  }

  /// `Change request submitted successfully.`
  String get change_request_submitted_success {
    return Intl.message(
      'Change request submitted successfully.',
      name: 'change_request_submitted_success',
      desc: '',
      args: [],
    );
  }

  /// `Change request approved. Contract amendment ratified.`
  String get change_request_approved_success {
    return Intl.message(
      'Change request approved. Contract amendment ratified.',
      name: 'change_request_approved_success',
      desc: '',
      args: [],
    );
  }

  /// `Change request rejected.`
  String get change_request_rejected_success {
    return Intl.message(
      'Change request rejected.',
      name: 'change_request_rejected_success',
      desc: '',
      args: [],
    );
  }

  /// `Change request withdrawn.`
  String get change_request_withdrawn_success {
    return Intl.message(
      'Change request withdrawn.',
      name: 'change_request_withdrawn_success',
      desc: '',
      args: [],
    );
  }

  /// `Action Center`
  String get action_center {
    return Intl.message(
      'Action Center',
      name: 'action_center',
      desc: '',
      args: [],
    );
  }

  /// `Total Confirmed Payments`
  String get totalConfirmedPayments {
    return Intl.message(
      'Total Confirmed Payments',
      name: 'totalConfirmedPayments',
      desc:
          'Financial metric card title for the total confirmed payments amount',
      args: [],
    );
  }

  /// `Confirmed This Month`
  String get confirmedPaymentsThisMonth {
    return Intl.message(
      'Confirmed This Month',
      name: 'confirmedPaymentsThisMonth',
      desc:
          'Financial metric card title for confirmed payments in the current month',
      args: [],
    );
  }

  /// `Approved Project Value`
  String get approvedProjectValue {
    return Intl.message(
      'Approved Project Value',
      name: 'approvedProjectValue',
      desc:
          'Financial metric card title for the total value of approved projects',
      args: [],
    );
  }

  /// `Total Unpaid Value`
  String get totalUnpaidValue {
    return Intl.message(
      'Total Unpaid Value',
      name: 'totalUnpaidValue',
      desc: 'Financial metric card title for the total unpaid amount',
      args: [],
    );
  }

  /// `Ready for Payment`
  String get readyForPayment {
    return Intl.message(
      'Ready for Payment',
      name: 'readyForPayment',
      desc: 'Financial metric card title for amounts ready to be paid',
      args: [],
    );
  }

  /// `Awaiting Confirmation`
  String get awaitingFreelancerConfirmation {
    return Intl.message(
      'Awaiting Confirmation',
      name: 'awaitingFreelancerConfirmation',
      desc:
          'Financial metric card title for payments awaiting freelancer confirmation',
      args: [],
    );
  }

  /// `Payment Issues`
  String get paymentIssues {
    return Intl.message(
      'Payment Issues',
      name: 'paymentIssues',
      desc: 'Financial metric card title for payments with issues',
      args: [],
    );
  }

  /// `On Dispute Hold`
  String get onDisputeHold {
    return Intl.message(
      'On Dispute Hold',
      name: 'onDisputeHold',
      desc: 'Financial metric card title for amounts held due to disputes',
      args: [],
    );
  }

  /// `Future Milestone Value`
  String get futureMilestoneValue {
    return Intl.message(
      'Future Milestone Value',
      name: 'futureMilestoneValue',
      desc:
          'Financial metric card title for the total value of future milestones',
      args: [],
    );
  }

  /// ``
  String get emptyGreeting {
    return Intl.message(
      '',
      name: 'emptyGreeting',
      desc: 'Empty fallback greeting when no welcome data is available',
      args: [],
    );
  }

  /// ``
  String get emptyUserName {
    return Intl.message(
      '',
      name: 'emptyUserName',
      desc: 'Empty fallback user name when no welcome data is available',
      args: [],
    );
  }

  /// ``
  String get emptyCurrency {
    return Intl.message(
      '',
      name: 'emptyCurrency',
      desc: 'Empty fallback currency code',
      args: [],
    );
  }

  /// ``
  String get emptyDefinitionTooltip {
    return Intl.message(
      '',
      name: 'emptyDefinitionTooltip',
      desc: 'Empty fallback tooltip text for metric definitions',
      args: [],
    );
  }

  /// ``
  String get emptyPeriodCurrency {
    return Intl.message(
      '',
      name: 'emptyPeriodCurrency',
      desc: 'Empty fallback currency code for financial trend period',
      args: [],
    );
  }

  /// ``
  String get emptyDisputeCurrency {
    return Intl.message(
      '',
      name: 'emptyDisputeCurrency',
      desc: 'Empty fallback currency code for dispute amounts',
      args: [],
    );
  }

  /// ``
  String get emptyGuidanceMessage {
    return Intl.message(
      '',
      name: 'emptyGuidanceMessage',
      desc: 'Empty fallback guidance message for first-use state',
      args: [],
    );
  }

  /// `Total Income Received`
  String get totalIncomeReceived {
    return Intl.message(
      'Total Income Received',
      name: 'totalIncomeReceived',
      desc: 'Freelancer financial metric card title for total income received',
      args: [],
    );
  }

  /// `Received This Month`
  String get incomeReceivedThisMonth {
    return Intl.message(
      'Received This Month',
      name: 'incomeReceivedThisMonth',
      desc:
          'Freelancer financial metric card title for income received in the current month',
      args: [],
    );
  }

  /// `Accepted Work Value`
  String get acceptedWorkValue {
    return Intl.message(
      'Accepted Work Value',
      name: 'acceptedWorkValue',
      desc:
          'Freelancer financial metric card title for total accepted work value',
      args: [],
    );
  }

  /// `Ready for Client Payment`
  String get readyForClientPayment {
    return Intl.message(
      'Ready for Client Payment',
      name: 'readyForClientPayment',
      desc:
          'Freelancer financial metric card title for amounts ready for client payment',
      args: [],
    );
  }

  /// `Awaiting Confirmation`
  String get awaitingReceiptConfirmation {
    return Intl.message(
      'Awaiting Confirmation',
      name: 'awaitingReceiptConfirmation',
      desc:
          'Freelancer financial metric card title for payments awaiting receipt confirmation',
      args: [],
    );
  }

  /// `Not Yet Eligible`
  String get notYetEligible {
    return Intl.message(
      'Not Yet Eligible',
      name: 'notYetEligible',
      desc:
          'Freelancer financial metric card title for amounts not yet eligible for payment',
      args: [],
    );
  }

  /// `Total value of all payments confirmed so far.`
  String get totalConfirmedPaymentsTooltip {
    return Intl.message(
      'Total value of all payments confirmed so far.',
      name: 'totalConfirmedPaymentsTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Payments confirmed during the current month.`
  String get confirmedPaymentsThisMonthTooltip {
    return Intl.message(
      'Payments confirmed during the current month.',
      name: 'confirmedPaymentsThisMonthTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Total agreed value of all approved projects.`
  String get approvedProjectValueTooltip {
    return Intl.message(
      'Total agreed value of all approved projects.',
      name: 'approvedProjectValueTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Total value that has not yet been paid.`
  String get totalUnpaidValueTooltip {
    return Intl.message(
      'Total value that has not yet been paid.',
      name: 'totalUnpaidValueTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Amounts approved and ready to be paid.`
  String get readyForPaymentTooltip {
    return Intl.message(
      'Amounts approved and ready to be paid.',
      name: 'readyForPaymentTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Payments waiting for freelancer confirmation.`
  String get awaitingFreelancerConfirmationTooltip {
    return Intl.message(
      'Payments waiting for freelancer confirmation.',
      name: 'awaitingFreelancerConfirmationTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Payments that encountered an issue and need attention.`
  String get paymentIssuesTooltip {
    return Intl.message(
      'Payments that encountered an issue and need attention.',
      name: 'paymentIssuesTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Amounts currently on hold due to an open dispute.`
  String get onDisputeHoldTooltip {
    return Intl.message(
      'Amounts currently on hold due to an open dispute.',
      name: 'onDisputeHoldTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Total value of milestones scheduled for the future.`
  String get futureMilestoneValueTooltip {
    return Intl.message(
      'Total value of milestones scheduled for the future.',
      name: 'futureMilestoneValueTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Total income you have received.`
  String get totalIncomeReceivedTooltip {
    return Intl.message(
      'Total income you have received.',
      name: 'totalIncomeReceivedTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Income received during the current month.`
  String get incomeReceivedThisMonthTooltip {
    return Intl.message(
      'Income received during the current month.',
      name: 'incomeReceivedThisMonthTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Total value of work that has been accepted.`
  String get acceptedWorkValueTooltip {
    return Intl.message(
      'Total value of work that has been accepted.',
      name: 'acceptedWorkValueTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Amounts ready to be paid by the client.`
  String get readyForClientPaymentTooltip {
    return Intl.message(
      'Amounts ready to be paid by the client.',
      name: 'readyForClientPaymentTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Payments waiting for receipt confirmation.`
  String get awaitingReceiptConfirmationTooltip {
    return Intl.message(
      'Payments waiting for receipt confirmation.',
      name: 'awaitingReceiptConfirmationTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Amounts that are not yet eligible for payment.`
  String get notYetEligibleTooltip {
    return Intl.message(
      'Amounts that are not yet eligible for payment.',
      name: 'notYetEligibleTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Total value of all payments confirmed so far.`
  String get total_confirmed_payments_tooltip {
    return Intl.message(
      'Total value of all payments confirmed so far.',
      name: 'total_confirmed_payments_tooltip',
      desc: 'Tooltip for the total confirmed payments metric card',
      args: [],
    );
  }

  /// `Payments confirmed during the current month.`
  String get confirmed_payments_this_month_tooltip {
    return Intl.message(
      'Payments confirmed during the current month.',
      name: 'confirmed_payments_this_month_tooltip',
      desc: 'Tooltip for the confirmed payments this month metric card',
      args: [],
    );
  }

  /// `Amounts approved and ready to be paid.`
  String get ready_for_payment_tooltip {
    return Intl.message(
      'Amounts approved and ready to be paid.',
      name: 'ready_for_payment_tooltip',
      desc: 'Tooltip for the ready for payment metric card',
      args: [],
    );
  }

  /// `Payments waiting for freelancer confirmation.`
  String get awaiting_freelancer_confirmation_tooltip {
    return Intl.message(
      'Payments waiting for freelancer confirmation.',
      name: 'awaiting_freelancer_confirmation_tooltip',
      desc: 'Tooltip for the awaiting freelancer confirmation metric card',
      args: [],
    );
  }

  /// `Total value of milestones scheduled for the future.`
  String get future_milestone_value_tooltip {
    return Intl.message(
      'Total value of milestones scheduled for the future.',
      name: 'future_milestone_value_tooltip',
      desc: 'Tooltip for the future milestone value metric card',
      args: [],
    );
  }

  /// `Total income you have received.`
  String get total_income_received_tooltip {
    return Intl.message(
      'Total income you have received.',
      name: 'total_income_received_tooltip',
      desc: 'Tooltip for the total income received metric card',
      args: [],
    );
  }

  /// `Income received during the current month.`
  String get income_received_this_month_tooltip {
    return Intl.message(
      'Income received during the current month.',
      name: 'income_received_this_month_tooltip',
      desc: 'Tooltip for the income received this month metric card',
      args: [],
    );
  }

  /// `Total value of work that has been accepted.`
  String get accepted_work_value_tooltip {
    return Intl.message(
      'Total value of work that has been accepted.',
      name: 'accepted_work_value_tooltip',
      desc: 'Tooltip for the accepted work value metric card',
      args: [],
    );
  }

  /// `Amounts ready to be paid by the client.`
  String get ready_for_client_payment_tooltip {
    return Intl.message(
      'Amounts ready to be paid by the client.',
      name: 'ready_for_client_payment_tooltip',
      desc: 'Tooltip for the ready for client payment metric card',
      args: [],
    );
  }

  /// `Payments waiting for receipt confirmation.`
  String get awaiting_receipt_confirmation_tooltip {
    return Intl.message(
      'Payments waiting for receipt confirmation.',
      name: 'awaiting_receipt_confirmation_tooltip',
      desc: 'Tooltip for the awaiting receipt confirmation metric card',
      args: [],
    );
  }

  /// `Amounts that are not yet eligible for payment.`
  String get not_yet_eligible_tooltip {
    return Intl.message(
      'Amounts that are not yet eligible for payment.',
      name: 'not_yet_eligible_tooltip',
      desc: 'Tooltip for the not yet eligible metric card',
      args: [],
    );
  }

  /// `Total agreed value of all approved projects.`
  String get approved_project_value_tooltip {
    return Intl.message(
      'Total agreed value of all approved projects.',
      name: 'approved_project_value_tooltip',
      desc: 'Tooltip for the approved project value metric card',
      args: [],
    );
  }

  /// `Total value that has not yet been paid.`
  String get total_unpaid_value_tooltip {
    return Intl.message(
      'Total value that has not yet been paid.',
      name: 'total_unpaid_value_tooltip',
      desc: 'Tooltip for the total unpaid value metric card',
      args: [],
    );
  }

  /// `Payments that encountered an issue and need attention.`
  String get payment_issues_tooltip {
    return Intl.message(
      'Payments that encountered an issue and need attention.',
      name: 'payment_issues_tooltip',
      desc: 'Tooltip for the payment issues metric card',
      args: [],
    );
  }

  /// `Amounts currently on hold due to an open dispute.`
  String get on_dispute_hold_tooltip {
    return Intl.message(
      'Amounts currently on hold due to an open dispute.',
      name: 'on_dispute_hold_tooltip',
      desc: 'Tooltip for the on dispute hold metric card',
      args: [],
    );
  }

  /// `This Month`
  String get this_month {
    return Intl.message('This Month', name: 'this_month', desc: '', args: []);
  }

  /// `This Year`
  String get this_year {
    return Intl.message('This Year', name: 'this_year', desc: '', args: []);
  }

  /// `Last Month`
  String get last_month {
    return Intl.message('Last Month', name: 'last_month', desc: '', args: []);
  }

  /// `Last Year`
  String get last_year {
    return Intl.message('Last Year', name: 'last_year', desc: '', args: []);
  }

  /// `Today`
  String get today {
    return Intl.message('Today', name: 'today', desc: '', args: []);
  }

  /// `Yesterday`
  String get yesterday {
    return Intl.message('Yesterday', name: 'yesterday', desc: '', args: []);
  }

  /// `All time`
  String get all_time {
    return Intl.message('All time', name: 'all_time', desc: '', args: []);
  }

  /// `Current outstanding`
  String get current_outstanding {
    return Intl.message(
      'Current outstanding',
      name: 'current_outstanding',
      desc: '',
      args: [],
    );
  }

  /// `Palestine`
  String get country_palestine {
    return Intl.message(
      'Palestine',
      name: 'country_palestine',
      desc: '',
      args: [],
    );
  }

  /// `Jordan`
  String get country_jordan {
    return Intl.message('Jordan', name: 'country_jordan', desc: '', args: []);
  }

  /// `Egypt`
  String get country_egypt {
    return Intl.message('Egypt', name: 'country_egypt', desc: '', args: []);
  }

  /// `Saudi Arabia`
  String get country_saudi_arabia {
    return Intl.message(
      'Saudi Arabia',
      name: 'country_saudi_arabia',
      desc: '',
      args: [],
    );
  }

  /// `United Arab Emirates`
  String get country_united_arab_emirates {
    return Intl.message(
      'United Arab Emirates',
      name: 'country_united_arab_emirates',
      desc: '',
      args: [],
    );
  }

  /// `Qatar`
  String get country_qatar {
    return Intl.message('Qatar', name: 'country_qatar', desc: '', args: []);
  }

  /// `Kuwait`
  String get country_kuwait {
    return Intl.message('Kuwait', name: 'country_kuwait', desc: '', args: []);
  }

  /// `Bahrain`
  String get country_bahrain {
    return Intl.message('Bahrain', name: 'country_bahrain', desc: '', args: []);
  }

  /// `Oman`
  String get country_oman {
    return Intl.message('Oman', name: 'country_oman', desc: '', args: []);
  }

  /// `Lebanon`
  String get country_lebanon {
    return Intl.message('Lebanon', name: 'country_lebanon', desc: '', args: []);
  }

  /// `Iraq`
  String get country_iraq {
    return Intl.message('Iraq', name: 'country_iraq', desc: '', args: []);
  }

  /// `Syria`
  String get country_syria {
    return Intl.message('Syria', name: 'country_syria', desc: '', args: []);
  }

  /// `Yemen`
  String get country_yemen {
    return Intl.message('Yemen', name: 'country_yemen', desc: '', args: []);
  }

  /// `Turkey`
  String get country_turkey {
    return Intl.message('Turkey', name: 'country_turkey', desc: '', args: []);
  }

  /// `United States`
  String get country_united_states {
    return Intl.message(
      'United States',
      name: 'country_united_states',
      desc: '',
      args: [],
    );
  }

  /// `United Kingdom`
  String get country_united_kingdom {
    return Intl.message(
      'United Kingdom',
      name: 'country_united_kingdom',
      desc: '',
      args: [],
    );
  }

  /// `Germany`
  String get country_germany {
    return Intl.message('Germany', name: 'country_germany', desc: '', args: []);
  }

  /// `France`
  String get country_france {
    return Intl.message('France', name: 'country_france', desc: '', args: []);
  }

  /// `Canada`
  String get country_canada {
    return Intl.message('Canada', name: 'country_canada', desc: '', args: []);
  }

  /// `Other`
  String get country_other {
    return Intl.message('Other', name: 'country_other', desc: '', args: []);
  }

  /// `Pending your review`
  String get change_request_pending_review {
    return Intl.message(
      'Pending your review',
      name: 'change_request_pending_review',
      desc: '',
      args: [],
    );
  }

  /// `amendments applied`
  String get amendments_applied {
    return Intl.message(
      'amendments applied',
      name: 'amendments_applied',
      desc: '',
      args: [],
    );
  }

  /// `Payments`
  String get payments_summary {
    return Intl.message(
      'Payments',
      name: 'payments_summary',
      desc: '',
      args: [],
    );
  }

  /// `Paid`
  String get payments_total_paid {
    return Intl.message(
      'Paid',
      name: 'payments_total_paid',
      desc: '',
      args: [],
    );
  }

  /// `Unpaid`
  String get payments_total_unpaid {
    return Intl.message(
      'Unpaid',
      name: 'payments_total_unpaid',
      desc: '',
      args: [],
    );
  }

  /// `Awaiting confirmation`
  String get payments_awaiting_confirmation {
    return Intl.message(
      'Awaiting confirmation',
      name: 'payments_awaiting_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `View payment details`
  String get payments_view_details {
    return Intl.message(
      'View payment details',
      name: 'payments_view_details',
      desc: '',
      args: [],
    );
  }

  /// `No payments yet`
  String get payments_no_activity_yet {
    return Intl.message(
      'No payments yet',
      name: 'payments_no_activity_yet',
      desc: '',
      args: [],
    );
  }

  /// `View activity`
  String get execution_view_activity {
    return Intl.message(
      'View activity',
      name: 'execution_view_activity',
      desc: '',
      args: [],
    );
  }

  /// `Open chat`
  String get execution_open_chat {
    return Intl.message(
      'Open chat',
      name: 'execution_open_chat',
      desc: '',
      args: [],
    );
  }

  /// `No activity yet`
  String get execution_no_activity_yet {
    return Intl.message(
      'No activity yet',
      name: 'execution_no_activity_yet',
      desc: '',
      args: [],
    );
  }

  /// `No active disputes`
  String get disputes_none_active {
    return Intl.message(
      'No active disputes',
      name: 'disputes_none_active',
      desc: '',
      args: [],
    );
  }

  /// `{count} active`
  String disputes_active_count(int count) {
    return Intl.message(
      '$count active',
      name: 'disputes_active_count',
      desc: '',
      args: [count],
    );
  }

  /// `Full dispute details coming soon`
  String get disputes_coming_soon {
    return Intl.message(
      'Full dispute details coming soon',
      name: 'disputes_coming_soon',
      desc: '',
      args: [],
    );
  }

  /// `Loading…`
  String get card_loading {
    return Intl.message('Loading…', name: 'card_loading', desc: '', args: []);
  }

  /// `Hide milestones`
  String get hide_milestones {
    return Intl.message(
      'Hide milestones',
      name: 'hide_milestones',
      desc: '',
      args: [],
    );
  }

  /// `Not started`
  String get milestone_status_not_started {
    return Intl.message(
      'Not started',
      name: 'milestone_status_not_started',
      desc: '',
      args: [],
    );
  }

  /// `In progress`
  String get milestone_status_in_progress {
    return Intl.message(
      'In progress',
      name: 'milestone_status_in_progress',
      desc: '',
      args: [],
    );
  }

  /// `Awaiting review`
  String get milestone_status_submitted {
    return Intl.message(
      'Awaiting review',
      name: 'milestone_status_submitted',
      desc: '',
      args: [],
    );
  }

  /// `Changes requested`
  String get milestone_status_revision_requested {
    return Intl.message(
      'Changes requested',
      name: 'milestone_status_revision_requested',
      desc: '',
      args: [],
    );
  }

  /// `Accepted`
  String get milestone_status_accepted {
    return Intl.message(
      'Accepted',
      name: 'milestone_status_accepted',
      desc: '',
      args: [],
    );
  }

  /// `Overdue`
  String get milestone_overdue {
    return Intl.message(
      'Overdue',
      name: 'milestone_overdue',
      desc: '',
      args: [],
    );
  }

  /// `Modified`
  String get modified_badge {
    return Intl.message(
      'Modified',
      name: 'modified_badge',
      desc:
          'Badge shown on a milestone in a change request diff that was edited (neither new nor unchanged)',
      args: [],
    );
  }

  /// `Remove milestone?`
  String get remove_milestone {
    return Intl.message(
      'Remove milestone?',
      name: 'remove_milestone',
      desc:
          'Title of the confirmation dialog before deleting a newly-added milestone from a change request',
      args: [],
    );
  }

  /// `Remove`
  String get remove {
    return Intl.message(
      'Remove',
      name: 'remove',
      desc: 'Generic destructive confirm button / tooltip label',
      args: [],
    );
  }

  /// `At least one milestone is required.`
  String get at_least_one_milestone_required {
    return Intl.message(
      'At least one milestone is required.',
      name: 'at_least_one_milestone_required',
      desc:
          'Validation message when submitting a change request with no proposed milestones',
      args: [],
    );
  }

  /// `Title must be 3-200 characters`
  String get title_length_error {
    return Intl.message(
      'Title must be 3-200 characters',
      name: 'title_length_error',
      desc: 'Validation message for the change request title field',
      args: [],
    );
  }

  /// `Reason must be 10-4000 characters`
  String get reason_length_error {
    return Intl.message(
      'Reason must be 10-4000 characters',
      name: 'reason_length_error',
      desc: 'Validation message for the change request reason field',
      args: [],
    );
  }

  /// `Scope change must be 10-4000 characters`
  String get scope_length_error {
    return Intl.message(
      'Scope change must be 10-4000 characters',
      name: 'scope_length_error',
      desc: 'Validation message for the proposed scope change field',
      args: [],
    );
  }

  /// `Are you sure you want to approve this change request? This will amend the contract.`
  String get approve_change_request_confirmation {
    return Intl.message(
      'Are you sure you want to approve this change request? This will amend the contract.',
      name: 'approve_change_request_confirmation',
      desc: 'Confirmation dialog body before approving a change request',
      args: [],
    );
  }

  /// `Are you sure you want to withdraw this change request?`
  String get withdraw_change_request_confirmation {
    return Intl.message(
      'Are you sure you want to withdraw this change request?',
      name: 'withdraw_change_request_confirmation',
      desc: 'Confirmation dialog body before withdrawing a change request',
      args: [],
    );
  }

  /// `View Dispute`
  String get view_dispute {
    return Intl.message(
      'View Dispute',
      name: 'view_dispute',
      desc: '',
      args: [],
    );
  }

  /// `Acceptance and payment actions are paused while this dispute is active.`
  String get milestone_actions_paused_dispute {
    return Intl.message(
      'Acceptance and payment actions are paused while this dispute is active.',
      name: 'milestone_actions_paused_dispute',
      desc:
          'Banner shown on the milestone screen when a dispute is open or has a proposed resolution.',
      args: [],
    );
  }

  /// `External link`
  String get external_link {
    return Intl.message(
      'External link',
      name: 'external_link',
      desc:
          'Segmented button label for adding dispute evidence as a link instead of a file.',
      args: [],
    );
  }

  /// `Paste the link to the evidence (e.g. a shared file, message, or delivery)`
  String get external_link_hint {
    return Intl.message(
      'Paste the link to the evidence (e.g. a shared file, message, or delivery)',
      name: 'external_link_hint',
      desc: 'Hint text for the external evidence URL field.',
      args: [],
    );
  }

  /// `Accepting this resolution will close the dispute. This can't be undone.`
  String get confirm_accept_resolution {
    return Intl.message(
      'Accepting this resolution will close the dispute. This can\'t be undone.',
      name: 'confirm_accept_resolution',
      desc:
          'Confirmation dialog body shown before accepting a proposed resolution.',
      args: [],
    );
  }

  /// `Withdrawing removes the dispute and lifts the hold on this milestone. This can't be undone.`
  String get confirm_withdraw_dispute {
    return Intl.message(
      'Withdrawing removes the dispute and lifts the hold on this milestone. This can\'t be undone.',
      name: 'confirm_withdraw_dispute',
      desc: 'Confirmation dialog body shown before withdrawing a dispute.',
      args: [],
    );
  }

  /// `Messages`
  String get tab_messages {
    return Intl.message(
      'Messages',
      name: 'tab_messages',
      desc: 'Evidence package tab label for relevant project messages.',
      args: [],
    );
  }

  /// `Activity history`
  String get tab_activity_history {
    return Intl.message(
      'Activity history',
      name: 'tab_activity_history',
      desc: 'Evidence package tab label for the dispute\'s activity history.',
      args: [],
    );
  }

  /// `Client feedback and decisions`
  String get client_feedback_and_decisions {
    return Intl.message(
      'Client feedback and decisions',
      name: 'client_feedback_and_decisions',
      desc:
          'Section header on the submissions tab, above the list of client feedback/decision entries.',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
