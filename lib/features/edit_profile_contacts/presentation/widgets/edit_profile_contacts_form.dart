import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/core/widgets/app_button.dart';
import 'package:day_i/core/widgets/custom_form_field.dart';
import 'package:day_i/generated/l10n.dart';

class EditProfileContactsForm extends StatefulWidget {
  const EditProfileContactsForm({super.key});

  @override
  State<EditProfileContactsForm> createState() => _EditProfileContactsFormState();
}

class _EditProfileContactsFormState extends State<EditProfileContactsForm> {
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

    return Column(
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
    );
  }
}
