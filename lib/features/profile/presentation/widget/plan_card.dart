import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlanCard extends StatelessWidget {
  final String title;
  final String price;
  final String renewalDate;
  final String buttonText;
  final VoidCallback? onBtnPressed;
  final VoidCallback? onTap;
  final bool isCurrentPlan;

  const PlanCard({
    super.key,
    required this.title,
    required this.price,
    required this.renewalDate,
    required this.buttonText,
    this.onBtnPressed,
    this.onTap,
    this.isCurrentPlan = false,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 253.w,
        height: 162.h,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: 253.w,
                height: isCurrentPlan ? 149.h : 141.h,
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isCurrentPlan
                        ? appTheme.primaryColor
                        : appTheme.grey600,
                    width: 1.r,
                  ),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp,
                                  height: 24 / 16,
                                  color: appTheme.textPrimary,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                renewalDate,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                  height: 21 / 14,
                                  color: appTheme.textPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Text(
                          price,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            height: 21 / 14,
                            color: appTheme.textPrimary,
                          ),
                        ),
                      ],
                    ),

                    AppButton(
                      height: 40.h,
                      text: buttonText,
                      onPressed: onBtnPressed ?? () {},
                      backgroundColor: isCurrentPlan
                          ? appTheme.primaryColor
                          : appTheme.grey600,
                    ),
                  ],
                ),
              ),
            ),

            // Conditional Tag Overlay (Frame 2147238272)
            if (isCurrentPlan)
              Positioned(
                top: 30.h,
                child: Container(
                  width: 110.w,
                  height: 30.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: appTheme.primaryColor,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    'الخطة الحالية',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                      height: 20 / 13,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
