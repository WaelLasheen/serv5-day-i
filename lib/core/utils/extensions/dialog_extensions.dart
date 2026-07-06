import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/core/theme/font_styles.dart';

extension DialogExtensions on BuildContext {
  void showSuccessDialog() {
    showDialog(
      context: this,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: const Color(0xFFEDEDFC),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Container(
            width: 280.w,
            height: 186.h,
            padding: EdgeInsets.all(32.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle,
                  color: context.appTheme.primaryColor,
                  size: 60.r,
                ),
                Text(
                  "تم تغيير كلمة المرور بنجاح",
                  textAlign: TextAlign.center,
                  style: FontStyles.h3.copyWith(
                    color: context.appTheme.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showBottomSheet(Widget widget) {
    showModalBottomSheet(
      context: this,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return widget;
      },
    );
  }
}
