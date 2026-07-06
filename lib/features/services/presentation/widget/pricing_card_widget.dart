import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/features/services/domain/entity/service_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/core/widgets/app_button.dart';

class PricingCardWidget extends StatelessWidget {
  final ServiceEntity serviceEntity;

  const PricingCardWidget({super.key, required this.serviceEntity});

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;

    return Container(
      width: 295.w,
      height: 260.h,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: appTheme.surfaceColor,
        border: Border.all(color: appTheme.grey600),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        spacing: 32.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.calendar_today,
                color: appTheme.primaryColor,
                size: 28.sp,
              ),
              SizedBox(height: 16.h),
              Text(
                serviceEntity.name,
                style: FontStyles.bodyLarge.copyWith(
                  color: appTheme.textPrimary,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                serviceEntity.shortDescription,
                style: FontStyles.bodySmall.copyWith(
                  color: appTheme.grey700,
                  fontSize: 11.sp,
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                serviceEntity.slug,
                style: FontStyles.bodyMedium.copyWith(
                  color: appTheme.textPrimary,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          AppButton(
            text: S.current.showDetails,
            onPressed: () {},
            height: 37.h,
            fontSize: 14.sp,
            borderRadius: 8.r,
          ),
        ],
      ),
    );
  }
}
