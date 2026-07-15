import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/core/theme/font_styles.dart';

extension SnackBarExtension on BuildContext {
  void showSuccessSnackBar({
    required String message,
    bool avoidBotButton = true,
  }) {
    final margin = avoidBotButton
        ? EdgeInsets.symmetric(horizontal: 44.w, vertical: 14.h)
        : EdgeInsets.symmetric(horizontal: 36.w, vertical: 14.h);

    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: Text(
            message,
            style: FontStyles.label.copyWith(
              color: Colors.white,
              fontSize: 14.sp,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        margin: margin,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void showErrorSnackBar({
    required String message,
    bool avoidBotButton = true,
  }) {
    final margin = avoidBotButton
        ? EdgeInsets.symmetric(horizontal: 44.w, vertical: 14.h)
        : EdgeInsets.symmetric(horizontal: 36.w, vertical: 14.h);

    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: Text(
            message,
            style: FontStyles.label.copyWith(
              color: Colors.white,
              fontSize: 14.sp,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        margin: margin,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
