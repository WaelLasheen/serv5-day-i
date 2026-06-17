import 'package:day_i/core/di/di.dart';
import 'package:day_i/core/router/router_path.dart';
import 'package:day_i/core/utils/consts/image_path.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/core/utils/extensions/navigation_extension.dart';
import 'package:day_i/core/utils/services/validation_service.dart';
import 'package:day_i/features/auth/presentation/widget/auth_header.dart';
import 'package:day_i/features/auth/presentation/widget/otp_fields.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpScreen extends StatefulWidget {
  final String email;
  const OtpScreen({super.key, required this.email});

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

  void _onVerify() {
    final error = ValidationService.validateOtp(_otpController.text);
    _hasErrorNotifier.value = error != null;
    if (error == null) {
      context.navigateTo(RouterPath.resetPassword);
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
            OtpFields(
              email: widget.email,
              otpController: _otpController,
              formKey: _formKey,
              onVerify: _onVerify,
              hasErrorNotifier: _hasErrorNotifier,
            ),
          ],
        ),
      ),
    );
  }
}
