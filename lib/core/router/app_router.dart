import 'package:day_i/core/router/path_not_found.dart';
import 'package:day_i/core/router/router_path.dart';
import 'package:day_i/features/auth/presentation/screen/forgot_password_screen.dart';
import 'package:day_i/features/auth/presentation/screen/login_screen.dart';
import 'package:day_i/features/auth/presentation/screen/signup_screen.dart';
import 'package:day_i/features/auth/ui/otp_screen.dart';
<<<<<<< HEAD
import 'package:day_i/features/auth/ui/reset_password_screen.dart';
import 'package:day_i/features/auth/ui/signup_screen.dart';
=======
>>>>>>> 32557894cda0d2abeb99ecbb6aec2629fac8ebc6
import 'package:flutter/material.dart';

class AppRouter {
  AppRouter();

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterPath.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RouterPath.signup:
        return MaterialPageRoute(builder: (context) => const SignupScreen());
      case RouterPath.forgotPassword:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordScreen(),
        );
      case RouterPath.otp:
        final email = settings.arguments as String? ?? '';
        return MaterialPageRoute(
          builder: (context) => OtpScreen(email: email),
        );
        
      case RouterPath.resetPassword:
        return MaterialPageRoute(builder: (context) => const ResetPasswordScreen());
      default:
        return MaterialPageRoute(builder: (context) => const PathNotFound());
    }
  }
}
