import 'package:day_i/features/pricing_plans/presentation/param/pricing_plan_model.dart';
import 'package:day_i/features/pricing_plans/presentation/widgets/pricing_toggle_bar.dart';
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

    // تعريف الـ Notifier لمراقبة الـ Index المختار (الافتراضي 0)
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

                // 1. الهيدر المخصص
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 24),
                    Text("الأسعار", style: FontStyles.h3.copyWith(color: const Color(0xFF121212), fontWeight: FontWeight.w600, fontSize: 20.sp)),
                    IconButton(
                      onPressed: () => Navigator.maybePop(context),
                      icon: Icon(Icons.arrow_forward_ios_rounded, color: theme.primaryColor, size: 20.r),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),

                // 2. النصوص التوضيحية
                Text("اختر الباقة المناسبة لنمو تسويقك", textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Rubik', color: const Color(0xFF121212), fontWeight: FontWeight.w600, fontSize: 18.sp)),
                SizedBox(height: 8.h),
                Text("باقات مرنة تناسب حجم نشاطك وأهدافك التسويقية.", textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Rubik', color: const Color(0xFF7A7A7A), fontWeight: FontWeight.w400, fontSize: 14.sp)),
                SizedBox(height: 32.h),

                // لف الأجزاء المتغيرة بـ ValueListenableBuilder لإعادة بنائها فقط عند تغير القيمة
                ValueListenableBuilder<int>(
                  valueListenable :selectedPlanNotifier,
                  builder: (context, selectedIndex, child) {
                    final activePlan = plans.firstWhere((element) => element.index == selectedIndex);

                    return Column(
                      children: [
                        // 3. شريط اختيار الباقات المنفصل
                        PricingToggleBar(
                          selectedIndex: selectedIndex,
                          primaryColor: theme.primaryColor,
                          onPlanSelected: (index) => selectedPlanNotifier.value = index, // تحديث القيمة مباشرة بدون setState
                        ),
                        SizedBox(height: 20.h),

                        // 4. جسم الباقة المختارة
                        Container(
                          width: 343.w,
                          height: 390.h,
                          padding: EdgeInsets.all(24.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24.r),
                            border: Border.all(color: theme.primaryColor, width: 1.5),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(activePlan.title, style: TextStyle(fontFamily: 'Rubik', fontSize: 18.sp, fontWeight: FontWeight.w600, color: theme.primaryColor)),
                              SizedBox(height: 12.h),
                              Text(activePlan.description, textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Rubik', fontSize: 15.sp, color: const Color(0xFF636262), fontWeight: FontWeight.w400)),
                            ],
                          ),
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