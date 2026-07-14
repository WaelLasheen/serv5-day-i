import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/features/services/domain/entity/service_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/core/widgets/app_button.dart';
import 'package:day_i/core/router/router_path.dart';
import 'package:day_i/generated/l10n.dart';

class PricingCardWidget extends StatelessWidget {
  final ServiceEntity serviceEntity;

  const PricingCardWidget({super.key, required this.serviceEntity});

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;
    final isHighlighted = serviceEntity.id == 12;

    return Container(
      width: 295.w,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: isHighlighted ? const Color(0xFFFAF8FF) : appTheme.surfaceColor,
        border: Border.all(
          color: isHighlighted ? const Color(0xFF6C63FF) : appTheme.grey600,
          width: isHighlighted ? 2.2 : 1.0,
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: isHighlighted
            ? [
                BoxShadow(
                  color: const Color(0xFF6C63FF).withValues(alpha: 0.28),
                  blurRadius: 16,
                  spreadRadius: 3,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.calendar_today,
                color: isHighlighted
                    ? const Color(0xFF6C63FF)
                    : appTheme.primaryColor,
                size: 22.sp,
              ),
              if (isHighlighted)
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 3.h,
                  ),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF6C63FF), Color(0xFF9F7AEA)],
                    ),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.auto_awesome,
                        color: Colors.white,
                        size: 12.sp,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        Localizations.localeOf(context).languageCode == 'ar'
                            ? '✨ تفاصيل كاملة'
                            : '✨ Featured',
                        style: FontStyles.bodySmall.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            serviceEntity.name,
            style: FontStyles.bodyLarge.copyWith(
              color: appTheme.textPrimary,
              fontSize: 14.sp,
              fontWeight: isHighlighted ? FontWeight.bold : FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4.h),
          Text(
            serviceEntity.shortDescription,
            style: FontStyles.bodySmall.copyWith(
              color: appTheme.grey700,
              fontSize: 11.sp,
              height: 1.3,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 10.h),
          Text(
            "${serviceEntity.price}/${serviceEntity.priceLabel}",
            style: FontStyles.bodyMedium.copyWith(
              color: isHighlighted
                  ? const Color(0xFF6C63FF)
                  : appTheme.textPrimary,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          AppButton(
            text: serviceEntity.buttonText.isNotEmpty
                ? serviceEntity.buttonText
                : S.of(context).viewDetails,
            onPressed: () {
              Navigator.pushNamed(
                context,
                RouterPath.serviceDetails,
                arguments: serviceEntity.id,
              );
            },
            height: 34.h,
            fontSize: 13.sp,
            borderRadius: 8.r,
          ),
        ],
      ),
    );
  }
}
