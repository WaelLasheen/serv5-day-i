import 'package:day_i/core/di/di.dart';
import 'package:day_i/core/utils/consts/image_path.dart';

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

/// Content for the 3 onboarding slides, matching the provided designs.
final List<OnboardingPageData> onboardingPages = [
  OnboardingPageData(
    imageAsset: getIt<ImagePath>().setupAnalytics,
    titlePrefix: '',
    titleHighlight: 'ماركيفا',
    titleSuffix: '... إدارة تسويق أذكى',
    description:
        'كل أدوات التسويق اللي محتاجاها في مكان واحد\nمن التخطيط للتنفيذ والمتابعة.',
  ),
  OnboardingPageData(
    imageAsset: getIt<ImagePath>().schedule,
    titlePrefix: 'خطّط، نفّذ، تابع بسهولة',
    description: 'تابعي الحملات، المهام، والأداء\nبدون تعقيد أو تشتيت.',
  ),
  OnboardingPageData(
    imageAsset: getIt<ImagePath>().atTheOffice,
    titlePrefix: 'كل قراراتك مبنية على أرقام',
    description: 'تقارير واضحة تساعدك تاخدي القرار الصح\nفي الوقت الصح.',
  ),
];
