import 'package:day_i/core/services/validation_service.dart';
import 'package:day_i/core/theme/app_theme.dart';
import 'package:day_i/core/widgets/app_button.dart';
import 'package:day_i/core/widgets/custom_form_field.dart';
import 'package:day_i/features/auth/presentation/widget/terms_and_conditions.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/core/theme/font_styles.dart';

class ResetFieldsWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final AppTheme theme;
  final VoidCallback onSuccess;
  final ValueNotifier<bool> isTermsAcceptedNotifier;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const ResetFieldsWidget({
    super.key,
    required this.formKey,
    required this.theme,
    required this.onSuccess,
    required this.isTermsAcceptedNotifier,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                S.current.resetPassword,
                style: FontStyles.h1.copyWith(
                  color: const Color(0xFF121212),
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Center(
              child: Text(
                S.current.enterStrongPasswordToProtectYourAccount,
                style: FontStyles.bodyMedium.copyWith(
                  color: const Color(0xFF636262),
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
              ),
            ),
            SizedBox(height: 32.h),

            SizedBox(height: 8.h),
            CustomFormField(
              isPassword: true,
              hintText: "********",
              label: S.current.password,
              controller: passwordController,
              validator: ValidationService.validatePassword,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
            ),
            SizedBox(height: 16.h),

            CustomFormField(
              isPassword: true,
              hintText: "********",
              label: S.current.confirmPassword,
              controller: confirmPasswordController,
              validator: (value) => ValidationService.validateConfirmPassword(
                passwordController.text,
                value,
              ),
              textInputAction: TextInputAction.done,
            ),
            SizedBox(height: 32.h),
            TermsAndConditions(
              isTermsAcceptedNotifier: isTermsAcceptedNotifier,
            ),
            SizedBox(height: 32.h),

            AppButton(text: S.current.resetPassword, onPressed: onSuccess),
          ],
        ),
      ),
    );
  }
}
