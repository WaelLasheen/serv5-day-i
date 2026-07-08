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
import 'package:day_i/features/nav_bar/presentation/screen/nav_bar_screen.dart';
import 'package:day_i/features/profile/presentation/screen/profile_screen.dart';
import 'package:day_i/features/services/presentation/screen/services_screen.dart';
import 'package:day_i/features/services/presentation/controller/service_cubit/service_cubit.dart';
import 'package:day_i/features/services/domain/use_case/get_services_use_case.dart';
import 'package:day_i/features/edit_profile_contacts/presentation/screen/edit_profile_contacts_screen.dart';
import 'package:day_i/features/edit_profile_contacts/presentation/screen/edit_profile_change_password_screen.dart';
import 'package:day_i/features/pricing_plans/presentation/screen/pricing_plans_screen.dart';
import 'package:day_i/features/privacy/presentation/screen/privacy_screen.dart';
import 'package:day_i/features/contacts/presentation/screen/contacts_screen.dart';
import 'package:day_i/features/splash/presentation/screens/onboarding_screen.dart';
import 'package:day_i/features/splash/presentation/screens/splash_screen.dart';
import 'package:day_i/features/home/presentation/screen/home_screen.dart';
import 'package:day_i/features/notification/presentation/pages/notification_screen.dart';
import 'package:day_i/features/notification/presentation/controller/notification_cubit/notification_cubit.dart';
import 'package:day_i/features/payment/presentation/screen/add_payment_method_screen.dart';
import 'package:day_i/features/payment/presentation/screen/payment_screen.dart';
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
      case RouterPath.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case RouterPath.onboarding:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );

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

      case RouterPath.pricingPlans:
        return MaterialPageRoute(
          builder: (context) => const PricingPlansScreen(),
        );

      case RouterPath.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case RouterPath.navBar:
        return MaterialPageRoute(builder: (context) => const NavBarScreen());

      case RouterPath.services:
        return MaterialPageRoute(
          builder: (context) {
            final langCode = Localizations.localeOf(context).languageCode;
            return BlocProvider(
              create: (_) =>
                  ServiceCubit(getServicesUseCase: getIt<GetServicesUseCase>())
                    ..getServices(langCode),
              child: const ServicesScreen(),
            );
          },
        );

      case RouterPath.editProfileContacts:
        return MaterialPageRoute(
          builder: (context) => const EditProfileContactsScreen(),
        );
      case RouterPath.editProfileChangePassword:
        return MaterialPageRoute(
          builder: (context) => const EditProfileChangePasswordScreen(),
        );
      case RouterPath.privacy:
        return MaterialPageRoute(builder: (_) => PrivacyScreen());

      case RouterPath.contacts:
        final initialTabIndex = settings.arguments as int? ?? 0;
        return MaterialPageRoute(
          builder: (_) => ContactsScreen(initialTabIndex: initialTabIndex),
        );

      case RouterPath.notifications:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                getIt<NotificationCubit>()..fetchNotifications(),
            child: const NotificationScreen(),
          ),
        );

      case RouterPath.profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());

      case RouterPath.addPayment:
        return MaterialPageRoute(
          builder: (_) => const AddPaymentMethodScreen(),
        );

      case RouterPath.payment:
        return MaterialPageRoute(builder: (_) => const PaymentScreen());

      default:
        return MaterialPageRoute(builder: (context) => const PathNotFound());
    }
  }
}
