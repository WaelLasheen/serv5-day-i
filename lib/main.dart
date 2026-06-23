import 'package:day_i/core/di/di.dart';
import 'package:day_i/core/localization/logic/locale_cubit.dart';
import 'package:day_i/core/localization/logic/locale_state.dart';
import 'package:day_i/core/router/app_router.dart';
import 'package:day_i/core/router/router_path.dart';
import 'package:day_i/core/theme/app_themes.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpLocators();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocaleCubit(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          final appThemes = AppThemes();
          return BlocBuilder<LocaleCubit, LocaleState>(
            builder: (_, state) {
              return MaterialApp(
                title: 'Day I',
                locale: state.locale,
                localizationsDelegates: [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                debugShowCheckedModeBanner: false,
                // ----- will change when UI end -----
                theme: appThemes.lightTheme,
                onGenerateRoute: getIt<AppRouter>().onGenerateRoute,
                initialRoute: RouterPath.login, //if you want to see pricing_plans put it instead of login
              );
            },
          );
        },
      ),
    );
  }
}


