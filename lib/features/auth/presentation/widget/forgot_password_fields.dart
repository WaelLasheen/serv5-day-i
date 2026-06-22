import 'package:day_i/core/utils/extensions/navigation_extension.dart';
import 'package:day_i/core/utils/services/validation_service.dart';
import 'package:day_i/core/widgets/app_text_form_field.dart';
import 'package:day_i/features/auth/presentation/widget/form_take_action.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordFields extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final VoidCallback onSubmit;

  const ForgotPasswordFields({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
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
        key: formKey,
        child: Column(
          spacing: 32.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextFormField(
              label: S.current.email,
              hintText: 'example@email.com',
              prefixIcon: const Icon(Icons.email_outlined),
              controller: emailController,
              validator: ValidationService.validateEmail,
              keyboardType: TextInputType.emailAddress,
            ),
            FormTakeAction(
              primaryButtonText: S.current.sendCode,
              onPrimaryPressed: onSubmit,
              footerNormalText: S.current.alreadyHaveAccount,
              footerActionText: S.current.login,
              onFooterActionPressed: () => context.navigateBack(),
            ),
          ],
        ),
      ),
    );
  }
}
