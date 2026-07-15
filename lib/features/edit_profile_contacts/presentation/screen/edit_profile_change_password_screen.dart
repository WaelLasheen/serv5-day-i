import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/edit_profile_change_password_form.dart';

class EditProfileChangePasswordScreen extends StatelessWidget {
  const EditProfileChangePasswordScreen({super.key});

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
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.h),
          child: Container(color: theme.boarderPrimary, height: 1.h),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: const EditProfileChangePasswordForm(),
      ),
    );
  }
}
