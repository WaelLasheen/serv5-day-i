import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FaqItemWidget extends StatelessWidget {
  final int index;
  final String question;
  final String answer;
  final bool isExpanded;
  final VoidCallback onTap;

  const FaqItemWidget({
    super.key,
    required this.index,
    required this.question,
    required this.answer,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context).extension<AppTheme>()!;
    final Color borderColor = isExpanded
        ? appTheme.primaryColor
        : appTheme.boarderPrimary;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: appTheme.surfaceColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        children: [
          _FaqHeader(
            index: index,
            question: question,
            isExpanded: isExpanded,
            onTap: onTap,
          ),
          if (isExpanded) ...[
            Divider(height: 1, thickness: 1, color: appTheme.boarderPrimary),
            _FaqBody(answer: answer),
          ],
        ],
      ),
    );
  }
}

class _FaqHeader extends StatelessWidget {
  final int index;
  final String question;
  final bool isExpanded;
  final VoidCallback onTap;

  const _FaqHeader({
    required this.index,
    required this.question,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context).extension<AppTheme>()!;
    final String numberStr = (index + 1).toString().padLeft(2, '0');
    final Color badgeColor = isExpanded
        ? appTheme.primaryColor
        : appTheme.grey700;

    return InkWell(
      onTap: onTap,
      borderRadius: isExpanded
          ? BorderRadius.vertical(top: Radius.circular(12.r))
          : BorderRadius.circular(12.r),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Row(
          children: [
            _buildNumberBadge(numberStr, badgeColor, appTheme.surfaceColor),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                question,
                style: FontStyles.bodyMedium.copyWith(
                  fontWeight: FontWeight.w500,
                  color: appTheme.textPrimary,
                  fontSize: 14.sp,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(width: 8.w),
            Icon(
              isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: appTheme.grey700,
              size: 20.w,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberBadge(String number, Color bgColor, Color textColor) {
    return Container(
      width: 32.w,
      height: 32.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        number,
        style: FontStyles.bodyMedium.copyWith(
          fontWeight: FontWeight.w500,
          color: textColor,
          fontSize: 14.sp,
        ),
      ),
    );
  }
}

class _FaqBody extends StatelessWidget {
  final String answer;

  const _FaqBody({required this.answer});

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context).extension<AppTheme>()!;

    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 4.w,
            height: 21.h,
            margin: EdgeInsets.only(top: 2.h),
            decoration: BoxDecoration(
              color: const Color(
                0xFFF56E14,
              ), // Orange indicator color (not in theme)
              borderRadius: BorderRadius.circular(999.r),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              answer,
              style: FontStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.w400,
                color: appTheme.grey800,
                fontSize: 14.sp,
                height: 1.5,
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
