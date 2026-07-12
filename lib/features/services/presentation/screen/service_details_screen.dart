import 'package:day_i/core/theme/app_theme.dart';
import 'package:day_i/features/services/presentation/widget/review_order_bottom_sheet.dart';
import 'package:day_i/features/services/presentation/widget/service_bottom_bar.dart';
import 'package:day_i/features/services/presentation/widget/service_header_image.dart';
import 'package:day_i/features/services/presentation/widget/service_includes_section.dart';
import 'package:day_i/features/services/presentation/widget/service_info_section.dart';
import 'package:day_i/features/services/presentation/widget/service_reviews_section.dart';
import 'package:day_i/features/services/presentation/widget/similar_services_section.dart';
import 'package:day_i/features/services/presentation/widget/why_choose_us_section.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceDetailsScreen extends StatelessWidget {
  const ServiceDetailsScreen({super.key});

  void _showReviewOrderBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: const ReviewOrderBottomSheet(
          serviceName: 'إدارة الحملات الإعلانية',
          price: '899\$', // In Figma it was 899$ or 899 ر.س, we use $ for now
          executionTime: '5-7',
          tax: '15',
          totalPrice: '899\$',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppTheme>();
    final l10n = S.of(context);

    // Mock data based on Figma
    final includes = [
      'إعداد الاستراتيجية الإعلانية',
      'إنشاء الحملة على المنصة المطلوبة',
      'كتابة النصوص الإعلانية',
      'تصميم الصور أو الفيديوهات الإعلانية',
      'مراقبة الأداء اليومي والتحسين',
      'تقرير نهائي مفصل بالنتائج',
    ];

    final features = [
      FeatureItem(
        icon: Icons.insert_chart,
        title: 'تقارير دورية',
        subtitle: 'تواصل مستمر وتقارير شفافة توضح كل تفاصيل صرف ميزانيتك.',
        iconColor: const Color(0xFF14B8A6), // Green
        backgroundColor: const Color(0xFFDCF4F2), // Light Green
      ),
      FeatureItem(
        icon: Icons.gps_fixed,
        title: 'استهداف دقيق',
        subtitle: 'نستخدم بيانات دقيقة للوصول لعملائك المحتملين بكفاءة عالية.',
        iconColor: const Color(0xFF4F46E5), // Blue
        backgroundColor: const Color(0xFFE5E3FB), // Light Blue
      ),
      FeatureItem(
        icon: Icons.rocket_launch,
        title: 'نتائج أسرع',
        subtitle: 'منهجية عمل متطورة تضمن الوصول لأهدافك في وقت قياسي.',
        iconColor: const Color(0xFFF56E14), // Orange
        backgroundColor: const Color(0xFFFEE9DC), // Light Orange
      ),
    ];

    final reviews = [
      ReviewItem(
        authorName: 'عبدالله القحطاني',
        dateString: 'منذ يومين',
        comment:
            'الخدمة ممتازة جداً وفريق العمل احترافي في التعامل والاستجابة. لاحظت فرق في النتائج من أول أسبوع.',
        rating: 5,
      ),
      ReviewItem(
        authorName: 'عبدالله القحطاني',
        dateString: 'منذ يومين',
        comment:
            'الخدمة ممتازة جداً وفريق العمل احترافي في التعامل والاستجابة. لاحظت فرق في النتائج من أول أسبوع.',
        rating: 5,
      ),
    ];

    final similarServices = [
      SimilarServiceItem(
        title: 'إدارة حسابات التواصل',
        price: '450 ر.س',
        rating: 4.8,
        imageUrl: 'assets/images/similar_service_1.png',
      ),
      SimilarServiceItem(
        title: 'إدارة حسابات التواصل',
        price: '450 ر.س',
        rating: 4.8,
        imageUrl: 'assets/images/similar_service_2.png',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          l10n.serviceDetailsLabel,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ServiceHeaderImage(
              imageUrl: 'assets/images/service_header.png',
              categoryName: 'التسويق الرقمي',
            ),
            SizedBox(height: 32.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ServiceInfoSection(
                    title: 'إدارة الحملات الإعلانية',
                    rating: 4.9,
                    reviewsCount: 126,
                    executionTime: '5-7 أيام',
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    l10n.serviceDescription,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: theme?.textPrimary ?? const Color(0xFF121212),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'نقدم لك خدمة شاملة واحترافية لإنشاء وإدارة حملاتك الإعلانية عبر مختلف المنصات الرقمية. تركز علي استهداف الجمهور الصحيح بدقة لضمان أعلي مستويات الوصول والتحويل. مع تحسين مستمر للأداء لتقليل التكاليف وزيادة العائد علي الاستثمار.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: theme?.textSecondary ?? const Color(0xFF636262),
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  ServiceIncludesSection(items: includes),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
            WhyChooseUsSection(features: features),
            SizedBox(height: 32.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: ServiceReviewsSection(reviews: reviews, onViewAll: () {}),
            ),
            SizedBox(height: 32.h),
            SimilarServicesSection(services: similarServices),
            SizedBox(height: 48.h), // Spacing before bottom bar
          ],
        ),
      ),
      bottomNavigationBar: ServiceBottomBar(
        price: '899 ر.س',
        onRequestService: () => _showReviewOrderBottomSheet(context),
      ),
    );
  }
}
