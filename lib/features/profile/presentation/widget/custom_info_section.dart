import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/core/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// The data model definition requested
class InfoModel {
  final String title;
  final String? description;
  final IconData icon;
  final Widget? trailing;

  const InfoModel({
    required this.title,
    this.description,
    required this.icon,
    this.trailing,
  });
}

class CustomInfoSection extends StatelessWidget {
  final String? sectionTitle;
  final List<InfoModel> infoData;
  final Widget? actionWidget;

  const CustomInfoSection({
    super.key,
    this.sectionTitle,
    required this.infoData,
    this.actionWidget,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;

    return Column(
      spacing: 12.h,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (sectionTitle != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                sectionTitle!,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                  height: 27 / 18,
                  color: appTheme.primaryColor,
                ),
              ),
              if (actionWidget != null) actionWidget!,
            ],
          ),

        Container(
          width: context.width,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: appTheme.surfaceColor,
            border: Border.all(color: appTheme.boarderPrimary, width: 1.r),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: infoData.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              final item = infoData[index];
              final isLast = index == infoData.length - 1;

              return Container(
                width: context.width,
                padding: EdgeInsets.symmetric(vertical: 12.h),
                decoration: BoxDecoration(
                  border: isLast
                      ? null
                      : Border(
                          bottom: BorderSide(
                            color: appTheme.boarderPrimary,
                            width: 1.r,
                          ),
                        ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Label Details + Leading Icon Group
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Circle Icon Frame Component
                        CircleAvatar(
                          radius: 15.r,
                          backgroundColor: appTheme.blueLight,
                          child: Center(
                            child: Icon(
                              item.icon,
                              color: appTheme.primaryColor,
                              size: 16.r,
                            ),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              item.title,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w500,
                                fontSize: 13.sp,
                                height: 20 / 13,
                                color: appTheme.textSecondary,
                              ),
                            ),
                            if (item.description != null) ...[
                              SizedBox(height: 8.h),
                              Text(
                                item.description!,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13.sp,
                                  height: 20 / 13,
                                  color: appTheme.textSecondary,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                    // Trailing Widget Layer
                    item.trailing ?? const SizedBox.shrink(),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
