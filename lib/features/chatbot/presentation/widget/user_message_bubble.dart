import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';

class UserMessageBubble extends StatelessWidget {
  final String text;

  const UserMessageBubble({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75,
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadiusDirectional.only(
                bottomStart: Radius.circular(24.r),
                bottomEnd: Radius.circular(24.r),
                topStart: Radius.circular(24.r),
                topEnd: Radius.zero,
              ),
            ),
            child: Directionality(
              textDirection: Directionality.of(context),
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
          ),
        ],
      ),
    );
  }
}
