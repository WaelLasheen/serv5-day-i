import 'package:flutter/material.dart';

class AppTheme extends ThemeExtension<AppTheme> {
  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;
  final Color surfaceColor;
  final Color errorColor;
  final Color textPrimary;
  final Color textSecondary;
  final Color grey600;
  final Color grey700;
  final Color boarderPrimary;

  final OutlineInputBorder outlineInputBorder;

  AppTheme({
    required this.primaryColor,
    required this.secondaryColor,
    required this.backgroundColor,
    required this.surfaceColor,
    required this.errorColor,
    required this.textPrimary,
    required this.textSecondary,
    required this.grey600,
    required this.grey700,
    required this.boarderPrimary,
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
    Color? grey600,
    Color? grey700,
    Color? boarderPrimary,
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
      grey600: grey600 ?? this.grey600,
      grey700: grey700 ?? this.grey700,
      boarderPrimary: boarderPrimary ?? this.boarderPrimary,
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
      grey600: Color.lerp(grey600, other.grey600, t)!,
      grey700: Color.lerp(grey700, other.grey700, t)!,
      boarderPrimary: Color.lerp(boarderPrimary, other.boarderPrimary, t)!,
      outlineInputBorder: outlineInputBorder,
    );
  }
}
