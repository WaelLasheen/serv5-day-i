import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ServicesShimmerLoading extends StatelessWidget {
  const ServicesShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(top: 24.h, bottom: 100.h),
      child: Column(
        children: [
          const ServiceCategoryShimmerWidget(),
          SizedBox(height: 32.h),
          const ServiceCategoryShimmerWidget(),
        ],
      ),
    );
  }
}

class ServiceCategoryShimmerWidget extends StatelessWidget {
  const ServiceCategoryShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;
    final baseColor = appTheme.grey500;
    final highlightColor = appTheme.grey200;

    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category Title and Description Shimmer
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 140.w,
                  height: 18.h,
                  decoration: BoxDecoration(
                    color: appTheme.surfaceColor,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
                SizedBox(height: 12.h),
                Container(
                  width: 260.w,
                  height: 14.h,
                  decoration: BoxDecoration(
                    color: appTheme.surfaceColor,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          // Horizontal List of 2 Pricing Card Shimmers
          SizedBox(
            height: 280.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: 2, // only 2 cards per section
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: Container(
                    width: 295.w,
                    height: 260.h,
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      color: appTheme.surfaceColor,
                      border: Border.all(color: appTheme.surfaceColor),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Icon placeholder
                            Container(
                              width: 28.sp,
                              height: 28.sp,
                              decoration: BoxDecoration(
                                color: appTheme.surfaceColor,
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                            ),
                            SizedBox(height: 16.h),
                            // Title placeholder
                            Container(
                              width: 150.w,
                              height: 14.h,
                              decoration: BoxDecoration(
                                color: appTheme.surfaceColor,
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                            ),
                            SizedBox(height: 8.h),
                            // Description placeholder
                            Container(
                              width: 200.w,
                              height: 11.h,
                              decoration: BoxDecoration(
                                color: appTheme.surfaceColor,
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                            ),
                            SizedBox(height: 24.h),
                            // Slug/Price placeholder
                            Container(
                              width: 80.w,
                              height: 16.h,
                              decoration: BoxDecoration(
                                color: appTheme.surfaceColor,
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                            ),
                          ],
                        ),
                        // Button placeholder
                        Container(
                          width: double.infinity,
                          height: 37.h,
                          decoration: BoxDecoration(
                            color: appTheme.surfaceColor,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
