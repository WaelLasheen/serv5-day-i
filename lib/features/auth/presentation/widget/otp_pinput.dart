import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/core/services/validation_service.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class OtpPinput extends StatelessWidget {
  final TextEditingController controller;
  final bool hasError;

  const OtpPinput({
    super.key,
    required this.controller,
    required this.hasError,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
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

    return Column(
      spacing: 8.h,
      children: [
        Pinput(
          controller: controller,
          length: 6,
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: focusedPinTheme,
          errorPinTheme: errorPinTheme,
          forceErrorState: hasError,
          keyboardType: TextInputType.number,
          validator: ValidationService.validateOtp,
        ),
        if (hasError)
          Text(
            S.current.otpInvalidError,
            textAlign: TextAlign.center,
            style: FontStyles.label.copyWith(color: theme.errorColor),
          ),
      ],
    );
  }
}
