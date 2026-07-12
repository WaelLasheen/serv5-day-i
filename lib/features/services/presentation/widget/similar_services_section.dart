import 'package:day_i/core/theme/app_theme.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SimilarServiceItem {
  final String title;
  final String price;
  final double rating;
  final String imageUrl;

  SimilarServiceItem({
    required this.title,
    required this.price,
    required this.rating,
    required this.imageUrl,
  });
}

class SimilarServicesSection extends StatelessWidget {
  final List<SimilarServiceItem> services;

  const SimilarServicesSection({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppTheme>();
    final l10n = S.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.similarServices,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: theme?.textPrimary ?? const Color(0xFF121212),
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 16.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: services
                .map(
                  (service) => Padding(
                    padding: EdgeInsets.only(left: 16.w),
                    child: Container(
                      width: 253.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: theme?.grey500 ?? const Color(0xFFDEDEDE),
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
                          // Image
                          Padding(
                            padding: EdgeInsets.all(16.w),
                            child: Container(
                              width: double.infinity,
                              height: 128.h,
                              decoration: BoxDecoration(
                                color: theme?.grey500 ?? Colors.grey[200],
                                borderRadius: BorderRadius.circular(12.r),
                                image: DecorationImage(
                                  image: AssetImage(service.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          // Details
                          Padding(
                            padding: EdgeInsets.only(
                              left: 16.w,
                              right: 16.w,
                              bottom: 16.h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  service.title,
                                  style: Theme.of(context).textTheme.titleMedium
                                      ?.copyWith(
                                        color:
                                            theme?.textPrimary ??
                                            const Color(0xFF121212),
                                        fontWeight: FontWeight.w500,
                                      ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 8.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: const Color(0xFFF56E14),
                                          size: 20.w,
                                        ),
                                        SizedBox(width: 4.w),
                                        Text(
                                          service.rating.toStringAsFixed(1),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                color: const Color(0xFFF56E14),
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      service.price,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color:
                                                theme?.primaryColor ??
                                                const Color(0xFF4F46E5),
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
