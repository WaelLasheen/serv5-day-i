import 'package:day_i/core/di/di.dart';
import 'package:day_i/core/utils/consts/image_path.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/features/auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:day_i/features/auth/presentation/widget/auth_header.dart';
import 'package:day_i/features/auth/presentation/widget/signup_fields.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final imagePath = getIt<ImagePath>();
    final formKey = GlobalKey<FormState>();
    final authCubit = context.read<AuthCubit>();

    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50.h),
            AuthHeader(
              title: S.current.signup,
              subtitle: S.current.signupSubtitle,
              imagePath: imagePath.marketingConsulting,
            ),
            SizedBox(height: 30.h),
            SignupFields(
              formKey: formKey,
              emailController: authCubit.emailController,
              passwordController: authCubit.passwordController,
              isTermsAcceptedNotifier: authCubit.isTermsAcceptedNotifier,
              nameController: authCubit.nameController,
              phoneController: authCubit.phoneController,
              confirmPasswordController: authCubit.confirmPasswordController,
            ),
          ],
        ),
      ),
    );
  }
}
