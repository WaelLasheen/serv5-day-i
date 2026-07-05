import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/core/theme/app_theme.dart';
import 'package:day_i/core/widgets/app_button.dart';
import 'package:day_i/features/pricing_plans/data/models/pricing_plan_model.dart';

class PricingPlanCardWidget extends StatelessWidget {
  final PricingPlanModel plan;
  final AppTheme themeColors;

  const PricingPlanCardWidget({
    super.key,
    required this.plan,
    required this.themeColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: const Color(0xFFE9E9E9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                plan.name,
                style: FontStyles.h3.copyWith(
                  color: const Color(0xFF121212),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (plan.isPopular || plan.badge != null)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF56E14).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    plan.badge ?? 'Popular',
                    style: TextStyle(
                      color: const Color(0xFFF56E14),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),
          if (plan.description != null && plan.description!.isNotEmpty) ...[
            SizedBox(height: 8.h),
            Text(
              plan.description!,
              style: FontStyles.bodyMedium.copyWith(
                color: const Color(0xFF7A7A7A),
                fontSize: 14.sp,
              ),
            ),
          ],
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                plan.price ?? 'Custom',
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF121212),
                ),
              ),
              if (plan.price != null) ...[
                SizedBox(width: 4.w),
                Text(
                  plan.currency,
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF121212),
                  ),
                ),
              ],
              if (plan.price != null && plan.billingInterval.isNotEmpty) ...[
                SizedBox(width: 8.w),
                Text(
                  '/${plan.billingInterval}',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF121212).withValues(alpha: 0.8),
                  ),
                ),
              ],
            ],
          ),
          SizedBox(height: 16.h),
          ...plan.features
              .map((feature) => _buildFeatureItem(feature.toString())),
          SizedBox(height: 16.h),
          AppButton(
            text: plan.button?.text ?? 'أبدأ الآن',
            onPressed: () {
              // Action logic based on plan.button?.action
            },
            icon: Icon(Icons.arrow_forward_ios_rounded, size: 16.r),
            isIconTrailing: true,
            height: 48,
            fontSize: 16,
            backgroundColor: const Color(0xFFF56E14),
            borderRadius: 8,
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 20.w,
            height: 20.w,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFF56E14), width: 1.5),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.check,
              size: 12.sp,
              color: const Color(0xFFF56E14),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF636262),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
