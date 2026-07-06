import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/core/utils/extensions/size_extension.dart';
import 'package:day_i/core/widgets/app_button.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoutButton extends StatelessWidget {
  final VoidCallback onLogout;
  const LogoutButton({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: S.current.logout,
      width: context.width,
      height: 48.h,
      borderRadius: 8.r,
      onPressed:onLogout,
      fontSize: 16.sp,
      backgroundColor: context.appTheme.redNormalColor,
      textColor: context.appTheme.surfaceColor,
    );
  }
}
