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
