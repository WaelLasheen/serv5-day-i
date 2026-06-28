import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class FontStyles {
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

// ---------- will use this class later ----------
class AppTextStyles {
  // 1. Define your centralized Font Family
  // Change 'Inter' to whatever font you download and register in your pubspec.yaml
  static const String fontFamily = 'Inter';

  // 2. Base Typography Structure (Private constructor to prevent instantiation)
  AppTextStyles._();

  // --- 2XL Styles ---
  static const TextStyle text2xlSemiBold = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24.0,
    fontWeight: FontWeight.w600, // SemiBold
    height: 1.33, // Maps to lineHeight/text2xl
    letterSpacing: 0.0,
  );

  // --- XL Styles ---
  static const TextStyle textXlSemiBold = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20.0,
    fontWeight: FontWeight.w600, // SemiBold
    height: 1.40, // Maps to lineHeight/textXl
    letterSpacing: 0.0,
  );

  // --- LG Styles ---
  static const TextStyle textLgBold = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18.0,
    fontWeight: FontWeight.w700, // Bold
    height: 1.55, // Maps to lineHeight/textLg
    letterSpacing: 0.0,
  );

  static const TextStyle textLgMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18.0,
    fontWeight: FontWeight.w500, // Medium
    height: 1.55, 
    letterSpacing: 0.0,
  );

  // --- MD Styles ---
  static const TextStyle textMdMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.0,
    fontWeight: FontWeight.w500, // Medium
    height: 1.50, // Maps to lineHeight/textMd
    letterSpacing: 0.0,
  );

  static const TextStyle textMdRegular = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.0,
    fontWeight: FontWeight.w400, // Regular
    height: 1.50,
    letterSpacing: 0.0,
  );

  // --- SM Styles ---
  static const TextStyle textSmMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.0,
    fontWeight: FontWeight.w500, // Medium
    height: 1.43, // Maps to lineHeight/textSm
    letterSpacing: 0.0,
  );

  static const TextStyle textSmRegular = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.0,
    fontWeight: FontWeight.w400, // Regular
    height: 1.43,
    letterSpacing: 0.0,
  );
}
