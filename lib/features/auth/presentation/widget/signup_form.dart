import 'package:day_i/core/utils/services/validation_service.dart';
import 'package:day_i/core/widgets/custom_form_field.dart';
import 'package:day_i/features/auth/presentation/widget/terms_and_conditions.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final ValueNotifier<bool> isTermsAcceptedNotifier;

  const SignupForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.isTermsAcceptedNotifier,
    required this.nameController,
    required this.phoneController,
    required this.confirmPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomFormField(
          controller: nameController,
          label: S.current.fullName,
          hintText: "رانيا بكر",
          prefixIcon: const Icon(Icons.person_outline),
          validator: ValidationService.validateFullName,
          textInputAction: TextInputAction.next,
        ),
        CustomFormField(
          controller: phoneController,
          label: S.current.password,
          hintText: "+20 101010100",
          prefixIcon: const Icon(Icons.call_outlined),
          keyboardType: TextInputType.phone,
          validator: ValidationService.validatePhoneNumber,
          textInputAction: TextInputAction.next,
        ),
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
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
        ),
        CustomFormField(
          isPassword: true,
          controller: confirmPasswordController,
          label: S.current.confirmPassword,
          hintText: "********",
          validator: (value) {
            return ValidationService.validateConfirmPassword(
              passwordController.text,
              value,
            );
          },
          textInputAction: TextInputAction.done,
        ),
        TermsAndConditions(isTermsAcceptedNotifier: isTermsAcceptedNotifier),
      ],
    );
  }
}
