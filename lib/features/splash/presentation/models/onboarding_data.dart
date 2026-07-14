import 'package:day_i/core/di/di.dart';
import 'package:day_i/core/utils/consts/image_path.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';

class OnboardingPageData {
  final String imageAsset;
  final String titlePrefix; // black part of title (may be empty)
  final String titleHighlight; // orange part of title (may be empty)
  final String titleSuffix; // black part after highlight (may be empty)
  final String description;

  const OnboardingPageData({
    required this.imageAsset,
    this.titlePrefix = '',
    this.titleHighlight = '',
    this.titleSuffix = '',
    required this.description,
  });
}

/// Returns localized onboarding pages. Call inside a build method with a valid context.
List<OnboardingPageData> getOnboardingPages(BuildContext context) {
  final l10n = S.of(context);
  final imagePath = getIt<ImagePath>();
  return [
    OnboardingPageData(
      imageAsset: imagePath.setupAnalytics,
      titlePrefix: '',
      titleHighlight: l10n.onboarding1TitleHighlight,
      titleSuffix: l10n.onboarding1TitleSuffix,
      description: l10n.onboarding1Description,
    ),
    OnboardingPageData(
      imageAsset: imagePath.schedule,
      titlePrefix: l10n.onboarding2Title,
      description: l10n.onboarding2Description,
    ),
    OnboardingPageData(
      imageAsset: imagePath.atTheOffice,
      titlePrefix: l10n.onboarding3Title,
      description: l10n.onboarding3Description,
    ),
  ];
}
