import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBackButton extends StatelessWidget {
  final Color? color;
  final VoidCallback? onPressed;
  final double? size;

  const CustomBackButton({
    super.key,
    this.color,
    this.onPressed,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    return IconButton(
      icon: Icon(
        isRtl ? Icons.arrow_forward_rounded : Icons.arrow_back_rounded,
        color: color ?? context.appTheme.primaryColor,
        size: size ?? 24.r,
      ),
      onPressed: onPressed ?? () => Navigator.of(context).pop(),
    );
  }
}
