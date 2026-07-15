import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/generated/l10n.dart';

class ChatbotHeader extends StatelessWidget implements PreferredSizeWidget {
  const ChatbotHeader({super.key});

  @override
  Size get preferredSize => Size.fromHeight(76.h);

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    return Container(
      height: preferredSize.height + MediaQuery.of(context).padding.top,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 16.h,
        bottom: 16.h,
        left: 16.w,
        right: 16.w,
      ),
      decoration: BoxDecoration(
        color: theme.surfaceColor,
        border: Border(
          bottom: BorderSide(color: theme.boarderPrimary, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 44.r,
                height: 44.r,
                decoration: const BoxDecoration(
                  color: Color(0xFFEDEDFC),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.smart_toy_outlined,
                    color: theme.primaryColor,
                    size: 24.r,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).markevaSmart,
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: theme.textPrimary,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Container(
                        width: 8.r,
                        height: 8.r,
                        decoration: const BoxDecoration(
                          color: Color(0xFF12BF26),
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        S.of(context).alwaysActive,
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                          color: theme.grey600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: 44.r,
            height: 44.r,
            decoration: BoxDecoration(
              color: theme.surfaceColor,
              border: Border.all(color: theme.boarderPrimary),
              shape: BoxShape.circle,
            ),
            child: Center(child: Icon(Icons.more_horiz, color: theme.grey600)),
          ),
        ],
      ),
    );
  }
}
