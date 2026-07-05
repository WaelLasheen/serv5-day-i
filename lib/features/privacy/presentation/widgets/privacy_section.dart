import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';

class PrivacySection extends StatelessWidget {
  final String title;
  final Widget child;

  const PrivacySection({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: FontStyles.h3.copyWith(
            color: theme.textPrimary,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.right,
        ),
        SizedBox(height: 12.h),
        Container(
          width: 343.w,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: theme.surfaceColor,
            border: Border.all(color: theme.boarderPrimary),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: child,
        ),
      ],
    );
  }
}
