import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';

class UserMessageBubble extends StatelessWidget {
  final String text;

  const UserMessageBubble({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final theme = context.appTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: theme.primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24.r),
              bottomRight: Radius.circular(24.r),
              topLeft: isRtl ? Radius.zero : Radius.circular(24.r),
              topRight: isRtl ? Radius.circular(24.r) : Radius.zero,
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Rubik',
              fontSize: 16.sp,
              color: theme.surfaceColor,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
