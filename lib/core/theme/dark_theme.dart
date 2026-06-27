import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

// Premium dark theme configuration
class DarkTheme {
  DarkTheme._();

  static ThemeData get theme {
    const colorScheme = ColorScheme.dark(
      primary: AppColors.primaryLight,
      secondary: AppColors.secondary,
      error: AppColors.error,
      surface: AppColors.darkSurface,
      onSurface: AppColors.darkTextPrimary,
      onPrimary: AppColors.darkTextPrimary,
      onSecondary: AppColors.darkTextPrimary,
      onError: AppColors.darkTextPrimary,
    );

    return ThemeData(
      useMaterial3: true,

      colorScheme: colorScheme,

      scaffoldBackgroundColor: AppColors.darkBackground,

      canvasColor: AppColors.darkBackground,

      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.darkBackground,
        foregroundColor: AppColors.darkTextPrimary,
      ),

      cardTheme: CardThemeData(
        color: AppColors.darkCard,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
          side: const BorderSide(color: AppColors.borderDark, width: 1),
        ),
      ),

      dividerColor: AppColors.borderDark,

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkSurface,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),

        hintStyle: const TextStyle(color: AppColors.darkTextSecondary),

        labelStyle: const TextStyle(color: AppColors.darkTextSecondary),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: AppColors.borderDark),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: AppColors.borderDark),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: AppColors.primaryLight, width: 2),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: AppColors.error),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: AppColors.error, width: 2),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.darkTextPrimary,
          minimumSize: const Size(double.infinity, 58),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        ),
      ),

      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.darkSurface,
        indicatorColor: AppColors.primary.withValues(alpha: 0.18),
        elevation: 0,
        height: 72,
        labelTextStyle: WidgetStateProperty.all(
          const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),

      chipTheme: ChipThemeData(
        backgroundColor: AppColors.darkSurface,
        selectedColor: AppColors.primary,
        side: const BorderSide(color: AppColors.borderDark),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),

      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.darkCard,
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),

      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.darkCard,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      ),

      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.primaryLight,
        selectionColor: AppColors.primaryLight.withValues(alpha: 0.25),
        selectionHandleColor: AppColors.primaryLight,
      ),
    );
  }
}
