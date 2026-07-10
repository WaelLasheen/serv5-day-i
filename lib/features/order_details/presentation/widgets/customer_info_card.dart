import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import '../../domain/entities/order_details_entity.dart';

class CustomerInfoCard extends StatelessWidget {
  final OrderDetailsEntity order;

  const CustomerInfoCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final appTheme = context.appTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.customerInfoLabel,
          style: TextStyle(
            fontFamily: 'Rubik',
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            color: appTheme.grey600,
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: appTheme.surfaceColor,
            border: Border.all(color: appTheme.boarderPrimary),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.customerName,
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: appTheme.textPrimary,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      order.customerEmail,
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
                    Icons.person_outline,
                    color: const Color(0xFFF56E14),
                    size: 24.r,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
