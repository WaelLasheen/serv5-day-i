import 'package:day_i/core/router/router_path.dart';
import 'package:day_i/core/theme/app_theme.dart';
import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/core/utils/extensions/snack_bar_extension.dart';
import 'package:day_i/core/widgets/app_button.dart';
import 'package:day_i/features/services/presentation/controller/service_cubit/service_cubit.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceCategoriesScreen extends StatelessWidget {
  const ServiceCategoriesScreen({super.key});

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
    final themeColors = Theme.of(context).extension<AppTheme>()!;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          S.current.serviceCategories,
          style: FontStyles.h2.copyWith(
            color: themeColors.textPrimary,
            fontSize: 20.sp,
          ),
        ),
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: themeColors.boarderPrimary, height: 1),
        ),
      ),
      body: BlocConsumer<ServiceCubit, ServiceState>(
        listener: (context, state) {
          if (state is ServiceFailure) {
            context.showErrorSnackBar(message: state.message);
          }
        },
        builder: (context, state) {
          if (state is ServiceLoading || state is ServiceInitial) {
            return _buildShimmer();
          } else if (state is ServiceSuccess) {
            final categories = state.services;
            if (categories.isEmpty) {
              return Center(
                child: Text(
                  S.current.noServicesAvailable,
                  style: FontStyles.bodyMedium.copyWith(
                    color: themeColors.textSecondary,
                    fontSize: 14.sp,
                  ),
                ),
              );
            }

            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              itemCount: categories.length,
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemBuilder: (context, index) {
                final category = categories[index];
                final icon = _categoryIcons[index % _categoryIcons.length];

                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouterPath.services,
                      arguments: category.id,
                    );
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFAF8FF),
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        color: const Color(0xFF6C63FF).withValues(alpha: 0.3),
                        width: 1.2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(
                            0xFF6C63FF,
                          ).withValues(alpha: 0.06),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 48.w,
                          height: 48.h,
                          decoration: BoxDecoration(
                            color: themeColors.blueLight,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              icon,
                              color: themeColors.primaryColor,
                              size: 24.r,
                            ),
                          ),
                        ),
                        SizedBox(width: 14.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                category.title,
                                style: FontStyles.h3.copyWith(
                                  color: themeColors.textPrimary,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              if (category.description.isNotEmpty) ...[
                                SizedBox(height: 6.h),
                                Text(
                                  category.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: FontStyles.bodyMedium.copyWith(
                                    color: themeColors.textSecondary,
                                    fontSize: 13.sp,
                                    height: 1.4,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is ServiceFailure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.current.oopsError,
                    style: FontStyles.bodyMedium.copyWith(
                      color: themeColors.textSecondary,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  AppButton(
                    text: Localizations.localeOf(context).languageCode == 'ar'
                        ? S.of(context).retry
                        : 'Retry',
                    onPressed: () {
                      context.read<ServiceCubit>().getServices(
                        Localizations.localeOf(context).languageCode,
                      );
                    },
                    width: 140.w,
                    height: 40.h,
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildShimmer() {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      itemCount: 6,
      separatorBuilder: (_, __) => SizedBox(height: 16.h),
      itemBuilder: (_, __) => Container(
        height: 84.h,
        decoration: BoxDecoration(
          color: const Color(0xFFEEEEEE),
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
    );
  }
}
