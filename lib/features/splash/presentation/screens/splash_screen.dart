import 'dart:async';
import 'package:day_i/core/database/database_keys.dart';
import 'package:day_i/core/database/database_service.dart';
import 'package:day_i/core/di/di.dart';
import 'package:day_i/core/utils/consts/image_path.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/core/utils/extensions/opacity_extension.dart';
import 'package:day_i/core/utils/extensions/size_extension.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'onboarding_screen.dart';
import 'register_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _scale = Tween<double>(
      begin: 0.85,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _controller.forward();

    // Navigate to onboarding after a short delay.
    Timer(const Duration(milliseconds: 2200), _goToOnboarding);
  }

  void _goToOnboarding() {
    if (!mounted) return;
    final hasSeenOnboarding =
        getIt<DatabaseService>().getBool(DatabaseKeys.hasSeenOnboarding) ??
            false;
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (_, __, ___) => hasSeenOnboarding
            ? const RegisterScreen()
            : const OnboardingScreen(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;
    final textTheme = context.textTheme;

    return Scaffold(
      body: Container(
        width: context.width,
        height: context.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              appTheme.primaryColor,
              appTheme.primaryColor.withValues(alpha: 0.8),
            ],
          ),
        ),
        child: Stack(
          children: [
            // Decorative circle - top left
            Positioned(
              top: -45.h,
              left: -80.w,
              child: CircleAvatar(
                radius: 112.r,
                backgroundColor: Colors.black.withValues(alpha: .2),
              ),
            ),
            // Decorative circle - bottom right
            Positioned(
              bottom: -70.h,
              right: -90.w,
              child: CircleAvatar(
                radius: 112.r,
                backgroundColor: Colors.black.withValues(alpha: .2),
              ),
            ),
            SizedBox.shrink().withBlur(80),
            // Center content: logo + title + subtitle
            Center(
              child: FadeTransition(
                opacity: _fade,
                child: ScaleTransition(
                  scale: _scale,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        getIt<ImagePath>().logo,
                        width: 80.w,
                        height: 85.h,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        S.current.splashTagLine,
                        style: textTheme.bodyMedium?.copyWith(
                          color: appTheme.surfaceColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
