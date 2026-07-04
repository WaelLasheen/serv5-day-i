import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:day_i/core/theme/app_theme.dart';
import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/core/widgets/app_button.dart';
import 'package:day_i/features/services/param/service_model.dart';

class PricingCardWidget extends StatelessWidget {
  final ServiceModel service;
  final AppTheme themeColors;

  const PricingCardWidget({
    super.key,
    required this.service,
    required this.themeColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.w,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: themeColors.grey600),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Icon(
              service.icon,
              color: themeColors.primaryColor,
              size: 28.sp,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            service.title,
            style: FontStyles.bodyLarge.copyWith(
              color: themeColors.textPrimary,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            service.description,
            style: FontStyles.bodySmall.copyWith(
              color: themeColors.grey700,
              fontSize: 11.sp,
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            service.price,
            style: FontStyles.bodyMedium.copyWith(
              color: themeColors.textPrimary,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.h),
          AppButton(
            text: S.current.showDetails,
            onPressed: () {},
            height: 37,
            fontSize: 14,
            backgroundColor: const Color(0xFFF56E14),
            borderRadius: 8,
          ),
        ],
      ),
    );
  }
}
