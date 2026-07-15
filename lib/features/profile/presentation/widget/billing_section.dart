import 'package:day_i/generated/l10n.dart';
import 'package:day_i/core/router/router_path.dart';
import 'package:day_i/core/utils/extensions/navigation_extension.dart';
import 'package:day_i/features/profile/presentation/widget/custom_info_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BillingSection extends StatelessWidget {
  const BillingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomInfoSection(
      sectionTitle: S.of(context).billingAndPayment,
      infoData: [
        // Payment Methods Row with specialized Visa Info Badge Container
        InfoModel(
          title: S.of(context).paymentMethods,
          icon: Icons.credit_card_outlined,
          onTap: () => context.navigateTo(RouterPath.payment),
          trailing: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: const Color(0xFFE9E9E9),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              'Visa *****4242',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontWeight: FontWeight.w500,
                fontSize: 13.sp,
                color: const Color(
                  0xFF428FD7,
                ), // Exact Blue token requested for payment details
              ),
            ),
          ),
        ),
        InfoModel(
          title: S.of(context).billingHistory,
          icon: Icons.description_outlined,
          onTap: () => context.navigateTo(RouterPath.orderDetails),
        ),
      ],
    );
  }
}
