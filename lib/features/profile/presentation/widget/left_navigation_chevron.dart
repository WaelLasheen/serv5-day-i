import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeftNavigationChevron extends StatelessWidget {
  const LeftNavigationChevron({super.key});

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.ltr,
      child: Icon(
        Icons.arrow_back_ios_new_rounded,
        size: 16.r,
        color: context.appTheme.primaryColor,
      ),
    );
  }
}