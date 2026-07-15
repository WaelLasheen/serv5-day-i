import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/core/utils/extensions/snack_bar_extension.dart';

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
          width: 36.r,
          height: 36.r,
          decoration: const BoxDecoration(
            color: Color(0xFFEDEDFC),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              Icons.smart_toy_outlined,
              color: theme.primaryColor,
              size: 20.r,
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
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.zero,
                    topEnd: Radius.circular(24.r),
                    bottomStart: Radius.circular(24.r),
                    bottomEnd: Radius.circular(24.r),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    if (text.isNotEmpty) ...[
                      SizedBox(width: 12.w),
                      InkWell(
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: text));
                          context.showSuccessSnackBar(
                            message: isRtl
                                ? 'تم نسخ النص بنجاح'
                                : 'Copied to clipboard',
                            avoidBotButton: false,
                          );
                        },
                        borderRadius: BorderRadius.circular(16.r),
                        child: Container(
                          width: 28.r,
                          height: 28.r,
                          decoration: const BoxDecoration(
                            color: Color(0xFFEDEDFC),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.content_copy_outlined,
                              color: theme.primaryColor,
                              size: 14.r,
                            ),
                          ),
                        ),
                      ),
                    ],
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
