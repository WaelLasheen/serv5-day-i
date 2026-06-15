import 'package:day_i/core/di/di.dart';
import 'package:day_i/core/theme/app_theme.dart';
import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/core/utils/consts/image_path.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/core/utils/extensions/navigation_extension.dart';
import 'package:day_i/core/widgets/app_button.dart';
import 'package:day_i/core/widgets/app_password_form_field.dart';
import 'package:day_i/core/widgets/app_text_form_field.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
            _buildHeader(context),
            SizedBox(height: 20.h),
            SvgPicture.asset(
              imagePath.marketingConsulting,
              height: 180.h,
            ),
            SizedBox(height: 30.h),
            _buildSignupFields(context, theme),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => context.navigateBack(),
                icon: const Icon(Icons.arrow_back, color: Colors.white),
              ),
            ],
          ),
          Text(
            S.current.signup,
            style: FontStyles.h1.copyWith(color: Colors.white),
          ),
          SizedBox(height: 8.h),
          Text(
            S.current.signupSubtitle,
            textAlign: TextAlign.center,
            style: FontStyles.bodyMedium.copyWith(color: Colors.white.withAlpha(200)),
          ),
        ],
      ),
    );
  }

  Widget _buildSignupFields(BuildContext context, AppTheme theme) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(S.current.fullName, style: FontStyles.bodyMedium),
            SizedBox(height: 8.h),
            AppTextFormField(
              hintText: "رانيا بكر",
              prefixIcon: const Icon(Icons.person_outline),
            ),
            SizedBox(height: 20.h),
            Text(S.current.email, style: FontStyles.bodyMedium),
            SizedBox(height: 8.h),
            AppTextFormField(
              hintText: "rania@gmail.com",
              prefixIcon: const Icon(Icons.email_outlined),
            ),
            SizedBox(height: 20.h),
            Text(S.current.password, style: FontStyles.bodyMedium),
            SizedBox(height: 8.h),
            AppPasswordFormField(hintText: "********"),
            SizedBox(height: 20.h),
            Text(S.current.confirmPassword, style: FontStyles.bodyMedium),
            SizedBox(height: 8.h),
            AppPasswordFormField(hintText: "********"),
            SizedBox(height: 20.h),
            _buildTermsAndConditions(theme),
            SizedBox(height: 30.h),
            AppButton(
              text: S.current.signup,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Perform signup
                }
              },
            ),
            SizedBox(height: 30.h),
            _buildLoginPromt(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTermsAndConditions(AppTheme theme) {
    return Row(
      children: [
        Checkbox(
          value: _isTermsAccepted,
          onChanged: (value) => setState(() => _isTermsAccepted = value!),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
          activeColor: theme.primaryColor,
        ),
        Expanded(
          child: Text(
            S.current.termsAndConditions,
            style: FontStyles.label.copyWith(color: theme.primaryColor),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginPromt(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(S.current.alreadyHaveAccount, style: FontStyles.bodySmall),
        TextButton(
          onPressed: () => context.navigateBack(),
          child: Text(
            S.current.login,
            style: FontStyles.bodySmall.copyWith(
              color: context.appTheme.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
