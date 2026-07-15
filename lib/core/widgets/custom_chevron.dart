import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomChevron extends StatelessWidget {
  final Color? color;
  final double? size;
  final IconData? ltrIcon;
  final IconData? rtlIcon;

  const CustomChevron({
    super.key,
    this.color,
    this.size,
    this.ltrIcon = Icons.arrow_back_rounded,
    this.rtlIcon = Icons.arrow_forward_rounded,
  });

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    return Icon(
      isRtl ? rtlIcon! : ltrIcon!,
      color: color ?? context.appTheme.primaryColor,
      size: size ?? 16.r,
    );
  }
}
