import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FontStyles {
  static TextStyle get h1 => TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
  );

  static TextStyle get h2 =>
      TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700);

  static TextStyle get h3 =>
      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600);

  static TextStyle get bodyLarge =>
      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.normal);

  static TextStyle get bodyMedium =>
      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.normal);

  static TextStyle get bodySmall =>
      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.normal);

  static TextStyle get button =>
      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600);

  static TextStyle get label => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: Colors.grey,
  );
}
