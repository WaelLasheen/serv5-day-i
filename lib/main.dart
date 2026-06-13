import 'package:day_i/core/di/di.dart';
import 'package:day_i/core/localization/logic/locale_cubit.dart';
import 'package:day_i/core/localization/logic/locale_state.dart';
import 'package:day_i/core/router/app_router.dart';
import 'package:day_i/core/router/router_path.dart';
import 'package:day_i/core/theme/app_themes.dart';
import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/l10n/app_localizations.dart';
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
        designSize: const Size(390, 884),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return BlocBuilder<LocaleCubit, LocaleState>(
            builder: (context, state) {
              return MaterialApp(
                title: 'Day I',
                locale: state.locale,
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: AppLocalizations.supportedLocales,
                debugShowCheckedModeBanner: false,
                // ----- will change when UI end -----
                theme: ThemeData(
                  textTheme: TextTheme(
                    displayLarge: FontStyles.h1,
                    displayMedium: FontStyles.h2,
                    displaySmall: FontStyles.h3,
                    headlineMedium: FontStyles.bodyLarge,
                    headlineSmall: FontStyles.bodyMedium,
                    titleLarge: FontStyles.bodySmall,
                    titleMedium: FontStyles.button,
                    titleSmall: FontStyles.label,
                  ),
                  extensions: [AppThemes.lightTheme],
                ),
                onGenerateRoute: getIt<AppRouter>().onGenerateRoute,
                initialRoute: RouterPath.splash,
              );
            },
          );
        },
      ),
    );
  }
}
