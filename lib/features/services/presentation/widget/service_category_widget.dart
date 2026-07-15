import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/features/services/domain/entity/main_service_entity.dart';
import 'package:day_i/features/services/presentation/widget/pricing_card_widget.dart';

class ServiceCategoryWidget extends StatelessWidget {
  final MainServiceEntity mainServiceEntity;
  const ServiceCategoryWidget({super.key, required this.mainServiceEntity});

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mainServiceEntity.title,
                style: FontStyles.h3.copyWith(
                  color: appTheme.textPrimary,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                mainServiceEntity.description,
                style: FontStyles.bodyMedium.copyWith(
                  color: appTheme.textSecondary,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        SizedBox(
          height: 198.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: false,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemCount: mainServiceEntity.services.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  left: 16.w,
                ), // spacing between cards in RTL
                child: PricingCardWidget(
                  serviceEntity: mainServiceEntity.services[index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
