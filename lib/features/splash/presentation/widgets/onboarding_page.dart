import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/features/splash/presentation/models/onboarding_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingPageData data;

  const OnboardingPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;
    final textTheme = context.textTheme;

    return Column(
      children: [
        const SizedBox(height: 8),
        AspectRatio(
          aspectRatio: 1.15,
          child: SvgPicture.asset(
            data.imageAsset,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => Container(
              decoration: BoxDecoration(
                color: appTheme.backgroundColor,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Icon(
                Icons.image_outlined,
                size: 72.sp,
                color: appTheme.primaryColor,
              ),
            ),
          ),
        ),
        SizedBox(height: 40.h),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: textTheme.displayMedium?.copyWith(
              color: appTheme.textPrimary,
              fontWeight: FontWeight.w600,
              fontSize: 26.sp,
            ),
            children: [
              if (data.titlePrefix.isNotEmpty) TextSpan(text: data.titlePrefix),
              if (data.titleHighlight.isNotEmpty)
                TextSpan(
                  text: data.titleHighlight,
                  style: TextStyle(color: appTheme.secondaryColor),
                ),
              if (data.titleSuffix.isNotEmpty) TextSpan(text: data.titleSuffix),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          data.description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: appTheme.textSecondary,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}
