import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/features/order_history/domain/entities/order_entity.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderCard extends StatelessWidget {
  final OrderEntity order;
  final VoidCallback? onViewDetails;

  const OrderCard({
    super.key,
    required this.order,
    this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;

    // Determine status badge colors
    Color statusBgColor;
    Color statusTextColor;
    String localizedStatusText;

    switch (order.status.toLowerCase()) {
      case 'approved':
      case 'completed':
        statusBgColor = const Color(0xFFE8F2ED);
        statusTextColor = const Color(0xFF147B4D);
        localizedStatusText = S.of(context).approved;
        break;
      case 'late':
        statusBgColor = const Color(0xFFFDE8E8);
        statusTextColor = const Color(0xFFE02424);
        localizedStatusText = S.of(context).late;
        break;
      case 'pending':
      default:
        statusBgColor = const Color(0xFFFBF6EC);
        statusTextColor = const Color(0xFFD7A842);
        localizedStatusText = S.of(context).pending;
        break;
    }

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: appTheme.surfaceColor,
        border: Border.all(color: appTheme.boarderPrimary, width: 1.w),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Platform Icon / Logo
                _buildPlatformIcon(order.platform),
                SizedBox(width: 16.w),
                
                // Details (Title, Date, Request number)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        order.title,
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: appTheme.textPrimary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Text(
                            order.date,
                            style: TextStyle(
                              fontFamily: 'Rubik',
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: appTheme.textSecondary,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Text(
                            order.code,
                            style: TextStyle(
                              fontFamily: 'Rubik',
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: appTheme.textSecondary,
                            ),
                          ),
                        ],
                      ),
                      if (order.employeeName != null && order.employeeName!.isNotEmpty) ...[
                        SizedBox(height: 4.h),
                        Text(
                          S.of(context).employeeLabel(order.employeeName!),
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: appTheme.grey800,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ],
                  ),
                ),
                SizedBox(width: 8.w),
                
                // Status Badge
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: statusBgColor,
                    borderRadius: BorderRadius.circular(999.r),
                  ),
                  child: Text(
                    localizedStatusText,
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      color: statusTextColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Divider
          Container(
            height: 1.h,
            color: appTheme.boarderPrimary,
          ),
          
          // Action / Budget row
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Budget Text
                Text(
                  S.of(context).budgetLabel(order.budget.toStringAsFixed(0)),
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: appTheme.textSecondary,
                  ),
                ),
                
                // View Details button
                TextButton(
                  onPressed: onViewDetails,
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    S.of(context).viewDetails,
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: appTheme.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlatformIcon(String platform) {
    Color bg;
    IconData icon;

    switch (platform.toLowerCase()) {
      case 'facebook':
        bg = const Color(0xFF1877F2);
        icon = Icons.facebook;
        break;
      case 'instagram':
        bg = const Color(0xFFF00073);
        icon = Icons.camera_alt_outlined;
        break;
      case 'google':
        bg = Colors.white;
        return Container(
          width: 30.r,
          height: 30.r,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFE9E9E9)),
            color: Colors.white,
          ),
          child: Center(
            child: Icon(
              Icons.search,
              size: 16.r,
              color: Colors.blue,
            ),
          ),
        );
      default:
        bg = const Color(0xFF4F46E5);
        icon = Icons.assignment_outlined;
        break;
    }

    return Container(
      width: 30.r,
      height: 30.r,
      decoration: BoxDecoration(
        color: bg,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Icon(
          icon,
          color: Colors.white,
          size: 18.r,
        ),
      ),
    );
  }
}
