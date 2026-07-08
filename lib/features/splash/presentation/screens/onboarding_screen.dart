import 'package:day_i/core/database/database_keys.dart';
import 'package:day_i/core/database/database_service.dart';
import 'package:day_i/core/di/di.dart';
import 'package:day_i/core/router/router_path.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/core/utils/extensions/navigation_extension.dart';
import 'package:day_i/core/utils/extensions/size_extension.dart';
import 'package:day_i/core/widgets/app_button.dart';
import 'package:day_i/features/splash/presentation/models/onboarding_data.dart';
import 'package:day_i/features/splash/presentation/widgets/onboarding_page.dart';
import 'package:day_i/features/splash/presentation/widgets/top_bar.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  final _currentPageNotifier = ValueNotifier(0);

  bool get _isLastPage =>
      _currentPageNotifier.value == onboardingPages.length - 1;

  void _onNextPressed() {
    if (_isLastPage) {
      _finishOnboarding();
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }
  }

  void _finishOnboarding() {
    getIt<DatabaseService>().setBool(DatabaseKeys.hasSeenOnboarding, true);
    context.navigateAndReplace(RouterPath.register);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _currentPageNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;
    return Scaffold(
      backgroundColor: appTheme.surfaceColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              TopBar(onSkip: _finishOnboarding),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: _currentPageNotifier,
                  builder: (_, _, _) {
                    return PageView.builder(
                      controller: _pageController,
                      itemCount: onboardingPages.length,
                      onPageChanged: (index) {
                        _currentPageNotifier.value = index;
                      },
                      itemBuilder: (context, index) {
                        return OnboardingPage(data: onboardingPages[index]);
                      },
                    );
                  },
                ),
              ),

              ValueListenableBuilder<int>(
                valueListenable: _currentPageNotifier,
                builder: (context, currentIndex, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(onboardingPages.length, (index) {
                      final bool isActive = index == currentIndex;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        margin: EdgeInsets.symmetric(
                          horizontal: 3.r,
                        ), 
                        height: 8.r,
                        width: isActive ? (8.r * 3.2) : 8.r,
                        decoration: BoxDecoration(
                          color: isActive
                              ? appTheme.primaryColor
                              : appTheme.grey700,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      );
                    }),
                  );
                },
              ),
              SizedBox(height: 24.h),
              AppButton(
                height: 56.h,
                width: context.width,
                text: S.current.next,
                onPressed: _onNextPressed,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
