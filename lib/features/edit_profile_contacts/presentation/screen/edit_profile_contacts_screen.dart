import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/core/widgets/app_button.dart';
import 'package:day_i/core/widgets/custom_form_field.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileContactsScreen extends StatefulWidget {
  const EditProfileContactsScreen({super.key});

  @override
  State<EditProfileContactsScreen> createState() =>
      _EditProfileContactsScreenState();
}

class _EditProfileContactsScreenState extends State<EditProfileContactsScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
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
          S.current.editProfilePage,
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
              label: S.current.fullName,
              hintText: 'فؤاد بكر',
              controller: _nameController,
              prefixIcon: Icon(
                Icons.person_outline,
                color: theme.grey500,
              ),
            ),
            SizedBox(height: 24.h),
            CustomFormField(
              label: S.current.email,
              hintText: '*******',
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Icon(
                Icons.mail_outline,
                color: theme.grey500,
              ),
            ),
            SizedBox(height: 24.h),
            CustomFormField(
              label: S.current.phoneNumber,
              hintText: 'نص تلميحي',
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              prefixIcon: Icon(
                Icons.phone_outlined,
                color: theme.grey500,
              ),
            ),
            SizedBox(height: 32.h),
            AppButton(
              text: S.current.saveChanges,
              onPressed: () {},
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
