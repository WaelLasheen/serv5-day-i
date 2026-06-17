import 'package:day_i/core/router/router_path.dart';
import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/core/utils/extensions/navigation_extension.dart';
import 'package:day_i/core/utils/services/validation_service.dart';
import 'package:day_i/core/widgets/app_button.dart';
import 'package:day_i/core/widgets/app_text_form_field.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50.h),
            _ForgotPasswordHeader(context: context),
            SizedBox(height: 30.h),
            _ForgotPasswordForm(
              formKey: _formKey,
              emailController: _emailController,
              onSubmit: () {
                if (_formKey.currentState!.validate()) {
                  context.navigateTo(
                    RouterPath.otp,
                    arguments: _emailController.text.trim(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ForgotPasswordHeader extends StatelessWidget {
  final BuildContext context;

  const _ForgotPasswordHeader({required this.context});

  @override
  Widget build(BuildContext context) {
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
            S.current.forgotPasswordTitle,
            style: FontStyles.h1.copyWith(color: Colors.white),
          ),
          SizedBox(height: 8.h),
          Text(
            S.current.forgotPasswordSubtitle,
            textAlign: TextAlign.center,
            style: FontStyles.bodyMedium.copyWith(
              color: Colors.white.withAlpha(200),
            ),
          ),
        ],
      ),
    );
  }
}

class _ForgotPasswordForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final VoidCallback onSubmit;

  const _ForgotPasswordForm({
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextFormField(
              hintText: 'example@email.com',
              prefixIcon: const Icon(Icons.email_outlined),
              controller: emailController,
              validator: ValidationService.validateEmail,
              keyboardType: TextInputType.emailAddress, label: S.current.email,
            ),
            SizedBox(height: 30.h),
            AppButton(
              text: S.current.sendCode,
              onPressed: onSubmit,
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}

