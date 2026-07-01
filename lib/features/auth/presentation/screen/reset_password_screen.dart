import 'package:day_i/core/di/di.dart';
import 'package:day_i/core/utils/consts/image_path.dart';
import 'package:day_i/core/utils/extensions/dialog_extensions.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/core/utils/extensions/snack_bar_extension.dart';
import 'package:day_i/features/auth/domain/params/change_password_params.dart';
import 'package:day_i/features/auth/presentation/controller/change_password_cubit/change_password_cubit.dart';
import 'package:day_i/features/auth/presentation/widget/auth_header.dart';
import 'package:day_i/features/auth/presentation/widget/reset_fields_widget.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final formKey = GlobalKey<FormState>();
    final changePasswordCubit = context.read<ChangePasswordCubit>();
    final passwordController = changePasswordCubit.passwordController;
    final confirmPasswordController =
        changePasswordCubit.confirmPasswordController;
    final isTermsAcceptedNotifier = changePasswordCubit.isTermsAcceptedNotifier;

    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50.h),
            AuthHeader(
              title: S.current.resetPassword,
              subtitle: S.current.enterStrongPasswordToProtectYourAccount,
              imagePath: getIt<ImagePath>().marketingConsulting,
            ),

            SizedBox(height: 30.h),
            BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
              listener: (context, state) {
                if (state is ChangePasswordSuccess) {
                  context.showSuccessDialog();
                }
                if (state is ChangePasswordFailure) {
                  context.showErrorSnackBar(message: state.message);
                }
              },
              builder: (context, state) {
                return ResetFieldsWidget(
                  formKey: formKey,
                  theme: theme,
                  passwordController: passwordController,
                  confirmPasswordController: confirmPasswordController,
                  isTermsAcceptedNotifier: isTermsAcceptedNotifier,
                  onSuccess: () {
                    if (state is VerifySuccess &&
                        isTermsAcceptedNotifier.value) {
                      changePasswordCubit.changePassword(
                        ChangePasswordParams(
                          password: passwordController.text.trim(),
                          passwordConfirmation: confirmPasswordController.text
                              .trim(),
                          bearerToken: state.verifyEntity.token,
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
