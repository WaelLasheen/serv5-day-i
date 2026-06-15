import 'package:day_i/core/router/path_not_found.dart';
import 'package:day_i/core/router/router_path.dart';
import 'package:day_i/features/auth/ui/login_screen.dart';
import 'package:day_i/features/auth/ui/signup_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  AppRouter();

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterPath.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RouterPath.signup:
        return MaterialPageRoute(builder: (context) => const SignupScreen());
      default:
        return MaterialPageRoute(builder: (context) => const PathNotFound());
    }
  }
}
