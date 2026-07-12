import 'package:day_i/core/router/router_path.dart';
import 'package:day_i/core/theme/app_theme.dart';
import 'package:day_i/core/widgets/app_button.dart';
import 'package:day_i/features/payment/presentation/widgets/order_details_card.dart';
import 'package:day_i/features/payment/presentation/widgets/success_payment_icon.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessPaymentScreen extends StatelessWidget {
  const SuccessPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppTheme>();
    final l10n = S.of(context);

    return Scaffold(
      backgroundColor: theme?.surfaceColor ?? Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),
              
              // Success Icon
              const SuccessPaymentIcon(),
              SizedBox(height: 24.h),
              
              // Title
              Text(
                l10n.paymentSuccessTitle,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: theme?.textPrimary ?? const Color(0xFF121212),
                    ),
              ),
              SizedBox(height: 16.h),
              
              // Subtitle
              Text(
                l10n.paymentSuccessSubtitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: theme?.textSecondary ?? const Color(0xFF636262),
                      height: 1.5,
                    ),
              ),
              SizedBox(height: 40.h),
              
              // Order Details Card
              OrderDetailsCard(
                orderNumber: 'MK-2045#',
                serviceName: l10n.campaignManagement,
                totalPrice: '899\$',
                date: '22 يوليو 2026',
              ),
              
              SizedBox(height: 40.h),
              
              // Action Buttons
              AppButton(
                text: l10n.trackOrder,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RouterPath.orderDetails,
                    arguments: 'MK-2045#',
                  );
                },
                isPrimary: true,
                backgroundColor: theme?.primaryColor ?? const Color(0xFF4F46E5),
                textColor: theme?.surfaceColor ?? Colors.white,
                borderRadius: 8,
              ),
              SizedBox(height: 16.h),
              AppButton(
                text: l10n.reviewOrders,
                onPressed: () {
                  Navigator.pushNamed(context, RouterPath.orderHistory);
                },
                isPrimary: false,
                textColor: theme?.primaryColor ?? const Color(0xFF4F46E5),
                border: BorderSide(
                  color: theme?.primaryColor ?? const Color(0xFF4F46E5),
                ),
                borderRadius: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
