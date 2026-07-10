import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';

class BotMessageBubble extends StatelessWidget {
  final String text;
  final Widget? content;

  const BotMessageBubble({super.key, required this.text, this.content});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32.r,
          height: 32.r,
          decoration: const BoxDecoration(
            color: Color(0xFFEDEDFC),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              Icons.smart_toy_outlined,
              color: theme.primaryColor,
              size: 16.r,
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: theme.grey200,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24.r),
                    bottomRight: Radius.circular(24.r),
                    topLeft: isRtl ? Radius.circular(24.r) : Radius.zero,
                    topRight: isRtl ? Radius.zero : Radius.circular(24.r),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 24.r,
                      height: 24.r,
                      decoration: const BoxDecoration(
                        color: Color(0xFFEDEDFC),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.content_copy_outlined, // Using copy icon as standard for bot messages
                          color: theme.primaryColor,
                          size: 14.r,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        text,
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 16.sp,
                          height: 1.5,
                          color: theme.textPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (content != null) ...[
                SizedBox(height: 12.h),
                content!,
              ],
            ],
          ),
        ),
      ],
    );
  }
}
