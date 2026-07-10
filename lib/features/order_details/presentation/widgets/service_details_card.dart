import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
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
        Text(
          l10n.serviceDetailsLabel,
          style: TextStyle(
            fontFamily: 'Rubik',
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            color: appTheme.grey600,
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          decoration: BoxDecoration(
            color: appTheme.surfaceColor,
            border: Border.all(color: appTheme.boarderPrimary),
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
                          Text(
                            order.serviceName,
                            style: TextStyle(
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              color: appTheme.textPrimary,
                            ),
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
      ],
    );
  }
}
