import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/core/widgets/custom_switch.dart';
class PrivacyToggleRow extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool showDivider;
  final String? infoText;

  const PrivacyToggleRow({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.showDivider = true,
    this.infoText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
            border: showDivider
                ? Border(
                    bottom: BorderSide(color: theme.boarderPrimary),
                  )
                : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                    color: theme.textPrimary,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              SizedBox(width: 16.w),
              CustomSwitch(
                value: value,
                onChanged: onChanged,
              ),
            ],
          ),
        ),
        if (infoText != null)
          Padding(
            padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.help_outline_rounded,
                  color: theme.grey500,
                  size: 20.r,
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    infoText!,
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: theme.grey600,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
