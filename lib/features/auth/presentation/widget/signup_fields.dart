import 'package:day_i/core/router/router_path.dart';
import 'package:day_i/core/utils/extensions/navigation_extension.dart';
import 'package:day_i/core/utils/extensions/snack_bar_extension.dart';
import 'package:day_i/features/auth/domain/params/register_params.dart';
import 'package:day_i/features/auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:day_i/features/auth/presentation/widget/form_take_action.dart';
import 'package:day_i/features/auth/presentation/widget/signup_form.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupFields extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final ValueNotifier<bool> isTermsAcceptedNotifier;

  const SignupFields({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.isTermsAcceptedNotifier,
    required this.nameController,
    required this.phoneController,
    required this.confirmPasswordController,
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
            SignupForm(
              nameController: nameController,
              phoneController: phoneController,
              emailController: emailController,
              passwordController: passwordController,
              confirmPasswordController: confirmPasswordController,
              isTermsAcceptedNotifier: isTermsAcceptedNotifier,
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  context.showSuccessSnackBar(
                    message: S.current.accountCreatedSuccessFully,
                  );
                  context.read<AuthCubit>().disposeControllers();
                  context.navigateAndReplace(RouterPath.navBar);
                } else if (state is AuthError) {
                  context.showErrorSnackBar(message: state.message);
                }
              },
              builder: (context, state) {
                return FormTakeAction(
                  primaryButtonText: S.current.signup,
                  onPrimaryPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<AuthCubit>().register(
                        RegisterParams(
                          name: nameController.text.trim(),
                          phone: phoneController.text.trim(),
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                          passwordConfirmation: confirmPasswordController.text
                              .trim(),
                        ),
                      );
                    }
                  },
                  footerNormalText: S.current.alreadyHaveAccount,
                  footerActionText: S.current.registerNow,
                  onFooterActionPressed: () =>
                      context.navigateAndReplace(RouterPath.login),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
