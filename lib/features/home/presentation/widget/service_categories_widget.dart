import 'package:day_i/core/router/router_path.dart';
import 'package:day_i/features/services/presentation/controller/service_cubit/service_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';

class ServiceCategoriesWidget extends StatelessWidget {
  const ServiceCategoriesWidget({super.key});

  static const List<IconData> _categoryIcons = [
    Icons.description,
    Icons.grid_view,
    Icons.campaign,
    Icons.share,
    Icons.brush,
    Icons.code,
    Icons.videocam,
    Icons.photo_camera,
  ];

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(context).serviceCategories,
                style: FontStyles.h3.copyWith(
                  color: const Color(0xFF121212),
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouterPath.services);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      S.of(context).viewMore,
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        color: theme.primaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Icon(
                      isRtl
                          ? Icons.arrow_back_rounded
                          : Icons.arrow_forward_rounded,
                      size: 14.r,
                      color: theme.primaryColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          BlocBuilder<ServiceCubit, ServiceState>(
            builder: (context, state) {
              if (state is ServiceLoading || state is ServiceInitial) {
                return _buildShimmer();
              }

              if (state is ServiceSuccess && state.services.isNotEmpty) {
                final categories = state.services;
                return SizedBox(
                  height: 90.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: categories.length,
                    separatorBuilder: (context, index) =>
                        SizedBox(width: 16.w),
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      final icon =
                          _categoryIcons[index % _categoryIcons.length];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RouterPath.services,
                            arguments: category.id,
                          );
                        },
                        child: Container(
                          width: 90.w,
                          height: 90.h,
                          padding: EdgeInsets.all(10.w),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(color: const Color(0xFFDEDEDE)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                icon,
                                color: theme.primaryColor,
                                size: 24.r,
                              ),
                              SizedBox(height: 8.h),
                              Flexible(
                                child: Text(
                                  category.title,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: 'Rubik',
                                    color: const Color(0xFF636262),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }

              // Fallback: show shimmer on failure or empty
              return _buildShimmer();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildShimmer() {
    return SizedBox(
      height: 90.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        separatorBuilder: (_, __) => SizedBox(width: 16.w),
        itemBuilder: (_, __) => Container(
          width: 90.w,
          height: 90.h,
          decoration: BoxDecoration(
            color: const Color(0xFFEEEEEE),
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      ),
    );
  }
}
