import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/core/utils/extensions/size_extension.dart';
import 'package:day_i/core/widgets/app_button.dart';
import 'package:day_i/features/profile/presentation/widget/logout_button.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoutBottomSheet extends StatelessWidget {
  final VoidCallback onConfirmLogout;
  final bool isLoggingOut;

  const LogoutBottomSheet({
    super.key,
    required this.onConfirmLogout,
    this.isLoggingOut = false,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;

    return Container(
      width: context.width,
      decoration: BoxDecoration(
        color: appTheme.surfaceColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.r),
          topRight: Radius.circular(32.r),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16.h),
              // Top drag indicator handle (Rectangle)
              Container(
                width: 56.w,
                height: 5.h,
                decoration: BoxDecoration(
                  color: appTheme.grey200,
                  borderRadius: BorderRadius.circular(5.r),
                ),
              ),
              SizedBox(height: 24.h),

              // Title and Subtitle Info block (Frame 2147207202)
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    S.current.logout,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      height: 27 / 18,
                      color: const Color(0xFF121212),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    S.current.logoutConfirm,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      height: 21 / 14,
                      color: const Color(0xFF636262),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),

              // Action buttons group (Frame 2147207203)
              Column(
                children: [
                  // Confirm Logout Error Action Button
                  LogoutButton(onLogout: onConfirmLogout),
                  SizedBox(height: 16.h),
                  // Cancel dismiss Outline Action Button
                  AppButton(
                    text: S.current.cancel,
                    onPressed: () => Navigator.pop(context),
                    isPrimary: false, // Triggers OutlinedButton path internally
                    width: 343.w,
                    height: 48,
                    borderRadius: 8,
                    border: BorderSide(
                      color: appTheme.primaryColor,
                      width: 1.r,
                    ),
                    textColor: appTheme.primaryColor,
                    fontSize: 16,
                  ),
                ],
              ),
              SizedBox(height: 16.h), // Bottom padding buffer before system bar
            ],
          ),
        ),
      ),
    );
  }
}
