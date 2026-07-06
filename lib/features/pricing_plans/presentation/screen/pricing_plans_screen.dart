import 'package:day_i/features/pricing_plans/presentation/widgets/pricing_toggle_bar.dart';
import 'package:day_i/features/pricing_plans/presentation/widgets/pricing_plan_card_widget.dart';
import 'package:day_i/features/pricing_plans/presentation/widgets/plan_comparison_table_widget.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/core/theme/font_styles.dart';

// Bloc Imports
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manger/pricing_palns_cubit.dart';
import '../manger/pricing_palns_state.dart';
import 'package:day_i/core/di/di.dart'; // import DI
import 'package:intl/intl.dart';

class PricingPlansScreen extends StatelessWidget {
  const PricingPlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine language from Intl
    final lang = Intl.getCurrentLocale() == 'ar' ? 'ar' : 'en';

    return BlocProvider(
      create: (context) =>
          getIt<PricingPlansCubit>()..fetchPricingPlans(lang: lang),
      child: const _PricingPlansView(),
    );
  }
}

class _PricingPlansView extends StatelessWidget {
  const _PricingPlansView();

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            final lang = Intl.getCurrentLocale() == 'ar' ? 'ar' : 'en';
            await context.read<PricingPlansCubit>().fetchPricingPlans(
              lang: lang,
            );
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
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
                        Icons.arrow_back_ios_rounded,
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

                // BlocBuilder to listen to Cubit states
                BlocBuilder<PricingPlansCubit, PricingPlansState>(
                  builder: (context, state) {
                    if (state is PricingPlansLoading ||
                        state is PricingPlansInitial) {
                      return Padding(
                        padding: EdgeInsets.only(top: 50.h),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: theme.primaryColor,
                          ),
                        ),
                      );
                    } else if (state is PricingPlansFailure) {
                      return Padding(
                        padding: EdgeInsets.only(top: 50.h),
                        child: Center(
                          child: Text(
                            state.errMessage,
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      );
                    } else if (state is PricingPlansSuccess) {
                      final plans = state.pricingPlans;
                      final comparisonModel = state.comparisonModel;
                      final selectedIndex = state.selectedIndex;

                      if (plans.isEmpty) {
                        return Padding(
                          padding: EdgeInsets.only(top: 50.h),
                          child: Center(
                            child: Text(
                              "لا توجد باقات متاحة",
                              style: TextStyle(fontSize: 16.sp),
                            ),
                          ),
                        );
                      }

                      // Find the active plan based on index
                      final activePlan = plans.firstWhere(
                        (element) => element.index == selectedIndex,
                        orElse: () => plans.first,
                      );

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          PricingToggleBar(
                            selectedIndex: selectedIndex,
                            primaryColor: theme.primaryColor,
                            tabs: plans.map((p) => p.name).toList(),
                            onPlanSelected: (index) => context
                                .read<PricingPlansCubit>()
                                .selectPlan(index),
                          ),
                          SizedBox(height: 20.h),
                          Center(
                            child: PricingPlanCardWidget(
                              plan: activePlan,
                              themeColors: theme,
                            ),
                          ),
                          SizedBox(height: 40.h),
                          PlanComparisonTableWidget(
                            comparisonModel: comparisonModel,
                          ),
                        ],
                      );
                    }

                    return const SizedBox.shrink();
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
