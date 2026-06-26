import 'package:day_i/features/pricing_plans/presentation/param/pricing_plan_model.dart';
import 'package:day_i/features/pricing_plans/presentation/widgets/pricing_toggle_bar.dart';
import 'package:day_i/features/pricing_plans/presentation/widgets/pricing_plan_card_widget.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/core/theme/font_styles.dart';

class PricingPlansScreen extends StatelessWidget {
  const PricingPlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final List<PricingPlanModel> plans = PricingPlanModel.getMockPlans();

    final ValueNotifier<int> selectedPlanNotifier = ValueNotifier<int>(0);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.maybePop(context),
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: theme.primaryColor,
                        size: 20.r,
                      ),
                    ),
                    Text(
                      S.of(context).prices,
                      style: FontStyles.h3.copyWith(
                        color: const Color(0xFF121212),
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp,
                      ),
                    ),
                    const SizedBox(width: 48),
                  ],
                ),
                SizedBox(height: 24.h),

                Text(
                  S.current.choosePackage,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    color: const Color(0xFF121212),
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  S.current.flexiblePackages,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    color: const Color(0xFF7A7A7A),
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 32.h),

                ValueListenableBuilder<int>(
                  valueListenable: selectedPlanNotifier,
                  builder: (context, selectedIndex, child) {
                    final activePlan = plans.firstWhere(
                      (element) => element.index == selectedIndex,
                    );

                    return Column(
                      children: [
                        PricingToggleBar(
                          selectedIndex: selectedIndex,
                          primaryColor: theme.primaryColor,
                          tabs: plans.map((p) => p.title).toList(),
                          onPlanSelected: (index) =>
                              selectedPlanNotifier.value = index,
                        ),
                        SizedBox(height: 20.h),

                        PricingPlanCardWidget(
                          plan: activePlan,
                          themeColors: theme,
                        ),
                      ],
                    );
                  },
                ),

                SizedBox(height: 120.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
