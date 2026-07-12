import 'package:day_i/core/theme/app_theme.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceInfoSection extends StatelessWidget {
  final String title;
  final double rating;
  final int reviewsCount;
  final String executionTime;

  const ServiceInfoSection({
    super.key,
    required this.title,
    required this.rating,
    required this.reviewsCount,
    required this.executionTime,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppTheme>();
    final l10n = S.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: theme?.textPrimary ?? const Color(0xFF121212),
                fontWeight: FontWeight.w600,
              ),
        ),
        SizedBox(height: 12.h),

        // Ratings & Time
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Ratings
            Row(
              children: [
                Icon(Icons.star, color: const Color(0xFFF56E14), size: 24.w),
                SizedBox(width: 8.w),
                Text(
                  rating.toStringAsFixed(1),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: const Color(0xFFF56E14),
                        fontWeight: FontWeight.w500,
                      ),
                ),
                SizedBox(width: 8.w),
                Text(
                  '($reviewsCount تقييم)', // Will use translation in full implementation or keep static if mixed
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: theme?.textSecondary ?? const Color(0xFF636262),
                      ),
                ),
              ],
            ),
            
            // Execution Time Badge
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: theme?.blueLight ?? const Color(0xFFC8C6F7), // Fallback to provided light blue active
                borderRadius: BorderRadius.circular(999.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.access_time,
                    size: 20.w,
                    color: theme?.textPrimary ?? const Color(0xFF121212),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    l10n.executionTime(executionTime),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: theme?.textPrimary ?? const Color(0xFF121212),
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
