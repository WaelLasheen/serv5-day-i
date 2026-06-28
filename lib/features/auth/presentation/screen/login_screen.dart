import 'package:day_i/core/di/di.dart';
import 'package:day_i/core/networking/token_manager/token_manager.dart';
import 'package:day_i/core/router/router_path.dart';
import 'package:day_i/core/utils/consts/image_path.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/features/auth/presentation/widget/auth_header.dart';
import 'package:day_i/features/auth/presentation/widget/login_fields.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final ValueNotifier<bool> _isTermsAcceptedNotifier = ValueNotifier<bool>(
    false,
  );

  @override
  void initState() {
    super.initState();
    // will be remove after adding splash screen
    handelNavByToken();
  }

  void handelNavByToken() async {
    final token = await getIt<ITokenManager>().getAccessToken();
    if (token != null && mounted) {
      Navigator.pushReplacementNamed(context, RouterPath.navBar);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _isTermsAcceptedNotifier.dispose();
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
              title: S.current.login,
              subtitle: S.current.loginSubtitle,
              imagePath: imagePath.marketingConsulting,
            ),
            SizedBox(height: 30.h),
            LoginFields(
              formKey: _formKey,
              emailController: _emailController,
              passwordController: _passwordController,
              isTermsAcceptedNotifier: _isTermsAcceptedNotifier,
            ),
          ],
        ),
      ),
    );
  }
}
