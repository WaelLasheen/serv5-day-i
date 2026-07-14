import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/core/theme/app_theme.dart';

class PaginationWidget extends StatelessWidget {
  final AppTheme themeColors;

  const PaginationWidget({super.key, required this.themeColors});

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Previous double arrow (disabled on page 1)
        _buildPageItem(
          icon: isRtl
              ? Icons.keyboard_double_arrow_right
              : Icons.keyboard_double_arrow_left,
          themeColors: themeColors,
          iconColor: themeColors.grey700,
        ),
        SizedBox(width: 4.w),
        // Previous single arrow (disabled on page 1)
        _buildPageItem(
          icon: isRtl ? Icons.chevron_right : Icons.chevron_left,
          themeColors: themeColors,
          iconColor: themeColors.grey700,
        ),
        SizedBox(width: 4.w),
        _buildPageItem(text: '1', isActive: true, themeColors: themeColors),
        SizedBox(width: 4.w),
        _buildPageItem(text: '2', themeColors: themeColors),
        SizedBox(width: 4.w),
        _buildPageItem(text: '3', themeColors: themeColors),
        SizedBox(width: 4.w),
        _buildPageItem(text: '4', themeColors: themeColors),
        SizedBox(width: 4.w),
        // Next single arrow
        _buildPageItem(
          icon: isRtl ? Icons.chevron_left : Icons.chevron_right,
          themeColors: themeColors,
        ),
        SizedBox(width: 4.w),
        // Next double arrow
        _buildPageItem(
          icon: isRtl
              ? Icons.keyboard_double_arrow_left
              : Icons.keyboard_double_arrow_right,
          themeColors: themeColors,
        ),
      ],
    );
  }

  Widget _buildPageItem({
    String? text,
    IconData? icon,
    bool isActive = false,
    Color? iconColor,
    required AppTheme themeColors,
  }) {
    return Container(
      width: 32.w,
      height: 32.w,
      decoration: BoxDecoration(
        color: isActive ? themeColors.primaryColor : Colors.white,
        border: Border.all(
          color: isActive
              ? themeColors.primaryColor
              : themeColors.boarderPrimary,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      alignment: Alignment.center,
      child: text != null
          ? Text(
              text,
              style: TextStyle(
                color: isActive ? Colors.white : themeColors.textPrimary,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            )
          : Icon(
              icon,
              size: 16.sp,
              color: iconColor ?? themeColors.textPrimary,
            ),
    );
  }
}
