import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreditCardWidget extends StatelessWidget {
  final String cardHolder;
  final String expiryDate;
  final String lastFourDigits;

  const CreditCardWidget({
    super.key,
    required this.cardHolder,
    required this.expiryDate,
    required this.lastFourDigits,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        gradient: LinearGradient(
          colors: [
            const Color(0xFF6E88E6).withOpacity(0.9),
            const Color(0xFFB0C4F4),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Text(
              'visa',
              style: FontStyles.bodyLarge.copyWith(
                fontWeight: FontWeight.w700,
                color: const Color(0xFF333333),
                fontSize: 20.sp,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          SizedBox(height: 24.h),
          Center(
            child: Text(
              '****   ****   ****   $lastFourDigits',
              style: FontStyles.bodyLarge.copyWith(
                fontWeight: FontWeight.w500,
                color: const Color(0xFF333333),
                letterSpacing: 2,
              ),
            ),
          ),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.current.expiresIn,
                    style: FontStyles.bodySmall.copyWith(
                      color: const Color(0xFF666666),
                      fontSize: 10.sp,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    expiryDate,
                    style: FontStyles.bodyMedium.copyWith(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF333333),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    S.current.cardHolder,
                    style: FontStyles.bodySmall.copyWith(
                      color: const Color(0xFF666666),
                      fontSize: 10.sp,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    cardHolder,
                    style: FontStyles.bodyMedium.copyWith(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF333333),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
