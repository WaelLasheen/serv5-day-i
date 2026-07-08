import 'package:day_i/core/router/router_path.dart';
import 'package:day_i/core/utils/extensions/navigation_extension.dart';
import 'package:day_i/core/widgets/app_button.dart';
import 'package:day_i/features/splash/presentation/widgets/markeva_welcome_section.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MarkevaWelcomeSection(),
            ConstrainedBox(constraints: BoxConstraints(minHeight: 80.h)),
            AppButton(
              text: S.current.login,
              borderRadius: 8.r,
              onPressed: () {
                context.navigateAndReplace(RouterPath.login);
              },
            ),
            SizedBox(height: 24.h),
            AppButton(
              text: S.current.signup,
              borderRadius: 8.r,
              isPrimary: false,
              onPressed: () {
                context.navigateAndReplace(RouterPath.signup);
              },
            ),
          ],
        ),
      ),
    );
  }
}
