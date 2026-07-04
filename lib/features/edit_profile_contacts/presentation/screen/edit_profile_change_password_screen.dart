import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/core/widgets/app_button.dart';
import 'package:day_i/core/widgets/custom_form_field.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileChangePasswordScreen extends StatefulWidget {
  const EditProfileChangePasswordScreen({super.key});

  @override
  State<EditProfileChangePasswordScreen> createState() =>
      _EditProfileChangePasswordScreenState();
}

class _EditProfileChangePasswordScreenState
    extends State<EditProfileChangePasswordScreen> {
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
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: theme.backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          S.current.changePassword,
          style: FontStyles.h3.copyWith(color: theme.textPrimary),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: theme.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.h),
          child: Container(color: theme.boarderPrimary, height: 1.h),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomFormField(
              label: S.current.currentPassword,
              hintText: 'نص تلميحي',
              controller: _currentPasswordController,
              isPassword: true,
            ),
            SizedBox(height: 24.h),
            CustomFormField(
              label: S.current.newPassword,
              hintText: 'نص تلميحي',
              controller: _newPasswordController,
              isPassword: true,
            ),
            SizedBox(height: 24.h),
            CustomFormField(
              label: S.current.confirmPassword,
              hintText: 'نص تلميحي',
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
            AppButton(
              text: S.current.changePassword,
              onPressed: () {
                // Action to change password
              },
              backgroundColor: theme.primaryColor,
              textColor: Colors.white,
              borderRadius: 8,
              height: 48,
            ),
          ],
        ),
      ),
    );
  }
}
