import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/core/utils/extensions/navigation_extension.dart';

class ResetPasswordHeader extends StatelessWidget {
  const ResetPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => context.navigateBack(),
                icon: const Icon(Icons.arrow_back, color: Colors.white),
              ),
              Row(
                children: [
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                    size: 18.sp,
                  ),
                  SizedBox(width: 8.w),
                  Icon(Icons.language, color: Colors.white, size: 24.sp),
                ],
              ),
            ],
          ),
          Text(
            "إعادة تعيين كلمة المرور",
            style: FontStyles.h1.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 20.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            "أدخل كلمة مرور قوية لحماية حسابك",
            textAlign: TextAlign.center,
            style: FontStyles.bodyMedium.copyWith(
              color: const Color(0xFFE5E5E5),
              fontWeight: FontWeight.w400,
              fontSize: 13.sp,
            ),
          ),
        ],
      ),
    );
  }
}