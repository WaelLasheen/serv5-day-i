import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/core/theme/app_theme.dart';
import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/features/services/param/service_model.dart';
import 'package:day_i/features/services/widgets/pricing_card_widget.dart';

class ServiceCategoryWidget extends StatelessWidget {
  final AppTheme themeColors;
  final List<ServiceModel> services;
  final String title;
  final String description;

  const ServiceCategoryWidget({
    super.key,
    required this.themeColors,
    required this.services,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: FontStyles.h3.copyWith(
                    color: themeColors.textPrimary, fontSize: 16.sp),
              ),
              SizedBox(height: 8.h),
              Text(
                description,
                style: FontStyles.bodyMedium.copyWith(
                    color: themeColors.textSecondary, fontSize: 14.sp),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        SizedBox(
          height: 280.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: false,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemCount: services.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 16.w), // spacing between cards in RTL
                child: PricingCardWidget(
                  service: services[index],
                  themeColors: themeColors,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
