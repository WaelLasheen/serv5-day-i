import 'package:day_i/core/di/di.dart';
import 'package:day_i/core/utils/consts/image_path.dart';
import 'package:day_i/core/utils/extensions/dialog_extensions.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/features/auth/presentation/widget/reset_fields_widget.dart';
import 'package:day_i/features/auth/presentation/widget/reset_password_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final imagePath = getIt<ImagePath>();

    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50.h),

            // 1. استدعاء الهيدر المنفصل
            const ResetPasswordHeader(),

            SizedBox(height: 20.h),
            SvgPicture.asset(
              imagePath.marketingConsulting,
              width: 150.w,
              height: 150.h,
            ),
            SizedBox(height: 30.h),
            // 2. استدعاء حقول الإدخال والـ Form المنفصلة وتمرير الداتا والـ Functions
            ResetFieldsWidget(
              formKey: _formKey,
              theme: theme,
              isTermsAccepted: _isTermsAccepted,
              onTermsChanged: (value) {
                setState(() {
                  _isTermsAccepted = value ?? false;
                });
              },
              onSuccess: () {
                // الاستدعاء الصحيح باسم الدالة المكتوبة جوه الـ Extension
                context.showSuccessDialog();
              },
            ),
          ],
        ),
      ),
    );
  }
}