import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class OrderHistoryShimmer extends StatelessWidget {
  const OrderHistoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      separatorBuilder: (context, index) => SizedBox(height: 16.h),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: appTheme.grey200,
          highlightColor: appTheme.surfaceColor,
          child: Container(
            height: 149.h,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: appTheme.grey500, width: 1.w),
              borderRadius: BorderRadius.circular(12.r),
              color: appTheme.surfaceColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(16.r),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left-side circular badge placeholder (Platform)
                        Container(
                          width: 30.r,
                          height: 30.r,
                          decoration:  BoxDecoration(
                            shape: BoxShape.circle,
                            color: appTheme.surfaceColor,
                          ),
                        ),
                        SizedBox(width: 16.w),
                        // Middle text column (Title, Date, Request No)
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 150.w,
                                height: 16.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.r),
                                  color: appTheme.surfaceColor,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Row(
                                children: [
                                  Container(
                                    width: 60.w,
                                    height: 12.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.r),
                                      color: appTheme.surfaceColor,
                                    ),
                                  ),
                                  SizedBox(width: 12.w),
                                  Container(
                                    width: 50.w,
                                    height: 12.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.r),
                                      color: appTheme.surfaceColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 16.w),
                        // Right-side Status Tag
                        Container(
                          width: 64.w,
                          height: 32.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(999.r),
                            color: appTheme.surfaceColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Bottom row details/budget divider
                Container(
                  height: 1.h,
                  color: appTheme.grey200,
                ),
                Container(
                  height: 52.h,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 80.w,
                        height: 16.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: appTheme.surfaceColor,
                        ),
                      ),
                      Container(
                        width: 87.w,
                        height: 24.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: appTheme.surfaceColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
