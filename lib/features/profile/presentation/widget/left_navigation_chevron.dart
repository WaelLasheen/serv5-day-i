import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeftNavigationChevron extends StatelessWidget {
  const LeftNavigationChevron({super.key});

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    return Icon(
      isRtl ? Icons.arrow_back_rounded : Icons.arrow_forward_rounded,
      size: 16.r,
      color: context.appTheme.primaryColor,
    );
  }
}