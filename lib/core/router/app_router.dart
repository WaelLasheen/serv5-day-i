import 'package:day_i/core/di/di.dart';
import 'package:day_i/core/router/path_not_found.dart';
import 'package:day_i/core/router/router_path.dart';
import 'package:day_i/features/auth/domain/use_case/change_password_use_case.dart';
import 'package:day_i/features/auth/domain/use_case/login_use_case.dart';
import 'package:day_i/features/auth/domain/use_case/register_use_case.dart';
import 'package:day_i/features/auth/domain/use_case/send_otp_use_case.dart';
import 'package:day_i/features/auth/domain/use_case/verify_use_case.dart';
import 'package:day_i/features/auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:day_i/features/auth/presentation/controller/change_password_cubit/change_password_cubit.dart';
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
  late AuthCubit _authCubit;
  late ChangePasswordCubit _changePasswordCubit;
  AppRouter() {
    _authCubit = AuthCubit(
      loginUseCase: getIt<LoginUseCase>(),
      registerUseCase: getIt<RegisterUseCase>(),
    );
    _changePasswordCubit = ChangePasswordCubit(
      sendOtpUseCase: getIt<SendOtpUseCase>(),
      verifyUseCase: getIt<VerifyUseCase>(),
      changePasswordUseCase: getIt<ChangePasswordUseCase>(),
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
          builder: (context) => BlocProvider.value(
            value: _changePasswordCubit,
            child: const ForgotPasswordScreen(),
          ),
        );
      case RouterPath.otp:
        final phone = settings.arguments as String? ?? '';
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _changePasswordCubit,
            child: OtpScreen(phone: phone),
          ),
        );

      case RouterPath.resetPassword:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _changePasswordCubit,
            child: const ResetPasswordScreen(),
          ),
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
