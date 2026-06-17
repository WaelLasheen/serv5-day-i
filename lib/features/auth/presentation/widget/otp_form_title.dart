import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpFormTitle extends StatelessWidget {
  final String email;
  const OtpFormTitle({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(S.current.otpTitle, style: FontStyles.h3),
        SizedBox(height: 8.h),
        Text(
          S.current.otpEntryInstruction,
          textAlign: TextAlign.center,
          style: FontStyles.bodySmall.copyWith(color: theme.textSecondary),
        ),
        SizedBox(height: 16.h),
        Text(
          email,
          textAlign: TextAlign.center,
          style: FontStyles.bodySmall.copyWith(color: theme.primaryColor),
        ),
      ],
    );
  }
}
