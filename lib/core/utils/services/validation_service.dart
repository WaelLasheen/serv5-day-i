import 'package:day_i/core/utils/extensions/number_range.dart';
import 'package:day_i/generated/l10n.dart';

class ValidationService {
  ValidationService._();

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return S.current.emailReq;
    }
    final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return S.current.invalidEmail;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return S.current.passwordReq;
    }
    if (value.trim().length < 8) {
      return S.current.invalidPassword;
    }
    return null;
  }

  static String? validateConfirmPassword(String? password, String? value) {
    if (value == null || value.trim().isEmpty) {
      return S.current.confirmPasswordReq;
    }
    if (password == null || value.trim() != password.trim()) {
      return S.current.confirmPasswordMismatch;
    }
    return null;
  }

  static String? validateFullName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return S.current.fullNameReq;
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return S.current.phoneReq;
    }
    if(!value.trim().length.isBetween(11, 12)){
      return S.current.phoneReq;
    }
    return null;
  }

  static String? validateOtp(String? value) {
    if (value == null || value.trim().isEmpty || value.trim().length < 6) {
      return S.current.otpInvalidError;
    }
    return null;
  }
}
