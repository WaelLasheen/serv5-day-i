import 'package:day_i/core/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;
  final Widget? icon;
  final BorderSide? border;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final double? borderRadius;
  final bool isIconTrailing;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isPrimary = true,
    this.icon,
    this.border,
    this.width,
    this.height,
    this.backgroundColor,
    this.textColor,
    this.fontSize,
    this.borderRadius,
    this.isIconTrailing = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget buttonContent() {
      if (icon == null) {
        return Text(text);
      }
      
      final content = [
        if (!isIconTrailing) icon!,
        if (!isIconTrailing) SizedBox(width: 8.w),
        Text(text),
        if (isIconTrailing) SizedBox(width: 8.w),
        if (isIconTrailing) icon!,
      ];

      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: content,
      );
    }

    final buttonStyle = isPrimary 
      ? ElevatedButton.styleFrom(
          side: border,
          backgroundColor: backgroundColor,
          shape: borderRadius != null 
            ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius!.r))
            : null,
          textStyle: TextStyle(
            fontFamily: 'Rubik',
            fontSize: fontSize?.sp,
            fontWeight: FontWeight.w500,
          ),
          foregroundColor: textColor ?? Colors.white,
          elevation: backgroundColor != null ? 0 : null,
          padding: EdgeInsets.zero,
        )
      : OutlinedButton.styleFrom(
          side: border,
          foregroundColor: textColor,
          shape: borderRadius != null 
            ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius!.r))
            : null,
          textStyle: TextStyle(
            fontFamily: 'Rubik',
            fontSize: fontSize?.sp,
            fontWeight: FontWeight.w500,
          ),
          padding: EdgeInsets.zero,
        );

    return SizedBox(
      width: width ?? context.width,
      height: height?.h,
      child: isPrimary 
          ? ElevatedButton(
              onPressed: onPressed,
              style: buttonStyle,
              child: buttonContent(),
            )
          : OutlinedButton(
              onPressed: onPressed,
              style: buttonStyle,
              child: buttonContent(),
            ),
    );
  }
}
