import 'package:day_i/core/router/path_not_found.dart';
import 'package:day_i/core/router/router_path.dart';
import 'package:day_i/features/splash/ui/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  AppRouter();

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterPath.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      default:
        return MaterialPageRoute(builder: (context) => const PathNotFound());
    }
  }
}
