import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';

class ServiceSuggestionChip extends StatelessWidget {
  final String text;

  const ServiceSuggestionChip({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: const Color(0xFFEDEDFC),
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Rubik',
          fontSize: 16.sp,
          color: theme.primaryColor,
          height: 1.5,
        ),
      ),
    );
  }
}

class ServiceSuggestionRow extends StatelessWidget {
  final String text;

  const ServiceSuggestionRow({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
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
                Icons.check,
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
                color: const Color(0xFF303437),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
