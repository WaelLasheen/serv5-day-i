import 'package:day_i/core/di/di.dart';
import 'package:day_i/core/theme/app_theme.dart';
import 'package:day_i/core/utils/consts/image_path.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/features/auth/presentation/widget/auth_header.dart';
import 'package:day_i/features/auth/presentation/widget/form_take_action.dart';
import 'package:day_i/features/auth/presentation/widget/login_form.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final ValueNotifier<bool> _isTermsAcceptedNotifier = ValueNotifier<bool>(
    false,
  );

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _isTermsAcceptedNotifier.dispose();
    super.dispose();
  }

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
            AuthHeader(
              title: S.current.login,
              subtitle: S.current.loginSubtitle,
              imagePath: imagePath.marketingConsulting,
            ),
            SizedBox(height: 30.h),
            _buildLoginFields(context, theme),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginFields(BuildContext context, AppTheme theme) {
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
          spacing: 32.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoginForm(
              emailController: _emailController,
              passwordController: _passwordController,
              isTermsAcceptedNotifier: _isTermsAcceptedNotifier,
            ),
            FormTakeAction(
              primaryButtonText: S.current.login,
              onPrimaryPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
