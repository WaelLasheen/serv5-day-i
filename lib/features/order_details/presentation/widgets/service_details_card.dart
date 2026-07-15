import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/core/router/router_path.dart';
import 'package:day_i/core/utils/extensions/navigation_extension.dart';
import '../../domain/entities/order_details_entity.dart';

class ServiceDetailsCard extends StatelessWidget {
  final OrderDetailsEntity order;

  const ServiceDetailsCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final appTheme = context.appTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              l10n.serviceDetailsLabel,
              style: TextStyle(
                fontFamily: 'Rubik',
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                color: appTheme.grey600,
              ),
            ),
            Text(
              'مرتبط بـ الخدمة',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: appTheme.primaryColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              context.navigateTo(
                RouterPath.serviceDetails,
                arguments: order.serviceId ?? 1,
              );
            },
            borderRadius: BorderRadius.circular(12.r),
            child: Container(
              decoration: BoxDecoration(
                color: appTheme.surfaceColor,
                border: Border.all(color: appTheme.primaryColor.withValues(alpha: 0.3)),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.r),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      order.serviceName,
                                      style: TextStyle(
                                        fontFamily: 'Rubik',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.sp,
                                        color: appTheme.textPrimary,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 14.r,
                                    color: appTheme.primaryColor,
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                order.serviceCategory,
                                style: TextStyle(
                                  fontFamily: 'Rubik',
                                  fontSize: 14.sp,
                                  color: appTheme.grey600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Container(
                          width: 48.r,
                          height: 48.r,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFEF1E8),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.campaign_outlined,
                              color: const Color(0xFFF56E14),
                              size: 24.r,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(height: 1, color: appTheme.boarderPrimary),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 20.r,
                              color: appTheme.primaryColor,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              l10n.executionTimeLabel,
                              style: TextStyle(
                                fontFamily: 'Rubik',
                                fontSize: 14.sp,
                                color: appTheme.grey600,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          l10n.workingDays(order.executionDays.toString()),
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: appTheme.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

