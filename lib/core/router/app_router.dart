import 'package:day_i/core/di/di.dart';
import 'package:day_i/core/router/path_not_found.dart';
import 'package:day_i/core/router/router_path.dart';
import 'package:day_i/features/auth/domain/use_case/login_use_case.dart';
import 'package:day_i/features/auth/domain/use_case/register_use_case.dart';
import 'package:day_i/features/auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:day_i/features/auth/presentation/screen/forgot_password_screen.dart';
import 'package:day_i/features/auth/presentation/screen/login_screen.dart';
import 'package:day_i/features/auth/presentation/screen/signup_screen.dart';
import 'package:day_i/features/auth/presentation/screen/otp_screen.dart';
import 'package:day_i/features/auth/presentation/screen/reset_password_screen.dart';
import 'package:day_i/features/nav_bar/presentation/screen/nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late AuthCubit _authCubit;
  AppRouter() {
    _authCubit = AuthCubit(
      loginUseCase: getIt<LoginUseCase>(),
      registerUseCase: getIt<RegisterUseCase>(),
    );
  }

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterPath.login:
        return MaterialPageRoute(
          builder: (context) =>
              BlocProvider.value(value: _authCubit, child: const LoginScreen()),
        );
      case RouterPath.signup:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _authCubit,
            child: const SignupScreen(),
          ),
        );
      case RouterPath.forgotPassword:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordScreen(),
        );
      case RouterPath.otp:
        final email = settings.arguments as String? ?? '';
        return MaterialPageRoute(builder: (context) => OtpScreen(email: email));

      case RouterPath.resetPassword:
        return MaterialPageRoute(
          builder: (context) => const ResetPasswordScreen(),
        );

      case RouterPath.navBar:
        return MaterialPageRoute(builder: (context) => const NavBarScreen());
      default:
        return MaterialPageRoute(builder: (context) => const PathNotFound());
    }
  }
}
