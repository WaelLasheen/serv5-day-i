import 'package:day_i/core/router/router_path.dart';
import 'package:day_i/core/theme/app_theme.dart';
import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/core/utils/extensions/navigation_extension.dart';
import 'package:day_i/core/utils/services/validation_service.dart';
import 'package:day_i/core/widgets/app_button.dart';
import 'package:day_i/features/auth/ui/reset_password_screen.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  final String email;

  const OtpScreen({super.key, required this.email});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _hasError = false;

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void _onVerify() {
    context.navigateTo(RouterPath.resetPassword);
    // final error = ValidationService.validateOtp(_otpController.text);
    // setState(() => _hasError = error != null);
    // if (error == null) {
    //   // proceed with OTP verification
    // }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50.h),
            _OtpHeader(context: context),
            SizedBox(height: 30.h),
            _OtpBody(
              theme: theme,
              email: widget.email,
              otpController: _otpController,
              formKey: _formKey,
              hasError: _hasError,
              onVerify: _onVerify,
            ),
          ],
        ),
      ),
    );
  }
}

class _OtpHeader extends StatelessWidget {
  final BuildContext context;

  const _OtpHeader({required this.context});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => context.navigateBack(),
                icon: const Icon(Icons.arrow_back, color: Colors.white),
              ),
            ],
          ),
          Text(
            S.current.otpTitle,
            style: FontStyles.h1.copyWith(color: Colors.white),
          ),
          SizedBox(height: 8.h),
          Text(
            S.current.otpSubtitle,
            textAlign: TextAlign.center,
            style: FontStyles.bodyMedium.copyWith(
              color: Colors.white.withAlpha(200),
            ),
          ),
        ],
      ),
    );
  }
}

class _OtpBody extends StatelessWidget {
  final AppTheme theme;
  final String email;
  final TextEditingController otpController;
  final GlobalKey<FormState> formKey;
  final bool hasError;
  final VoidCallback onVerify;

  const _OtpBody({
    required this.theme,
    required this.email,
    required this.otpController,
    required this.formKey,
    required this.hasError,
    required this.onVerify,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(S.current.otpTitle, style: FontStyles.h3),
            SizedBox(height: 8.h),
            Text(
              S.current.otpEntryInstruction,
              textAlign: TextAlign.center,
              style: FontStyles.bodySmall.copyWith(color: theme.textSecondary),
            ),
            SizedBox(height: 4.h),
            Text(
              email,
              textAlign: TextAlign.center,
              style: FontStyles.bodySmall.copyWith(color: theme.primaryColor),
            ),
            SizedBox(height: 24.h),
            _OtpPinput(
              theme: theme,
              controller: otpController,
              hasError: hasError,
            ),
            if (hasError) ...[
              SizedBox(height: 8.h),
              Text(
                S.current.otpInvalidError,
                textAlign: TextAlign.center,
                style: FontStyles.label.copyWith(color: theme.errorColor),
              ),
            ],
            SizedBox(height: 30.h),
            AppButton(text: S.current.verifyCode, onPressed: onVerify),
            SizedBox(height: 16.h),
            _ResendCodeSection(theme: theme),
          ],
        ),
      ),
    );
  }
}

class _OtpPinput extends StatelessWidget {
  final AppTheme theme;
  final TextEditingController controller;
  final bool hasError;

  const _OtpPinput({
    required this.theme,
    required this.controller,
    required this.hasError,
  });

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50.w,
      height: 56.h,
      textStyle: FontStyles.h3,
      decoration: BoxDecoration(
        border: Border.all(color: theme.grey600, width: 1.5),
        borderRadius: BorderRadius.circular(8.r),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        border: Border.all(color: theme.primaryColor, width: 2),
        borderRadius: BorderRadius.circular(8.r),
      ),
    );

    final errorPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        border: Border.all(color: theme.errorColor, width: 1.5),
        borderRadius: BorderRadius.circular(8.r),
      ),
    );

    return Pinput(
      controller: controller,
      length: 6,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      errorPinTheme: errorPinTheme,
      forceErrorState: hasError,
      keyboardType: TextInputType.number,
    );
  }
}

class _ResendCodeSection extends StatelessWidget {
  final AppTheme theme;

  const _ResendCodeSection({required this.theme});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // trigger resend OTP logic
      },
      child: Text(
        S.current.resendCode,
        style: FontStyles.bodySmall.copyWith(
          color: theme.primaryColor,
          decoration: TextDecoration.underline,
          decorationColor: theme.primaryColor,
        ),
      ),
    );
  }
}
