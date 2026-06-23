import 'package:day_i/core/theme/app_theme.dart';
import 'package:day_i/core/theme/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TermsAndConditionsWidget extends StatelessWidget {
  final AppTheme theme;
  final bool isTermsAccepted;
  final ValueChanged<bool?> onChanged;

  const TermsAndConditionsWidget({
    super.key,
    required this.theme,
    required this.isTermsAccepted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          value: isTermsAccepted,
          onChanged: onChanged,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
          ),
          activeColor: theme.primaryColor,
        ),
        SizedBox(width: 4.w),
        Expanded(
          child: Text(
            "أوافق على الشروط والاحكام وسياسة الخصوصية",
            style: FontStyles.label.copyWith(
              color: const Color(0xFF121212),
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    );
  }
}