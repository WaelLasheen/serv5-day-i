import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/core/theme/app_theme.dart';
import 'package:day_i/core/theme/font_styles.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const NotificationCard({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context).extension<AppTheme>()!;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: appTheme.surfaceColor,
        border: Border.all(color: appTheme.boarderPrimary),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon Container
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: appTheme.blueLight,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                Icons
                    .lightbulb_outline, // Closest material icon for the Figma SVG
                color: appTheme.primaryColor,
                size: 24.w,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          // Text Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: AppTextStyles.textSmMedium.copyWith(
                    color: appTheme.textPrimary,
                    fontFamily: 'Rubik',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (subtitle.isNotEmpty) ...[
                  SizedBox(height: 8.h),
                  Text(
                    subtitle,
                    style: AppTextStyles.textSmMedium.copyWith(
                      color: const Color(0xFF6B7280),
                      fontFamily: 'Rubik',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
