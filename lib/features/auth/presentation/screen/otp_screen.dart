import 'package:day_i/core/di/di.dart';
import 'package:day_i/core/router/router_path.dart';
import 'package:day_i/core/utils/consts/image_path.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/core/utils/extensions/navigation_extension.dart';
import 'package:day_i/core/services/validation_service.dart';
import 'package:day_i/core/utils/extensions/snack_bar_extension.dart';
import 'package:day_i/features/auth/domain/params/verify_params.dart';
import 'package:day_i/features/auth/presentation/controller/change_password_cubit/change_password_cubit.dart';
import 'package:day_i/features/auth/presentation/widget/auth_header.dart';
import 'package:day_i/features/auth/presentation/widget/otp_fields.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpScreen extends StatefulWidget {
  final String phone;
  const OtpScreen({super.key, required this.phone});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> _hasErrorNotifier = ValueNotifier(false);

  @override
  void dispose() {
    _otpController.dispose();
    _hasErrorNotifier.dispose();
    super.dispose();
  }

  Future<void> _onVerify() async {
    final error = ValidationService.validateOtp(_otpController.text);
    _hasErrorNotifier.value = error != null;
    if (error == null) {
      await context.read<ChangePasswordCubit>().verify(
        VerifyParams(phone: widget.phone, otp: _otpController.text),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50.h),
            AuthHeader(
              title: S.current.otpTitle,
              subtitle: S.current.otpSubtitle,
              imagePath: getIt<ImagePath>().marketingConsulting,
            ),
            SizedBox(height: 30.h),
            BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
              listener: (context, state) {
                if (state is ChangePasswordFailure) {
                  _hasErrorNotifier.value = true;
                  context.showErrorSnackBar(message: state.message);
                }
                if (state is VerifySuccess) {
                  context.navigateAndReplace(RouterPath.resetPassword);
                }
              },
              builder: (context, state) {
                return OtpFields(
                  phone: widget.phone,
                  otpController: _otpController,
                  formKey: _formKey,
                  onVerify: _onVerify,
                  hasErrorNotifier: _hasErrorNotifier,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
