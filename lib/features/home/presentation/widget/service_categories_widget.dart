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
                  Navigator.pushNamed(context, RouterPath.serviceCategories);
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
                  height: 92.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: categories.length,
                    separatorBuilder: (context, index) => SizedBox(width: 14.w),
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
                          width: 102.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 6.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFAF8FF),
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                              color: const Color(
                                0xFF6C63FF,
                              ).withValues(alpha: 0.5),
                              width: 1.2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(
                                  0xFF6C63FF,
                                ).withValues(alpha: 0.08),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(icon, color: theme.primaryColor, size: 22.r),
                              SizedBox(height: 6.h),
                              Flexible(
                                child: Text(
                                  category.title,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: 'Rubik',
                                    color: const Color(0xFF121212),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 11.5.sp,
                                    height: 1.2,
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

              if (state is ServiceFailure) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: Text(
                      state.message,
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        color: Colors.red,
                        fontSize: 13.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }

              if (state is ServiceSuccess && state.services.isEmpty) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: Text(
                      S.of(context).noServicesAvailable,
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        color: const Color(0xFF636262),
                        fontSize: 13.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }

              return _buildShimmer();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildShimmer() {
    return SizedBox(
      height: 92.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        separatorBuilder: (_, __) => SizedBox(width: 14.w),
        itemBuilder: (_, __) => Container(
          width: 102.w,
          height: 92.h,
          decoration: BoxDecoration(
            color: const Color(0xFFEEEEEE),
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ),
    );
  }
}
