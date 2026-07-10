import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';

class OrderDetailsBottomBar extends StatelessWidget {
  const OrderDetailsBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final appTheme = context.appTheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: appTheme.surfaceColor,
        border: Border(
          top: BorderSide(color: appTheme.boarderPrimary),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 48.r,
            height: 48.r,
            decoration: BoxDecoration(
              border: Border.all(color: appTheme.primaryColor),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: IconButton(
              icon: Icon(
                Icons.share_outlined,
                color: appTheme.primaryColor,
                size: 24.r,
              ),
              onPressed: () {
                // TODO: Share action
              },
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: SizedBox(
              height: 48.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: appTheme.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  elevation: 0,
                ),
                onPressed: () {
                  // TODO: Download PDF action
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.file_download_outlined,
                      color: appTheme.surfaceColor,
                      size: 20.r,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      l10n.downloadPdfLabel,
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: appTheme.surfaceColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
