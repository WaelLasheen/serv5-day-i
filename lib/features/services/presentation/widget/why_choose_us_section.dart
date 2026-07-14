import 'package:day_i/core/theme/app_theme.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeatureItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconColor;
  final Color backgroundColor;

  FeatureItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.iconColor,
    required this.backgroundColor,
  });
}

class WhyChooseUsSection extends StatelessWidget {
  final List<FeatureItem> features;

  const WhyChooseUsSection({
    super.key,
    required this.features,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppTheme>();
    final l10n = S.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.whyChooseMarkiva,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: theme?.textPrimary ?? const Color(0xFF121212),
                fontWeight: FontWeight.w500,
              ),
        ),
        SizedBox(height: 16.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: features
                .map((feature) => Padding(
                      padding: EdgeInsetsDirectional.only(start: 16.w),
                      child: Container(
                        width: 253.w,
                        padding: EdgeInsets.all(24.w),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.9), // fallback for blur
                          border: Border.all(
                            color: theme?.grey500 ?? const Color(0xFFDEDEDE),
                          ),
                          borderRadius: BorderRadius.circular(20.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: 48.w,
                              height: 48.w,
                              decoration: BoxDecoration(
                                color: feature.backgroundColor,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Icon(
                                  feature.icon,
                                  color: feature.iconColor,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              feature.title,
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: theme?.textPrimary ?? const Color(0xFF121212),
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              feature.subtitle,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: theme?.textSecondary ?? const Color(0xFF636262),
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
