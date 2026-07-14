import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/core/widgets/app_button.dart';
import 'package:day_i/core/widgets/custom_form_field.dart';
import 'package:day_i/generated/l10n.dart';

class EditProfileChangePasswordForm extends StatefulWidget {
  const EditProfileChangePasswordForm({super.key});

  @override
  State<EditProfileChangePasswordForm> createState() =>
      _EditProfileChangePasswordFormState();
}

class _EditProfileChangePasswordFormState
    extends State<EditProfileChangePasswordForm> {
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _hasMinLength = false;
  bool _isNotCommon = false;
  bool _hasMixedChars = false;

  @override
  void initState() {
    super.initState();
    _newPasswordController.addListener(_validatePassword);
  }

  void _validatePassword() {
    final password = _newPasswordController.text;
    setState(() {
      _hasMinLength = password.length >= 8;
      _isNotCommon = password.isNotEmpty &&
          !['password', '12345678', '123456789', 'qwerty']
              .contains(password.toLowerCase());
      _hasMixedChars =
          RegExp(r'(?=.*[a-z])(?=.*[A-Z])(?=.*\d)').hasMatch(password);
    });
  }

  @override
  void dispose() {
    _newPasswordController.removeListener(_validatePassword);
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Widget _buildChecklistItem({
    required BuildContext context,
    required String text,
    required bool isActive,
  }) {
    final theme = context.appTheme;
    return Row(
      children: [
        Icon(
          isActive ? Icons.check_circle : Icons.circle_outlined,
          color: isActive ? theme.primaryColor : theme.grey500,
          size: 20.r,
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            text,
            style: FontStyles.bodyMedium.copyWith(
              color: isActive ? theme.primaryColor : theme.textSecondary,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomFormField(
          label: S.current.currentPassword,
          hintText: S.of(context).hintText,
          controller: _currentPasswordController,
          isPassword: true,
        ),
        SizedBox(height: 24.h),
        CustomFormField(
          label: S.current.newPassword,
          hintText: S.of(context).hintText,
          controller: _newPasswordController,
          isPassword: true,
        ),
        SizedBox(height: 24.h),
        CustomFormField(
          label: S.current.confirmPassword,
          hintText: S.of(context).hintText,
          controller: _confirmPasswordController,
          isPassword: true,
        ),
        SizedBox(height: 32.h),
        // Checklist
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildChecklistItem(
              context: context,
              text: S.current.passwordLength,
              isActive: _hasMinLength,
            ),
            SizedBox(height: 12.h),
            _buildChecklistItem(
              context: context,
              text: S.current.passwordNotPersonal,
              isActive: _isNotCommon,
            ),
            SizedBox(height: 12.h),
            _buildChecklistItem(
              context: context,
              text: S.current.passwordCaseAndNumbers,
              isActive: _hasMixedChars,
            ),
          ],
        ),
        SizedBox(height: 32.h),
        Row(
          children: [
            Expanded(
              child: AppButton(
                text: S.current.changePassword,
                onPressed: () {
                  // Action to change password
                },
                backgroundColor: theme.primaryColor,
                textColor: Colors.white,
                borderRadius: 8,
                height: 48,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: AppButton(
                text: S.of(context).cancel,
                isPrimary: false,
                textColor: theme.primaryColor,
                border: BorderSide(color: theme.primaryColor),
                borderRadius: 8,
                height: 48,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
