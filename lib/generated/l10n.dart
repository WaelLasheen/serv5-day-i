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

  /// `Day I`
  String get appTitle {
    return Intl.message('Day I', name: 'appTitle', desc: '', args: []);
  }

  /// `Hello World!`
  String get hello {
    return Intl.message('Hello World!', name: 'hello', desc: '', args: []);
  }

  /// `Welcome to Day I`
  String get welcomeMessage {
    return Intl.message(
      'Welcome to Day I',
      name: 'welcomeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get changeLanguage {
    return Intl.message(
      'Change Language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Path Not Found`
  String get pathNotFound {
    return Intl.message(
      'Path Not Found',
      name: 'pathNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Connection timeout`
  String get connectionTimeout {
    return Intl.message(
      'Connection timeout',
      name: 'connectionTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Send timeout`
  String get sendTimeout {
    return Intl.message(
      'Send timeout',
      name: 'sendTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Receive timeout`
  String get receiveTimeout {
    return Intl.message(
      'Receive timeout',
      name: 'receiveTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Bad Certificate`
  String get badCertificate {
    return Intl.message(
      'Bad Certificate',
      name: 'badCertificate',
      desc: '',
      args: [],
    );
  }

  /// `Request was canceled`
  String get requestCanceled {
    return Intl.message(
      'Request was canceled',
      name: 'requestCanceled',
      desc: '',
      args: [],
    );
  }

  /// `No Internet Connection`
  String get noInternetConnection {
    return Intl.message(
      'No Internet Connection',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Unexpected Error, Please try again!`
  String get unexpectedError {
    return Intl.message(
      'Unexpected Error, Please try again!',
      name: 'unexpectedError',
      desc: '',
      args: [],
    );
  }

  /// `Internal Server error, Please try later`
  String get internalServerError {
    return Intl.message(
      'Internal Server error, Please try later',
      name: 'internalServerError',
      desc: '',
      args: [],
    );
  }

  /// `Oops! There was an Error, Please try again`
  String get oopsError {
    return Intl.message(
      'Oops! There was an Error, Please try again',
      name: 'oopsError',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Login to manage book fairs and cultural events`
  String get loginSubtitle {
    return Intl.message(
      'Login to manage book fairs and cultural events',
      name: 'loginSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Create New Account`
  String get signup {
    return Intl.message(
      'Create New Account',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `Create your account to manage your marketing campaigns smartly within minutes`
  String get signupSubtitle {
    return Intl.message(
      'Create your account to manage your marketing campaigns smartly within minutes',
      name: 'signupSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message('Full Name', name: 'fullName', desc: '', args: []);
  }

  /// `Email Address`
  String get email {
    return Intl.message('Email Address', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `I agree to the terms and conditions and privacy policy`
  String get termsAndConditions {
    return Intl.message(
      'I agree to the terms and conditions and privacy policy',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `OR`
  String get or {
    return Intl.message('OR', name: 'or', desc: '', args: []);
  }

  /// `Don't have an account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Register Now`
  String get registerNow {
    return Intl.message(
      'Register Now',
      name: 'registerNow',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPasswordTitle {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email address to reset your password.`
  String get forgotPasswordSubtitle {
    return Intl.message(
      'Enter your email address to reset your password.',
      name: 'forgotPasswordSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Send Verification Code`
  String get sendCode {
    return Intl.message(
      'Send Verification Code',
      name: 'sendCode',
      desc: '',
      args: [],
    );
  }

  /// `Enter Verification Code`
  String get otpTitle {
    return Intl.message(
      'Enter Verification Code',
      name: 'otpTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter the verification code we sent to your email.`
  String get otpSubtitle {
    return Intl.message(
      'Enter the verification code we sent to your email.',
      name: 'otpSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `We sent a 6-digit code to the email`
  String get otpEntryInstruction {
    return Intl.message(
      'We sent a 6-digit code to the email',
      name: 'otpEntryInstruction',
      desc: '',
      args: [],
    );
  }

  /// `Verify Code`
  String get verifyCode {
    return Intl.message('Verify Code', name: 'verifyCode', desc: '', args: []);
  }

  /// `Resend Code`
  String get resendCode {
    return Intl.message('Resend Code', name: 'resendCode', desc: '', args: []);
  }

  /// `Invalid verification code. Please try again.`
  String get otpInvalidError {
    return Intl.message(
      'Invalid verification code. Please try again.',
      name: 'otpInvalidError',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get emailReq {
    return Intl.message(
      'Email is required',
      name: 'emailReq',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get invalidEmail {
    return Intl.message(
      'Please enter a valid email',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get passwordReq {
    return Intl.message(
      'Password is required',
      name: 'passwordReq',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters`
  String get invalidPassword {
    return Intl.message(
      'Password must be at least 8 characters',
      name: 'invalidPassword',
      desc: '',
      args: [],
    );
  }

  /// `Full Name is required`
  String get fullNameReq {
    return Intl.message(
      'Full Name is required',
      name: 'fullNameReq',
      desc: '',
      args: [],
    );
  }

  /// `Phone number is required`
  String get phoneReq {
    return Intl.message(
      'Phone number is required',
      name: 'phoneReq',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password is required`
  String get confirmPasswordReq {
    return Intl.message(
      'Confirm password is required',
      name: 'confirmPasswordReq',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get confirmPasswordMismatch {
    return Intl.message(
      'Passwords do not match',
      name: 'confirmPasswordMismatch',
      desc: '',
      args: [],
    );
  }

  /// `Looking for a service...`
  String get searchHint {
    return Intl.message(
      'Looking for a service...',
      name: 'searchHint',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Services`
  String get services {
    return Intl.message('Services', name: 'services', desc: '', args: []);
  }

  /// `Orders`
  String get orders {
    return Intl.message('Orders', name: 'orders', desc: '', args: []);
  }

  /// `Account`
  String get account {
    return Intl.message('Account', name: 'account', desc: '', args: []);
  }

  /// `Prices`
  String get prices {
    return Intl.message('Prices', name: 'prices', desc: '', args: []);
  }

  /// `Choose package for your marketing campaign`
  String get choosePackage {
    return Intl.message(
      'Choose package for your marketing campaign',
      name: 'choosePackage',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password`
  String get forgotPassword {
    return Intl.message(
      'Forgot password',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter a strong password to protect your account.`
  String get resetPasswordInstruction {
    return Intl.message(
      'Enter a strong password to protect your account.',
      name: 'resetPasswordInstruction',
      desc: '',
      args: [],
    );
  }

  /// `Password changed successfully`
  String get passwordChangedSuccess {
    return Intl.message(
      'Password changed successfully',
      name: 'passwordChangedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Flexible packages to suit your business size and marketing goals`
  String get flexiblePackages {
    return Intl.message(
      'Flexible packages to suit your business size and marketing goals',
      name: 'flexiblePackages',
      desc: '',
      args: [],
    );
  }

  /// `Show details`
  String get showDetails {
    return Intl.message(
      'Show details',
      name: 'showDetails',
      desc: '',
      args: [],
    );
  }

  /// `Start Now`
  String get startNow {
    return Intl.message('Start Now', name: 'startNow', desc: '', args: []);
  }

  /// `Create Your Company`
  String get createCompany {
    return Intl.message(
      'Create Your Company',
      name: 'createCompany',
      desc: '',
      args: [],
    );
  }

  /// `Start building your company's presence on the platform by entering its data.`
  String get createCompanySubtitle {
    return Intl.message(
      'Start building your company\'s presence on the platform by entering its data.',
      name: 'createCompanySubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Company Name`
  String get companyName {
    return Intl.message(
      'Company Name',
      name: 'companyName',
      desc: '',
      args: [],
    );
  }

  /// `Company Name is required`
  String get companyNameReq {
    return Intl.message(
      'Company Name is required',
      name: 'companyNameReq',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Industry`
  String get industry {
    return Intl.message('Industry', name: 'industry', desc: '', args: []);
  }

  /// `Selected Plan`
  String get selectedPlan {
    return Intl.message(
      'Selected Plan',
      name: 'selectedPlan',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get actionButton {
    return Intl.message(
      'Create Account',
      name: 'actionButton',
      desc: '',
      args: [],
    );
  }

  /// `Contact Information`
  String get contactInfo {
    return Intl.message(
      'Contact Information',
      name: 'contactInfo',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message('Contact Us', name: 'contactUs', desc: '', args: []);
  }

  /// `FAQs`
  String get faqs {
    return Intl.message('FAQs', name: 'faqs', desc: '', args: []);
  }

  /// `Subject`
  String get subject {
    return Intl.message('Subject', name: 'subject', desc: '', args: []);
  }

  /// `Choose contact subject`
  String get chooseSubject {
    return Intl.message(
      'Choose contact subject',
      name: 'chooseSubject',
      desc: '',
      args: [],
    );
  }

  /// `User Message`
  String get userMessage {
    return Intl.message(
      'User Message',
      name: 'userMessage',
      desc: '',
      args: [],
    );
  }

  /// `Write your message here`
  String get writeMessageHere {
    return Intl.message(
      'Write your message here',
      name: 'writeMessageHere',
      desc: '',
      args: [],
    );
  }

  /// `Send Message`
  String get sendMessage {
    return Intl.message(
      'Send Message',
      name: 'sendMessage',
      desc: '',
      args: [],
    );
  }

  /// `Markiva Contact Information`
  String get markivaContactInfo {
    return Intl.message(
      'Markiva Contact Information',
      name: 'markivaContactInfo',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message('Address', name: 'address', desc: '', args: []);
  }

  /// `Login Successfully`
  String get loginSuccessfully {
    return Intl.message(
      'Login Successfully',
      name: 'loginSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Account Created Successfully`
  String get accountCreatedSuccessFully {
    return Intl.message(
      'Account Created Successfully',
      name: 'accountCreatedSuccessFully',
      desc: '',
      args: [],
    );
  }

  /// `Search Location...`
  String get searchLocation {
    return Intl.message(
      'Search Location...',
      name: 'searchLocation',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Are you sure of logout?`
  String get logoutConfirm {
    return Intl.message(
      'Are you sure of logout?',
      name: 'logoutConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `No services available`
  String get noServicesAvailable {
    return Intl.message(
      'No services available',
      name: 'noServicesAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message('Phone', name: 'phone', desc: '', args: []);
  }

  /// `Confirm password does not match the new password`
  String get passwordDoesntMatch {
    return Intl.message(
      'Confirm password does not match the new password',
      name: 'passwordDoesntMatch',
      desc: '',
      args: [],
    );
  }

  /// `Strong Password`
  String get passwordStrength {
    return Intl.message(
      'Strong Password',
      name: 'passwordStrength',
      desc: '',
      args: [],
    );
  }

  /// `Weak`
  String get weekPassword {
    return Intl.message('Weak', name: 'weekPassword', desc: '', args: []);
  }

  /// `Medium`
  String get mediumPassword {
    return Intl.message('Medium', name: 'mediumPassword', desc: '', args: []);
  }

  /// `Strong`
  String get strongPassword {
    return Intl.message('Strong', name: 'strongPassword', desc: '', args: []);
  }

  /// `Edit Contact Information`
  String get editProfileContacts {
    return Intl.message(
      'Edit Contact Information',
      name: 'editProfileContacts',
      desc: '',
      args: [],
    );
  }

  /// `Password Security`
  String get passwordSecurity {
    return Intl.message(
      'Password Security',
      name: 'passwordSecurity',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get editProfileChangePassword {
    return Intl.message(
      'Change Password',
      name: 'editProfileChangePassword',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter a new password for your account.`
  String get changePasswordInstruction {
    return Intl.message(
      'Enter a new password for your account.',
      name: 'changePasswordInstruction',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters.`
  String get passwordLength {
    return Intl.message(
      'Password must be at least 8 characters.',
      name: 'passwordLength',
      desc: '',
      args: [],
    );
  }

  /// `Please do not use personal information or common words.`
  String get passwordNotPersonal {
    return Intl.message(
      'Please do not use personal information or common words.',
      name: 'passwordNotPersonal',
      desc: '',
      args: [],
    );
  }

  /// `It is recommended to use uppercase and lowercase letters and numbers.`
  String get passwordCaseAndNumbers {
    return Intl.message(
      'It is recommended to use uppercase and lowercase letters and numbers.',
      name: 'passwordCaseAndNumbers',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfilePage {
    return Intl.message(
      'Edit Profile',
      name: 'editProfilePage',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get currentPassword {
    return Intl.message(
      'Current Password',
      name: 'currentPassword',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get saveChanges {
    return Intl.message(
      'Save Changes',
      name: 'saveChanges',
      desc: '',
      args: [],
    );
  }

  /// `Email Verified`
  String get emailVerified {
    return Intl.message(
      'Email Verified',
      name: 'emailVerified',
      desc: '',
      args: [],
    );
  }

  /// `Enter a strong password to protect your account`
  String get enterStrongPasswordToProtectYourAccount {
    return Intl.message(
      'Enter a strong password to protect your account',
      name: 'enterStrongPasswordToProtectYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Privacy`
  String get privacy {
    return Intl.message('Privacy', name: 'privacy', desc: '', args: []);
  }

  /// `Data Usage`
  String get dataUsage {
    return Intl.message('Data Usage', name: 'dataUsage', desc: '', args: []);
  }

  /// `Share order data with assigned service team only`
  String get shareDataTeamOnly {
    return Intl.message(
      'Share order data with assigned service team only',
      name: 'shareDataTeamOnly',
      desc: '',
      args: [],
    );
  }

  /// `Allow using data to improve service`
  String get allowDataImproveService {
    return Intl.message(
      'Allow using data to improve service',
      name: 'allowDataImproveService',
      desc: '',
      args: [],
    );
  }

  /// `Visibility Control`
  String get visibilityControl {
    return Intl.message(
      'Visibility Control',
      name: 'visibilityControl',
      desc: '',
      args: [],
    );
  }

  /// `Manager only`
  String get managerOnly {
    return Intl.message(
      'Manager only',
      name: 'managerOnly',
      desc: '',
      args: [],
    );
  }

  /// `Assigned service team`
  String get assignedTeam {
    return Intl.message(
      'Assigned service team',
      name: 'assignedTeam',
      desc: '',
      args: [],
    );
  }

  /// `Your parameters will not be visible to unauthorized employees.`
  String get unauthorizedNotVisible {
    return Intl.message(
      'Your parameters will not be visible to unauthorized employees.',
      name: 'unauthorizedNotVisible',
      desc: '',
      args: [],
    );
  }

  /// `Security Alerts`
  String get securityAlerts {
    return Intl.message(
      'Security Alerts',
      name: 'securityAlerts',
      desc: '',
      args: [],
    );
  }

  /// `Alert on new login`
  String get alertNewLogin {
    return Intl.message(
      'Alert on new login',
      name: 'alertNewLogin',
      desc: '',
      args: [],
    );
  }

  /// `Alert on order status change`
  String get alertStatusChange {
    return Intl.message(
      'Alert on order status change',
      name: 'alertStatusChange',
      desc: '',
      args: [],
    );
  }

  /// `Account Control`
  String get accountControl {
    return Intl.message(
      'Account Control',
      name: 'accountControl',
      desc: '',
      args: [],
    );
  }

  /// `Download Data`
  String get downloadData {
    return Intl.message(
      'Download Data',
      name: 'downloadData',
      desc: '',
      args: [],
    );
  }

  /// `Deactivate Account`
  String get deactivateAccount {
    return Intl.message(
      'Deactivate Account',
      name: 'deactivateAccount',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get deleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Account deletion requests are reviewed by the admin and processed within 14 days. This action is final and will delete all service records`
  String get deleteAccountWarning {
    return Intl.message(
      'Account deletion requests are reviewed by the admin and processed within 14 days. This action is final and will delete all service records',
      name: 'deleteAccountWarning',
      desc: '',
      args: [],
    );
  }

  /// `No FAQs currently available.`
  String get noFaqsAvailable {
    return Intl.message(
      'No FAQs currently available.',
      name: 'noFaqsAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Service Register`
  String get serviceRegister {
    return Intl.message(
      'Service Register',
      name: 'serviceRegister',
      desc: '',
      args: [],
    );
  }

  /// `Search by service name or request number...`
  String get searchOrderHint {
    return Intl.message(
      'Search by service name or request number...',
      name: 'searchOrderHint',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message('All', name: 'all', desc: '', args: []);
  }

  /// `Pending`
  String get pending {
    return Intl.message('Pending', name: 'pending', desc: '', args: []);
  }

  /// `Approved`
  String get approved {
    return Intl.message('Approved', name: 'approved', desc: '', args: []);
  }

  /// `Late`
  String get late {
    return Intl.message('Late', name: 'late', desc: '', args: []);
  }

  /// `Budget: {amount}`
  String budgetLabel(Object amount) {
    return Intl.message(
      'Budget: $amount',
      name: 'budgetLabel',
      desc: '',
      args: [amount],
    );
  }

  /// `View Details`
  String get viewDetails {
    return Intl.message(
      'View Details',
      name: 'viewDetails',
      desc: '',
      args: [],
    );
  }

  /// `No orders found`
  String get noOrders {
    return Intl.message(
      'No orders found',
      name: 'noOrders',
      desc: '',
      args: [],
    );
  }

  /// `Employee: {name}`
  String employeeLabel(Object name) {
    return Intl.message(
      'Employee: $name',
      name: 'employeeLabel',
      desc: '',
      args: [name],
    );
  }

  /// `Budget`
  String get budget {
    return Intl.message('Budget', name: 'budget', desc: '', args: []);
  }

  /// `A smart platform for managing marketing`
  String get splashTagLine {
    return Intl.message(
      'A smart platform for managing marketing',
      name: 'splashTagLine',
      desc: '',
      args: [],
    );
  }

  /// `next`
  String get next {
    return Intl.message('next', name: 'next', desc: '', args: []);
  }

  /// `skip`
  String get skip {
    return Intl.message('skip', name: 'skip', desc: '', args: []);
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

  /// `No notifications currently`
  String get noNotificationsCurrently {
    return Intl.message(
      'No notifications currently',
      name: 'noNotificationsCurrently',
      desc: '',
      args: [],
    );
  }

  /// `Add Payment Method`
  String get addPaymentMethod {
    return Intl.message(
      'Add Payment Method',
      name: 'addPaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Cardholder Name`
  String get cardHolderName {
    return Intl.message(
      'Cardholder Name',
      name: 'cardHolderName',
      desc: '',
      args: [],
    );
  }

  /// `Card Number`
  String get cardNumber {
    return Intl.message('Card Number', name: 'cardNumber', desc: '', args: []);
  }

  /// `Expiry Date`
  String get expiryDate {
    return Intl.message('Expiry Date', name: 'expiryDate', desc: '', args: []);
  }

  /// `Security Code`
  String get securityCode {
    return Intl.message(
      'Security Code',
      name: 'securityCode',
      desc: '',
      args: [],
    );
  }

  /// `Postal Code`
  String get postalCode {
    return Intl.message('Postal Code', name: 'postalCode', desc: '', args: []);
  }

  /// `Set as default payment card`
  String get setDefaultPayment {
    return Intl.message(
      'Set as default payment card',
      name: 'setDefaultPayment',
      desc: '',
      args: [],
    );
  }

  /// `Save payment method for later use`
  String get savePaymentForLater {
    return Intl.message(
      'Save payment method for later use',
      name: 'savePaymentForLater',
      desc: '',
      args: [],
    );
  }

  /// `Save Payment Method`
  String get savePaymentMethod {
    return Intl.message(
      'Save Payment Method',
      name: 'savePaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Payment Methods`
  String get paymentMethods {
    return Intl.message(
      'Payment Methods',
      name: 'paymentMethods',
      desc: '',
      args: [],
    );
  }

  /// `Other payment methods`
  String get otherPaymentMethods {
    return Intl.message(
      'Other payment methods',
      name: 'otherPaymentMethods',
      desc: '',
      args: [],
    );
  }

  /// `Add card`
  String get addCard {
    return Intl.message('Add card', name: 'addCard', desc: '', args: []);
  }

  /// `Continue Payment`
  String get continuePayment {
    return Intl.message(
      'Continue Payment',
      name: 'continuePayment',
      desc: '',
      args: [],
    );
  }

  /// `Card Holder`
  String get cardHolder {
    return Intl.message('Card Holder', name: 'cardHolder', desc: '', args: []);
  }

  /// `Expires in`
  String get expiresIn {
    return Intl.message('Expires in', name: 'expiresIn', desc: '', args: []);
  }

  /// `Welcome to`
  String get welcomeTo {
    return Intl.message('Welcome to', name: 'welcomeTo', desc: '', args: []);
  }

  /// `A marketing management platform that combines team collaboration, task tracking, and performance analytics into a single interface.`
  String get markevaDescription {
    return Intl.message(
      'A marketing management platform that combines team collaboration, task tracking, and performance analytics into a single interface.',
      name: 'markevaDescription',
      desc: '',
      args: [],
    );
  }

  /// `Packages and Subscriptions`
  String get packagesAndSubscriptions {
    return Intl.message(
      'Packages and Subscriptions',
      name: 'packagesAndSubscriptions',
      desc: '',
      args: [],
    );
  }

  /// `Choose the appropriate plan to manage your marketing business and benefit from all the advantages.`
  String get chooseAppropriatePlanToManageMarketing {
    return Intl.message(
      'Choose the appropriate plan to manage your marketing business and benefit from all the advantages.',
      name: 'chooseAppropriatePlanToManageMarketing',
      desc: '',
      args: [],
    );
  }

  /// `Subscriptions`
  String get subscriptions {
    return Intl.message(
      'Subscriptions',
      name: 'subscriptions',
      desc: '',
      args: [],
    );
  }

  /// `Markeva Smart`
  String get markevaSmart {
    return Intl.message(
      'Markeva Smart',
      name: 'markevaSmart',
      desc: '',
      args: [],
    );
  }

  /// `Always Active`
  String get alwaysActive {
    return Intl.message(
      'Always Active',
      name: 'alwaysActive',
      desc: '',
      args: [],
    );
  }

  /// `👋 Welcome to Markeva\nI am the smart assistant, how can I help you today?`
  String get chatbotWelcomeMsg {
    return Intl.message(
      '👋 Welcome to Markeva\nI am the smart assistant, how can I help you today?',
      name: 'chatbotWelcomeMsg',
      desc: '',
      args: [],
    );
  }

  /// `I want to launch a marketing campaign for my e-store`
  String get chatbotOptionCampaign {
    return Intl.message(
      'I want to launch a marketing campaign for my e-store',
      name: 'chatbotOptionCampaign',
      desc: '',
      args: [],
    );
  }

  /// `What is the appropriate service?`
  String get chatbotOptionService {
    return Intl.message(
      'What is the appropriate service?',
      name: 'chatbotOptionService',
      desc: '',
      args: [],
    );
  }

  /// `Great! Based on your activity, I recommend the following services:`
  String get chatbotSuggesting {
    return Intl.message(
      'Great! Based on your activity, I recommend the following services:',
      name: 'chatbotSuggesting',
      desc: '',
      args: [],
    );
  }

  /// `Ad Campaigns Management`
  String get chatbotService1 {
    return Intl.message(
      'Ad Campaigns Management',
      name: 'chatbotService1',
      desc: '',
      args: [],
    );
  }

  /// `Social Media Accounts Management`
  String get chatbotService2 {
    return Intl.message(
      'Social Media Accounts Management',
      name: 'chatbotService2',
      desc: '',
      args: [],
    );
  }

  /// `Marketing Content Writing`
  String get chatbotService3 {
    return Intl.message(
      'Marketing Content Writing',
      name: 'chatbotService3',
      desc: '',
      args: [],
    );
  }

  /// `Which service would you like to know the details of?`
  String get chatbotWhichService {
    return Intl.message(
      'Which service would you like to know the details of?',
      name: 'chatbotWhichService',
      desc: '',
      args: [],
    );
  }

  /// `Show me other options`
  String get chatbotShowOtherOptions {
    return Intl.message(
      'Show me other options',
      name: 'chatbotShowOtherOptions',
      desc: '',
      args: [],
    );
  }

  /// `Type a message`
  String get typeMessage {
    return Intl.message(
      'Type a message',
      name: 'typeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Invoice Details`
  String get orderDetailsTitle {
    return Intl.message(
      'Invoice Details',
      name: 'orderDetailsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Paid`
  String get paidStatus {
    return Intl.message('Paid', name: 'paidStatus', desc: '', args: []);
  }

  /// `Invoice Number`
  String get invoiceNumberLabel {
    return Intl.message(
      'Invoice Number',
      name: 'invoiceNumberLabel',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get paymentMethodLabel {
    return Intl.message(
      'Payment Method',
      name: 'paymentMethodLabel',
      desc: '',
      args: [],
    );
  }

  /// `Credit Card`
  String get creditCard {
    return Intl.message('Credit Card', name: 'creditCard', desc: '', args: []);
  }

  /// `Invoice Date`
  String get invoiceDateLabel {
    return Intl.message(
      'Invoice Date',
      name: 'invoiceDateLabel',
      desc: '',
      args: [],
    );
  }

  /// `Payment Time`
  String get paymentTimeLabel {
    return Intl.message(
      'Payment Time',
      name: 'paymentTimeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Order Number`
  String get orderNumberLabel {
    return Intl.message(
      'Order Number',
      name: 'orderNumberLabel',
      desc: '',
      args: [],
    );
  }

  /// `Customer Information`
  String get customerInfoLabel {
    return Intl.message(
      'Customer Information',
      name: 'customerInfoLabel',
      desc: '',
      args: [],
    );
  }

  /// `Service Details`
  String get serviceDetailsLabel {
    return Intl.message(
      'Service Details',
      name: 'serviceDetailsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Execution Time`
  String get executionTimeLabel {
    return Intl.message(
      'Execution Time',
      name: 'executionTimeLabel',
      desc: '',
      args: [],
    );
  }

  /// `{days} working days`
  String workingDays(Object days) {
    return Intl.message(
      '$days working days',
      name: 'workingDays',
      desc: '',
      args: [days],
    );
  }

  /// `Payment Summary`
  String get paymentSummaryLabel {
    return Intl.message(
      'Payment Summary',
      name: 'paymentSummaryLabel',
      desc: '',
      args: [],
    );
  }

  /// `Service Price`
  String get servicePriceLabel {
    return Intl.message(
      'Service Price',
      name: 'servicePriceLabel',
      desc: '',
      args: [],
    );
  }

  /// `Tax ({percentage}%)`
  String taxLabel(Object percentage) {
    return Intl.message(
      'Tax ($percentage%)',
      name: 'taxLabel',
      desc: '',
      args: [percentage],
    );
  }

  /// `Discount (Code: {code})`
  String discountLabel(Object code) {
    return Intl.message(
      'Discount (Code: $code)',
      name: 'discountLabel',
      desc: '',
      args: [code],
    );
  }

  /// `Final Total`
  String get finalTotalLabel {
    return Intl.message(
      'Final Total',
      name: 'finalTotalLabel',
      desc: '',
      args: [],
    );
  }

  /// `Download Invoice PDF`
  String get downloadPdfLabel {
    return Intl.message(
      'Download Invoice PDF',
      name: 'downloadPdfLabel',
      desc: '',
      args: [],
    );
  }

  /// `Payment Successful`
  String get paymentSuccessTitle {
    return Intl.message(
      'Payment Successful',
      name: 'paymentSuccessTitle',
      desc: '',
      args: [],
    );
  }

  /// `Payment received successfully, your order has been created and sent to the team to start immediately.`
  String get paymentSuccessSubtitle {
    return Intl.message(
      'Payment received successfully, your order has been created and sent to the team to start immediately.',
      name: 'paymentSuccessSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Order Details`
  String get orderDetails {
    return Intl.message(
      'Order Details',
      name: 'orderDetails',
      desc: '',
      args: [],
    );
  }

  /// `Order Number`
  String get orderNumber {
    return Intl.message(
      'Order Number',
      name: 'orderNumber',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message('Total', name: 'total', desc: '', args: []);
  }

  /// `Track Order`
  String get trackOrder {
    return Intl.message('Track Order', name: 'trackOrder', desc: '', args: []);
  }

  /// `Review My Orders`
  String get reviewOrders {
    return Intl.message(
      'Review My Orders',
      name: 'reviewOrders',
      desc: '',
      args: [],
    );
  }

  /// `Advertising Campaigns Management`
  String get campaignManagement {
    return Intl.message(
      'Advertising Campaigns Management',
      name: 'campaignManagement',
      desc: '',
      args: [],
    );
  }

  /// `Execution Time : {time}`
  String executionTime(Object time) {
    return Intl.message(
      'Execution Time : $time',
      name: 'executionTime',
      desc: '',
      args: [time],
    );
  }

  /// `Service Description`
  String get serviceDescription {
    return Intl.message(
      'Service Description',
      name: 'serviceDescription',
      desc: '',
      args: [],
    );
  }

  /// `What does the service include?`
  String get whatServiceIncludes {
    return Intl.message(
      'What does the service include?',
      name: 'whatServiceIncludes',
      desc: '',
      args: [],
    );
  }

  /// `Why choose Markiva`
  String get whyChooseMarkiva {
    return Intl.message(
      'Why choose Markiva',
      name: 'whyChooseMarkiva',
      desc: '',
      args: [],
    );
  }

  /// `Customer Reviews`
  String get customerReviews {
    return Intl.message(
      'Customer Reviews',
      name: 'customerReviews',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get viewAll {
    return Intl.message('View All', name: 'viewAll', desc: '', args: []);
  }

  /// `Similar Services`
  String get similarServices {
    return Intl.message(
      'Similar Services',
      name: 'similarServices',
      desc: '',
      args: [],
    );
  }

  /// `Approximate Total`
  String get approximateTotal {
    return Intl.message(
      'Approximate Total',
      name: 'approximateTotal',
      desc: '',
      args: [],
    );
  }

  /// `Request Service`
  String get requestService {
    return Intl.message(
      'Request Service',
      name: 'requestService',
      desc: '',
      args: [],
    );
  }

  /// `Review Your Order`
  String get reviewYourOrder {
    return Intl.message(
      'Review Your Order',
      name: 'reviewYourOrder',
      desc: '',
      args: [],
    );
  }

  /// `Please verify service details before proceeding`
  String get pleaseVerifyOrderDetails {
    return Intl.message(
      'Please verify service details before proceeding',
      name: 'pleaseVerifyOrderDetails',
      desc: '',
      args: [],
    );
  }

  /// `Add special notes to your order`
  String get addNotesToOrder {
    return Intl.message(
      'Add special notes to your order',
      name: 'addNotesToOrder',
      desc: '',
      args: [],
    );
  }

  /// `e.g., additional details about the target audience or specific goals...`
  String get notesHint {
    return Intl.message(
      'e.g., additional details about the target audience or specific goals...',
      name: 'notesHint',
      desc: '',
      args: [],
    );
  }

  /// `Service Price`
  String get servicePrice {
    return Intl.message(
      'Service Price',
      name: 'servicePrice',
      desc: '',
      args: [],
    );
  }

  /// `Tax({percentage}%)`
  String tax(Object percentage) {
    return Intl.message(
      'Tax($percentage%)',
      name: 'tax',
      desc: '',
      args: [percentage],
    );
  }

  /// `Included`
  String get included {
    return Intl.message('Included', name: 'included', desc: '', args: []);
  }

  /// `App Preferences`
  String get appPreferences {
    return Intl.message(
      'App Preferences',
      name: 'appPreferences',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message('Dark Mode', name: 'darkMode', desc: '', args: []);
  }

  /// `Billing and Payment`
  String get billingAndPayment {
    return Intl.message(
      'Billing and Payment',
      name: 'billingAndPayment',
      desc: '',
      args: [],
    );
  }

  /// `Billing History`
  String get billingHistory {
    return Intl.message(
      'Billing History',
      name: 'billingHistory',
      desc: '',
      args: [],
    );
  }

  /// `Privacy and Security`
  String get privacyAndSecurity {
    return Intl.message(
      'Privacy and Security',
      name: 'privacyAndSecurity',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Settings`
  String get privacySettings {
    return Intl.message(
      'Privacy Settings',
      name: 'privacySettings',
      desc: '',
      args: [],
    );
  }

  /// `Help and Support`
  String get helpAndSupport {
    return Intl.message(
      'Help and Support',
      name: 'helpAndSupport',
      desc: '',
      args: [],
    );
  }

  /// `Help Center`
  String get helpCenter {
    return Intl.message('Help Center', name: 'helpCenter', desc: '', args: []);
  }

  /// `Communication Info`
  String get communicationInfo {
    return Intl.message(
      'Communication Info',
      name: 'communicationInfo',
      desc: '',
      args: [],
    );
  }

  /// `Business Metadata`
  String get businessMetadata {
    return Intl.message(
      'Business Metadata',
      name: 'businessMetadata',
      desc: '',
      args: [],
    );
  }

  /// `Growth Plan`
  String get growthPlan {
    return Intl.message('Growth Plan', name: 'growthPlan', desc: '', args: []);
  }

  /// `Next Renewal Date`
  String get nextRenewalDate {
    return Intl.message(
      'Next Renewal Date',
      name: 'nextRenewalDate',
      desc: '',
      args: [],
    );
  }

  /// `Current Plan`
  String get currentPlan {
    return Intl.message(
      'Current Plan',
      name: 'currentPlan',
      desc: '',
      args: [],
    );
  }

  /// `Upgrade Plan`
  String get upgradePlan {
    return Intl.message(
      'Upgrade Plan',
      name: 'upgradePlan',
      desc: '',
      args: [],
    );
  }

  /// `Suggested Services For You`
  String get suggestedServicesForYou {
    return Intl.message(
      'Suggested Services For You',
      name: 'suggestedServicesForYou',
      desc: '',
      args: [],
    );
  }

  /// `View More`
  String get viewMore {
    return Intl.message('View More', name: 'viewMore', desc: '', args: []);
  }

  /// `Service Categories`
  String get serviceCategories {
    return Intl.message(
      'Service Categories',
      name: 'serviceCategories',
      desc: '',
      args: [],
    );
  }

  /// `Message sent successfully`
  String get messageSentSuccessfully {
    return Intl.message(
      'Message sent successfully',
      name: 'messageSentSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Hint text`
  String get hintText {
    return Intl.message('Hint text', name: 'hintText', desc: '', args: []);
  }

  /// `Enter the official name of your company as it will appear to customers`
  String get companyNameHint {
    return Intl.message(
      'Enter the official name of your company as it will appear to customers',
      name: 'companyNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Choose the industry your company operates in`
  String get industryHint {
    return Intl.message(
      'Choose the industry your company operates in',
      name: 'industryHint',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get fieldRequired {
    return Intl.message('Required', name: 'fieldRequired', desc: '', args: []);
  }

  /// `The plan you subscribed to to activate platform services`
  String get subscribedPlanHint {
    return Intl.message(
      'The plan you subscribed to to activate platform services',
      name: 'subscribedPlanHint',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message('Retry', name: 'retry', desc: '', args: []);
  }

  /// `No packages available`
  String get noPackagesAvailable {
    return Intl.message(
      'No packages available',
      name: 'noPackagesAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Hello {name}!`
  String helloUser(String name) {
    return Intl.message(
      'Hello $name!',
      name: 'helloUser',
      desc: '',
      args: [name],
    );
  }

  /// `Business Information`
  String get businessInfo {
    return Intl.message(
      'Business Information',
      name: 'businessInfo',
      desc: '',
      args: [],
    );
  }

  /// `Business Type`
  String get businessType {
    return Intl.message(
      'Business Type',
      name: 'businessType',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message('Location', name: 'location', desc: '', args: []);
  }

  /// `Security and Privacy`
  String get securityAndPrivacy {
    return Intl.message(
      'Security and Privacy',
      name: 'securityAndPrivacy',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `({count} reviews)`
  String reviewsCount(int count) {
    return Intl.message(
      '($count reviews)',
      name: 'reviewsCount',
      desc: '',
      args: [count],
    );
  }

  /// `Markiva`
  String get onboarding1TitleHighlight {
    return Intl.message(
      'Markiva',
      name: 'onboarding1TitleHighlight',
      desc: '',
      args: [],
    );
  }

  /// `... Smarter Marketing Management`
  String get onboarding1TitleSuffix {
    return Intl.message(
      '... Smarter Marketing Management',
      name: 'onboarding1TitleSuffix',
      desc: '',
      args: [],
    );
  }

  /// `All the marketing tools you need in one place\nFrom planning to execution and tracking.`
  String get onboarding1Description {
    return Intl.message(
      'All the marketing tools you need in one place\nFrom planning to execution and tracking.',
      name: 'onboarding1Description',
      desc: '',
      args: [],
    );
  }

  /// `Plan, Execute, Track Easily`
  String get onboarding2Title {
    return Intl.message(
      'Plan, Execute, Track Easily',
      name: 'onboarding2Title',
      desc: '',
      args: [],
    );
  }

  /// `Track campaigns, tasks, and performance\nWithout complexity or distraction.`
  String get onboarding2Description {
    return Intl.message(
      'Track campaigns, tasks, and performance\nWithout complexity or distraction.',
      name: 'onboarding2Description',
      desc: '',
      args: [],
    );
  }

  /// `Every Decision Based on Numbers`
  String get onboarding3Title {
    return Intl.message(
      'Every Decision Based on Numbers',
      name: 'onboarding3Title',
      desc: '',
      args: [],
    );
  }

  /// `Clear reports that help you make the right decision\nAt the right time.`
  String get onboarding3Description {
    return Intl.message(
      'Clear reports that help you make the right decision\nAt the right time.',
      name: 'onboarding3Description',
      desc: '',
      args: [],
    );
  }

  /// `Advertising strategy preparation`
  String get serviceInclude1 {
    return Intl.message(
      'Advertising strategy preparation',
      name: 'serviceInclude1',
      desc: '',
      args: [],
    );
  }

  /// `Campaign creation on the required platform`
  String get serviceInclude2 {
    return Intl.message(
      'Campaign creation on the required platform',
      name: 'serviceInclude2',
      desc: '',
      args: [],
    );
  }

  /// `Writing ad copy`
  String get serviceInclude3 {
    return Intl.message(
      'Writing ad copy',
      name: 'serviceInclude3',
      desc: '',
      args: [],
    );
  }

  /// `Designing ad images or videos`
  String get serviceInclude4 {
    return Intl.message(
      'Designing ad images or videos',
      name: 'serviceInclude4',
      desc: '',
      args: [],
    );
  }

  /// `Daily performance monitoring and optimization`
  String get serviceInclude5 {
    return Intl.message(
      'Daily performance monitoring and optimization',
      name: 'serviceInclude5',
      desc: '',
      args: [],
    );
  }

  /// `Detailed final results report`
  String get serviceInclude6 {
    return Intl.message(
      'Detailed final results report',
      name: 'serviceInclude6',
      desc: '',
      args: [],
    );
  }

  /// `Periodic Reports`
  String get featurePeriodicReports {
    return Intl.message(
      'Periodic Reports',
      name: 'featurePeriodicReports',
      desc: '',
      args: [],
    );
  }

  /// `Continuous communication and transparent reports showing every detail of your budget spending.`
  String get featurePeriodicReportsDesc {
    return Intl.message(
      'Continuous communication and transparent reports showing every detail of your budget spending.',
      name: 'featurePeriodicReportsDesc',
      desc: '',
      args: [],
    );
  }

  /// `Precise Targeting`
  String get featurePreciseTargeting {
    return Intl.message(
      'Precise Targeting',
      name: 'featurePreciseTargeting',
      desc: '',
      args: [],
    );
  }

  /// `We use accurate data to reach your potential customers with high efficiency.`
  String get featurePreciseTargetingDesc {
    return Intl.message(
      'We use accurate data to reach your potential customers with high efficiency.',
      name: 'featurePreciseTargetingDesc',
      desc: '',
      args: [],
    );
  }

  /// `Faster Results`
  String get featureFasterResults {
    return Intl.message(
      'Faster Results',
      name: 'featureFasterResults',
      desc: '',
      args: [],
    );
  }

  /// `An advanced methodology that ensures reaching your goals in record time.`
  String get featureFasterResultsDesc {
    return Intl.message(
      'An advanced methodology that ensures reaching your goals in record time.',
      name: 'featureFasterResultsDesc',
      desc: '',
      args: [],
    );
  }

  /// `Ready to grow your campaign?`
  String get notificationMockTitle1 {
    return Intl.message(
      'Ready to grow your campaign?',
      name: 'notificationMockTitle1',
      desc: '',
      args: [],
    );
  }

  /// `A suitable service suggestion for your business is available now.`
  String get notificationMockSubtitle1 {
    return Intl.message(
      'A suitable service suggestion for your business is available now.',
      name: 'notificationMockSubtitle1',
      desc: '',
      args: [],
    );
  }

  /// `Great Choice`
  String get notificationMockTitle2 {
    return Intl.message(
      'Great Choice',
      name: 'notificationMockTitle2',
      desc: '',
      args: [],
    );
  }

  /// `This service is perfectly aligned with your current marketing goals.`
  String get notificationMockSubtitle2 {
    return Intl.message(
      'This service is perfectly aligned with your current marketing goals.',
      name: 'notificationMockSubtitle2',
      desc: '',
      args: [],
    );
  }

  /// `We provide you with a comprehensive and professional service for creating and managing your advertising campaigns across various digital platforms. It focuses on targeting the right audience precisely to ensure the highest levels of reach and conversion. With continuous performance improvement to reduce costs and increase return on investment.`
  String get serviceDescriptionText {
    return Intl.message(
      'We provide you with a comprehensive and professional service for creating and managing your advertising campaigns across various digital platforms. It focuses on targeting the right audience precisely to ensure the highest levels of reach and conversion. With continuous performance improvement to reduce costs and increase return on investment.',
      name: 'serviceDescriptionText',
      desc: '',
      args: [],
    );
  }

  /// `Abdullah Al-Qahtani`
  String get mockReviewAuthor {
    return Intl.message(
      'Abdullah Al-Qahtani',
      name: 'mockReviewAuthor',
      desc: '',
      args: [],
    );
  }

  /// `2 days ago`
  String get mockReviewDate {
    return Intl.message(
      '2 days ago',
      name: 'mockReviewDate',
      desc: '',
      args: [],
    );
  }

  /// `The service is excellent and the team is very professional in dealing and responding. I noticed a difference in results from the first week.`
  String get mockReviewComment {
    return Intl.message(
      'The service is excellent and the team is very professional in dealing and responding. I noticed a difference in results from the first week.',
      name: 'mockReviewComment',
      desc: '',
      args: [],
    );
  }

  /// `Social Media Account Management`
  String get mockSimilarServiceTitle {
    return Intl.message(
      'Social Media Account Management',
      name: 'mockSimilarServiceTitle',
      desc: '',
      args: [],
    );
  }

  /// `Ad Campaign Management - Facebook`
  String get mockOrderFacebook {
    return Intl.message(
      'Ad Campaign Management - Facebook',
      name: 'mockOrderFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Ad Campaign Management - Instagram`
  String get mockOrderInstagram {
    return Intl.message(
      'Ad Campaign Management - Instagram',
      name: 'mockOrderInstagram',
      desc: '',
      args: [],
    );
  }

  /// `Search Engine Optimization (SEO)`
  String get mockOrderSEO {
    return Intl.message(
      'Search Engine Optimization (SEO)',
      name: 'mockOrderSEO',
      desc: '',
      args: [],
    );
  }

  /// `User Interface Design`
  String get mockOrderUIUX {
    return Intl.message(
      'User Interface Design',
      name: 'mockOrderUIUX',
      desc: '',
      args: [],
    );
  }

  /// `Promotional Email Campaign`
  String get mockOrderEmail {
    return Intl.message(
      'Promotional Email Campaign',
      name: 'mockOrderEmail',
      desc: '',
      args: [],
    );
  }

  /// `Promotional Video Content Production`
  String get mockOrderVideo {
    return Intl.message(
      'Promotional Video Content Production',
      name: 'mockOrderVideo',
      desc: '',
      args: [],
    );
  }

  /// `12 March 2026`
  String get mockOrderDate1 {
    return Intl.message(
      '12 March 2026',
      name: 'mockOrderDate1',
      desc: '',
      args: [],
    );
  }

  /// `13 March 2026`
  String get mockOrderDate2 {
    return Intl.message(
      '13 March 2026',
      name: 'mockOrderDate2',
      desc: '',
      args: [],
    );
  }

  /// `14 March 2026`
  String get mockOrderDate3 {
    return Intl.message(
      '14 March 2026',
      name: 'mockOrderDate3',
      desc: '',
      args: [],
    );
  }

  /// `15 March 2026`
  String get mockOrderDate4 {
    return Intl.message(
      '15 March 2026',
      name: 'mockOrderDate4',
      desc: '',
      args: [],
    );
  }

  /// `Credit Card`
  String get mockPaymentCreditCard {
    return Intl.message(
      'Credit Card',
      name: 'mockPaymentCreditCard',
      desc: '',
      args: [],
    );
  }

  /// `Paid`
  String get mockStatusPaid {
    return Intl.message('Paid', name: 'mockStatusPaid', desc: '', args: []);
  }

  /// `Ahmed Mahmoud Al-Khalidi`
  String get mockCustomerName {
    return Intl.message(
      'Ahmed Mahmoud Al-Khalidi',
      name: 'mockCustomerName',
      desc: '',
      args: [],
    );
  }

  /// `Ad Campaign Management`
  String get mockServiceAdCampaign {
    return Intl.message(
      'Ad Campaign Management',
      name: 'mockServiceAdCampaign',
      desc: '',
      args: [],
    );
  }

  /// `Digital Marketing`
  String get mockServiceDigitalMarketing {
    return Intl.message(
      'Digital Marketing',
      name: 'mockServiceDigitalMarketing',
      desc: '',
      args: [],
    );
  }

  /// `Content Writing`
  String get mockCategoryContentWriting {
    return Intl.message(
      'Content Writing',
      name: 'mockCategoryContentWriting',
      desc: '',
      args: [],
    );
  }

  /// `Design`
  String get mockCategoryDesign {
    return Intl.message(
      'Design',
      name: 'mockCategoryDesign',
      desc: '',
      args: [],
    );
  }

  /// `Ads`
  String get mockCategoryAds {
    return Intl.message('Ads', name: 'mockCategoryAds', desc: '', args: []);
  }

  /// `Social Media`
  String get mockCategorySocialMedia {
    return Intl.message(
      'Social Media',
      name: 'mockCategorySocialMedia',
      desc: '',
      args: [],
    );
  }

  /// `Web & App Design`
  String get mockSuggestedServiceTitle1 {
    return Intl.message(
      'Web & App Design',
      name: 'mockSuggestedServiceTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Execute Paid Ad Campaigns`
  String get mockSuggestedServiceTitle2 {
    return Intl.message(
      'Execute Paid Ad Campaigns',
      name: 'mockSuggestedServiceTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Design`
  String get mockSuggestedServiceTag1 {
    return Intl.message(
      'Design',
      name: 'mockSuggestedServiceTag1',
      desc: '',
      args: [],
    );
  }

  /// `Digital Ads`
  String get mockSuggestedServiceTag2 {
    return Intl.message(
      'Digital Ads',
      name: 'mockSuggestedServiceTag2',
      desc: '',
      args: [],
    );
  }

  /// `12 Days`
  String get mockDuration12Days {
    return Intl.message(
      '12 Days',
      name: 'mockDuration12Days',
      desc: '',
      args: [],
    );
  }

  /// `7 Days`
  String get mockDuration7Days {
    return Intl.message(
      '7 Days',
      name: 'mockDuration7Days',
      desc: '',
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
