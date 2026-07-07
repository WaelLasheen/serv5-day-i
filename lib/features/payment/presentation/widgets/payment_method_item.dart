import 'package:day_i/core/theme/app_theme.dart';
import 'package:day_i/core/theme/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodItem extends StatelessWidget {
  final String title;
  final String? iconAsset;
  final Widget? customIcon;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentMethodItem({
    super.key,
    required this.title,
    this.iconAsset,
    this.customIcon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context).extension<AppTheme>()!;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        margin: EdgeInsets.only(bottom: 12.h),
        decoration: BoxDecoration(
          color: appTheme.surfaceColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? appTheme.primaryColor : appTheme.grey200,
            width: isSelected ? 1.5 : 1.0,
          ),
        ),
        child: Row(
          children: [
            if (customIcon != null)
              customIcon!
            else if (iconAsset != null)
              Image.asset(
                iconAsset!,
                width: 40.w,
                height: 24.h,
                fit: BoxFit.contain,
              )
            else
              Icon(Icons.payment, size: 24.r, color: appTheme.grey500),

            Spacer(),

            Text(
              title,
              style: FontStyles.bodyLarge.copyWith(
                fontWeight: FontWeight.w600,
                color: appTheme.textPrimary,
              ),
            ),

            SizedBox(width: 16.w),

            Container(
              width: 20.r,
              height: 20.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? appTheme.primaryColor : appTheme.grey200,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 10.r,
                        height: 10.r,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: appTheme.primaryColor,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
