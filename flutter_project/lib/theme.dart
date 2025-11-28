import 'package:flutter/material.dart';

/// App colors matching the original Android app
class AppColors {
  static const Color greenDark = Color(0xFF4F7C79);
  static const Color greenLight = Color(0xFF689592);
  static const Color beige = Color(0xFFD6CBAE);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color teal200 = Color(0xFF03DAC5);
  static const Color teal700 = Color(0xFF018786);
  static const Color backgroundGray = Color(0xFFEFEFEF);
  static const Color statusBarColor = Color(0xCC4F7C79);
}

/// App theme
class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: AppColors.greenDark,
        secondary: AppColors.teal200,
        surface: AppColors.white,
        onPrimary: AppColors.white,
        onSecondary: AppColors.black,
      ),
      scaffoldBackgroundColor: AppColors.greenDark,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.greenDark,
        foregroundColor: AppColors.white,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.greenLight,
          foregroundColor: AppColors.white,
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          // Large top padding to make room for icon overlay (matching Android layout)
          padding: const EdgeInsets.only(top: 60, bottom: 8, left: 16, right: 16),
          minimumSize: const Size(150, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.greenDark,
      ),
    );
  }
}

/// Arabic string constants
class AppStrings {
  static const String appName = 'فَاذْكُرُونِي أَذْكُرْكُمْ';
  static const String morningAzkar = 'أذكار الصباح';
  static const String eveningAzkar = 'أذكار المساء';
  static const String prayAzkar = 'أذكار بعد الصلاة';
  static const String tasbeeh = 'التسبيح';
  static const String remaining = 'يتبقي';
  static const String finished = 'إنتهيت';
}
