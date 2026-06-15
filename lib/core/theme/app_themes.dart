import 'package:day_i/core/theme/app_theme.dart';
import 'package:day_i/core/theme/font_styles.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final AppTheme lightThemeColors = AppTheme(
    primaryColor: const Color(0xFF4F46E5),
    secondaryColor: const Color(0xFF03DAC6),
    backgroundColor: const Color(0xFFF5F5F5),
    surfaceColor: Colors.white,
    errorColor: const Color(0xFFB00020),
    textPrimary: const Color(0xFF000000),
    textSecondary: const Color(0xFF757575),
    outlineInputBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: lightThemeColors.textSecondary.withAlpha(100),
      ),
    ),
  );

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true, // Ensures modern component behaviors
      brightness: Brightness.light,
      scaffoldBackgroundColor: lightThemeColors.backgroundColor,

      // 1. Core Typography Mapping
      textTheme: TextTheme(
        displayLarge: FontStyles.h1,
        displayMedium: FontStyles.h2,
        displaySmall: FontStyles.h3,
        headlineMedium: FontStyles.bodyLarge,
        headlineSmall: FontStyles.bodyMedium,
        titleLarge: FontStyles.bodySmall,
        titleMedium: FontStyles.button,
        titleSmall: FontStyles.label,
      ),

      // 2. Global AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: lightThemeColors.surfaceColor,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: lightThemeColors.textPrimary, size: 24),
        actionsIconTheme: IconThemeData(
          color: lightThemeColors.textSecondary,
          size: 24,
        ),
        titleTextStyle: FontStyles.h3.copyWith(
          color: lightThemeColors.textPrimary,
        ),
      ),

      // 3. Global Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: lightThemeColors.primaryColor,
          foregroundColor:
              lightThemeColors.surfaceColor, // Text/Icon color inside button
          disabledBackgroundColor: lightThemeColors.textSecondary.withAlpha(50),
          disabledForegroundColor: lightThemeColors.textSecondary,
          elevation: 0,
          textStyle: FontStyles.button,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Clean modern rounding
          ),
        ),
      ),

      // 4. Global Outlined Button Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: lightThemeColors.primaryColor,
          side: BorderSide(color: lightThemeColors.primaryColor, width: 1.5),
          textStyle: FontStyles.button,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),

      // 5. Global Icon Theme (For standalone icons)
      iconTheme: IconThemeData(color: lightThemeColors.textPrimary, size: 24),

      // 6. Form Fields & TextInputs (Crucial for a polished UX)
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: lightThemeColors.surfaceColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        labelStyle: FontStyles.bodyMedium.copyWith(
          color: lightThemeColors.textSecondary,
        ),
        hintStyle: FontStyles.bodyMedium.copyWith(
          color: lightThemeColors.textSecondary.withAlpha(150),
        ),
        border: lightThemeColors.outlineInputBorder,
        enabledBorder: lightThemeColors.outlineInputBorder,
        focusedBorder: lightThemeColors.outlineInputBorder.copyWith(
          borderSide: BorderSide(
            color: lightThemeColors.primaryColor,
            width: 2,
          ),
        ),
        errorBorder: lightThemeColors.outlineInputBorder.copyWith(
          borderSide: BorderSide(color: lightThemeColors.errorColor),
        ),
      ),

      // 7. Card Theme
      cardTheme: CardThemeData(
        color: lightThemeColors.surfaceColor,
        elevation: 2,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),

      // Keep your extensions injected at the bottom
      extensions: <ThemeExtension<dynamic>>[lightThemeColors],
    );
  }
}
