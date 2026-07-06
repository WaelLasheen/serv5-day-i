import 'package:day_i/features/profile/presentation/widget/plan_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlanSection extends StatelessWidget {
  const PlanSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 194.h,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return PlanCard(
            title: 'Premium',
            price: '99.99',
            renewalDate: '2025-12-31',
            buttonText: 'Upgrade',
            isCurrentPlan: index == 0,
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 16.w);
        },
        itemCount: 3,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
