import 'package:day_i/core/di/di.dart';
import 'package:day_i/core/router/router_path.dart';
import 'package:day_i/core/utils/consts/image_path.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/core/utils/extensions/navigation_extension.dart';
import 'package:day_i/core/utils/extensions/snack_bar_extension.dart';
import 'package:day_i/features/auth/domain/params/send_otp_params.dart';
import 'package:day_i/features/auth/presentation/controller/change_password_cubit/change_password_cubit.dart';
import 'package:day_i/features/auth/presentation/widget/auth_header.dart';
import 'package:day_i/features/auth/presentation/widget/forgot_password_fields.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
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
              title: S.current.forgotPasswordTitle,
              subtitle: S.current.forgotPasswordSubtitle,
              imagePath: imagePath.marketingConsulting,
            ),
            BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
              listener: (context, state) {
                if (state is SendOtpSuccess) {
                  context.navigateAndReplace(
                    RouterPath.otp,
                    arguments: _phoneController.text.trim(),
                  );
                }
                if (state is ChangePasswordFailure) {
                  context.showErrorSnackBar(message: state.message);
                }
              },
              builder: (context, state) {
                return ForgotPasswordFields(
                  formKey: _formKey,
                  phoneController: _phoneController,
                  onSubmit: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<ChangePasswordCubit>().sendOtp(
                        SendOtpParams(phone: _phoneController.text.trim()),
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
