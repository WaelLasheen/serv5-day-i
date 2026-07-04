import 'package:day_i/core/di/di.dart';
import 'package:day_i/core/utils/consts/image_path.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/features/auth/presentation/widget/auth_header.dart';
import 'package:day_i/features/auth/presentation/widget/create_account_fields.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  final _companyNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _industryController = TextEditingController();
  final _selectedPlanController = TextEditingController();

  @override
  void dispose() {
    _companyNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _industryController.dispose();
    _selectedPlanController.dispose();
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
              title: S.current.createCompany,
              subtitle: S.current.createCompanySubtitle,
              imagePath: imagePath
                  .marketingConsulting, // This is from the CSS comment "Marketing consulting-rafiki 1"
            ),
            SizedBox(height: 30.h),
            CreateAccountFields(
              formKey: _formKey,
              companyNameController: _companyNameController,
              emailController: _emailController,
              phoneController: _phoneController,
              industryController: _industryController,
              selectedPlanController: _selectedPlanController,
            ),
          ],
        ),
      ),
    );
  }
}
