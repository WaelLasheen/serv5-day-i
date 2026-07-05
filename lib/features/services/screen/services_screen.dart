import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/core/theme/app_theme.dart';
import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/features/services/param/service_model.dart';
import 'package:day_i/features/services/widgets/pagination_widget.dart';
import 'package:day_i/features/services/widgets/service_category_widget.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeColors = Theme.of(context).extension<AppTheme>()!;
    final services = ServiceModel.getMockServices();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          S.current.services,
          style: FontStyles.h2.copyWith(
            color: themeColors.textPrimary,
            fontSize: 20.sp,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: themeColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: themeColors.boarderPrimary, height: 1),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
        },
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 24.h, bottom: 100.h),
          itemCount: 5, // 4 categories + 1 pagination widget
          itemBuilder: (context, index) {
            if (index == 4) {
              return PaginationWidget(themeColors: themeColors);
            }

            final categories = [
              {
                'title': 'إدارة السوشيال ميديا',
                'description':
                    'خدمات لإدارة وتطوير حساباتك على منصات التواصل الاجتماعي باحترافية.',
              },
              {
                'title': 'التصميم الجرافيكي',
                'description':
                    'تصاميم إبداعية تعكس هوية علامتك التجارية وتجذب الانتباه.',
              },
              {
                'title': 'برمجة المواقع والتطبيقات',
                'description':
                    'تطوير مواقع وتطبيقات ذكية تناسب احتياجات عملك.',
              },
              {
                'title': 'التسويق الرقمي',
                'description':
                    'خطط تسويقية متكاملة لزيادة مبيعاتك وانتشار علامتك.',
              },
            ];

            final cat = categories[index];
            return Padding(
              padding: EdgeInsets.only(bottom: 32.h),
              child: ServiceCategoryWidget(
                themeColors: themeColors,
                services: services,
                title: cat['title']!,
                description: cat['description']!,
              ),
            );
          },
        ),
      ),
    );
  }
}
