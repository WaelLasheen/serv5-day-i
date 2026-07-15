import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/features/pricing_plans/presentation/screen/pricing_plans_screen.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

class PricingPlansBannerWidget extends StatelessWidget {
  const PricingPlansBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final s = S.of(context);

    final isRtl = Directionality.of(context) == TextDirection.rtl;

    // By placing the Texts first, in RTL they will automatically align to the right,
    // and the arrow will be placed on the left, matching the design.
    // In LTR, texts will be on the left, arrow on the right.
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PricingPlansScreen()),
          );
        },
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF6C63FF)),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Texts
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      s.packagesAndSubscriptions,
                      style: FontStyles.h3.copyWith(
                        color: const Color(0xFF121212),
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      s.chooseAppropriatePlanToManageMarketing,
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        color: const Color(0xFF636262),
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16.w),
              // Arrow icon container
              Container(
                width: 46.r,
                height: 46.r,
                decoration: const BoxDecoration(
                  color: Color(0xFFEDEDFC),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Transform.rotate(
                    angle: isRtl ? -math.pi / 4 : math.pi / 4,
                    child: Icon(
                      Icons.arrow_upward_rounded,
                      color: theme.primaryColor,
                      size: 24.r,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
