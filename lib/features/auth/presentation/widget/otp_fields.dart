import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/core/widgets/app_button.dart';
import 'package:day_i/features/auth/presentation/widget/otp_form_title.dart';
import 'package:day_i/features/auth/presentation/widget/otp_pinput.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpFields extends StatelessWidget {
  final String phone;
  final TextEditingController otpController;
  final GlobalKey<FormState> formKey;
  final VoidCallback onVerify;
  final ValueNotifier<bool> hasErrorNotifier;

  const OtpFields({
    super.key,
    required this.phone,
    required this.otpController,
    required this.formKey,
    required this.onVerify,
    required this.hasErrorNotifier,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
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
          spacing: 32.h,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OtpFormTitle(email: phone),

            ValueListenableBuilder(
              valueListenable: hasErrorNotifier,
              builder: (context, value, child) {
                return OtpPinput(controller: otpController, hasError: value);
              },
            ),

            AppButton(text: S.current.verifyCode, onPressed: onVerify),
            TextButton(
              onPressed: ()  {
                
              },
              child: Text(
                S.current.resendCode,
                style: FontStyles.bodySmall.copyWith(
                  color: theme.primaryColor,
                  decorationColor: theme.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
