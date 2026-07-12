import 'package:day_i/core/theme/app_theme.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewItem {
  final String authorName;
  final String dateString;
  final String comment;
  final double rating;

  ReviewItem({
    required this.authorName,
    required this.dateString,
    required this.comment,
    required this.rating,
  });
}

class ServiceReviewsSection extends StatelessWidget {
  final List<ReviewItem> reviews;
  final VoidCallback onViewAll;

  const ServiceReviewsSection({
    super.key,
    required this.reviews,
    required this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppTheme>();
    final l10n = S.of(context);

    return Column(
      children: [
        // Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              l10n.customerReviews,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: theme?.textPrimary ?? const Color(0xFF121212),
                    fontWeight: FontWeight.w500,
                  ),
            ),
            TextButton(
              onPressed: onViewAll,
              child: Text(
                l10n.viewAll,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: theme?.primaryColor ?? const Color(0xFF4F46E5),
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        // Review List
        Column(
          children: reviews
              .map((review) => Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: Container(
                      padding: EdgeInsets.all(24.w),
                      decoration: BoxDecoration(
                        color: theme?.blueLight ?? const Color(0xFFEDEDFC),
                        border: Border.all(
                          color: const Color(0xFFC8C6F7), // active light blue border
                        ),
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Author info & Rating
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  // Avatar
                                  Container(
                                    width: 40.w,
                                    height: 40.w,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFC8C6F7),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Text(
                                        review.authorName.isNotEmpty
                                            ? review.authorName[0]
                                            : '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                              color: const Color(0xFF00236F), // Dark blue text
                                              fontWeight: FontWeight.w700,
                                            ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12.w),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        review.authorName,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              color: theme?.textPrimary ??
                                                  const Color(0xFF121212),
                                            ),
                                      ),
                                      Text(
                                        review.dateString,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: theme?.textSecondary ??
                                                  const Color(0xFF636262),
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              // Rating stars
                              Row(
                                children: List.generate(
                                  5,
                                  (index) => Icon(
                                    index < review.rating
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: const Color(0xFFF56E14),
                                    size: 16.w,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            review.comment,
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: const Color(0xFF444651),
                                  height: 1.5,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
