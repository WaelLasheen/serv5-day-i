import 'package:day_i/core/di/di.dart';
import 'package:day_i/core/router/path_not_found.dart';
import 'package:day_i/core/router/router_path.dart';
import 'package:day_i/features/auth/presentation/screen/forgot_password_screen.dart';
import 'package:day_i/features/auth/presentation/screen/login_screen.dart';
import 'package:day_i/features/auth/presentation/screen/signup_screen.dart';
import 'package:day_i/features/auth/presentation/screen/otp_screen.dart';
import 'package:day_i/features/auth/presentation/screen/reset_password_screen.dart';
import 'package:day_i/features/maps/domain/usecases/search_places_usecase.dart';
import 'package:day_i/features/maps/presentation/map_cubit/maps_cubit.dart';
import 'package:day_i/features/nav_bar/presentation/screen/nav_bar_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        return MaterialPageRoute(builder: (context) => OtpScreen(email: email));

      case RouterPath.resetPassword:
        return MaterialPageRoute(
          builder: (context) => const ResetPasswordScreen(),
        );

      case RouterPath.navBar:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => MapsCubit(getIt<SearchPlacesUseCase>()),
              ),
            ],
            child: const NavBarScreen(),
          ),
        );
      default:
        return MaterialPageRoute(builder: (context) => const PathNotFound());
    }
  }
}
