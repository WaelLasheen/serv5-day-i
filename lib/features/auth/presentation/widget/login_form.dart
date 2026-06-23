import 'package:day_i/core/router/router_path.dart';
import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/core/utils/extensions/navigation_extension.dart';
import 'package:day_i/core/utils/services/validation_service.dart';
import 'package:day_i/core/widgets/custom_form_field.dart';
import 'package:day_i/features/auth/presentation/widget/terms_and_conditions.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final ValueNotifier<bool> isTermsAcceptedNotifier;

  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.isTermsAcceptedNotifier,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    return Column(
      spacing: 16.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomFormField(
          controller: emailController,
          label: S.current.email,
          hintText: "rania@gmail.com",
          prefixIcon: const Icon(Icons.email_outlined),
          keyboardType: TextInputType.emailAddress,
          validator: ValidationService.validateEmail,
          textInputAction: TextInputAction.next,
        ),
        CustomFormField(
          isPassword: true,
          controller: passwordController,
          label: S.current.password,
          hintText: "********",
          validator: ValidationService.validatePassword,
          textInputAction: TextInputAction.done,
        ),
        TextButton(
          onPressed: () => context.navigateTo(RouterPath.forgotPassword),
          child: Text(
            S.current.forgotPasswordTitle,
            style: FontStyles.label.copyWith(color: theme.errorColor),
          ),
        ),
        TermsAndConditions(isTermsAcceptedNotifier: isTermsAcceptedNotifier),
      ],
    );
  }
}
