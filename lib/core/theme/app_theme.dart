import 'package:flutter/material.dart';

class AppTheme extends ThemeExtension<AppTheme> {
  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;
  final Color surfaceColor;
  final Color errorColor;
  final Color textPrimary;
  final Color textSecondary;
  final Color grey500;
  final Color grey600;
  final Color grey700;
  final Color grey800;
  final Color boarderPrimary;
  final Color blueLight;

  final OutlineInputBorder outlineInputBorder;

  AppTheme({
    required this.primaryColor,
    required this.secondaryColor,
    required this.backgroundColor,
    required this.surfaceColor,
    required this.errorColor,
    required this.textPrimary,
    required this.textSecondary,
    required this.grey500,
    required this.grey600,
    required this.grey700,
    required this.grey800,
    required this.boarderPrimary,
    required this.blueLight,
    required this.outlineInputBorder,
  });

  @override
  AppTheme copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? backgroundColor,
    Color? surfaceColor,
    Color? errorColor,
    Color? textPrimary,
    Color? textSecondary,
    Color? grey500,
    Color? grey600,
    Color? grey700,
    Color? grey800,
    Color? boarderPrimary,
    Color? blueLight,
    OutlineInputBorder? outlineInputBorder,
  }) {
    return AppTheme(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      surfaceColor: surfaceColor ?? this.surfaceColor,
      errorColor: errorColor ?? this.errorColor,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      grey500: grey500 ?? this.grey500,
      grey600: grey600 ?? this.grey600,
      grey700: grey700 ?? this.grey700,
      grey800: grey800 ?? this.grey800,
      boarderPrimary: boarderPrimary ?? this.boarderPrimary,
      blueLight: blueLight ?? this.blueLight,
      outlineInputBorder: outlineInputBorder ?? this.outlineInputBorder,
    );
  }

  @override
  AppTheme lerp(covariant ThemeExtension<AppTheme>? other, double t) {
    if (other is! AppTheme) {
      return this;
    }

    return AppTheme(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      surfaceColor: Color.lerp(surfaceColor, other.surfaceColor, t)!,
      errorColor: Color.lerp(errorColor, other.errorColor, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      grey500: Color.lerp(grey500, other.grey500, t)!,
      grey600: Color.lerp(grey600, other.grey600, t)!,
      grey700: Color.lerp(grey700, other.grey700, t)!,
      grey800: Color.lerp(grey800, other.grey800, t)!,
      boarderPrimary: Color.lerp(boarderPrimary, other.boarderPrimary, t)!,
      blueLight: Color.lerp(blueLight, other.blueLight, t)!,
      outlineInputBorder: outlineInputBorder,
    );
  }
}
