import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/generated/l10n.dart';

class ChatInputField extends StatelessWidget {
  const ChatInputField({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(height: 1, color: theme.boarderPrimary),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
          decoration: BoxDecoration(
            color: theme.surfaceColor,
            borderRadius: BorderRadius.only(
              bottomLeft: isRtl ? Radius.zero : Radius.circular(48.r),
              bottomRight: isRtl ? Radius.circular(48.r) : Radius.zero,
            ),
          ),
          child: SafeArea(
            top: false,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 44.h,
                    decoration: BoxDecoration(
                      color: theme.surfaceColor,
                      border: Border.all(
                        color: theme.grey600,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(48.r),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 16.w),
                        Icon(
                          Icons.mic_none,
                          color: theme.grey600,
                          size: 20.r,
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: S.of(context).typeMessage,
                              hintStyle: TextStyle(
                                fontFamily: 'Rubik',
                                fontSize: 16.sp,
                                color: theme.grey600,
                              ),
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Container(
                  width: 44.r,
                  height: 44.r,
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Transform.flip(
                      flipX: isRtl,
                      child: Icon(
                        Icons.send_outlined,
                        color: theme.surfaceColor,
                        size: 20.r,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
