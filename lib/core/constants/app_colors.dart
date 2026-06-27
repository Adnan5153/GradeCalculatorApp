import 'package:flutter/material.dart';

// Application Color Palette
class AppColors {
  AppColors._();

  // Primary Brand Colors
  static const Color primary = Color(0xFF4F46E5);
  static const Color primaryDark = Color(0xFF3730A3);
  static const Color primaryLight = Color(0xFF818CF8);

  // Secondary Colors
  static const Color secondary = Color(0xFF10B981);
  static const Color secondaryDark = Color(0xFF047857);
  static const Color secondaryLight = Color(0xFF6EE7B7);

  // Accent Colors
  static const Color accent = Color(0xFFF59E0B);
  static const Color accentLight = Color(0xFFFCD34D);

  // Success Colors
  static const Color success = Color(0xFF22C55E);

  // Error Colors
  static const Color error = Color(0xFFEF4444);

  // Grade Colors
  static const Color gradeA = Color(0xFF10B981);
  static const Color gradeB = Color(0xFF3B82F6);
  static const Color gradeC = Color(0xFFF59E0B);
  static const Color gradeF = Color(0xFFEF4444);

  // Light Theme Backgrounds
  static const Color lightBackground = Color(0xFFF8FAFC);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightCard = Color(0xFFFFFFFF);

  // Dark Theme Backgrounds
  static const Color darkBackground = Color(0xFF0F172A);
  static const Color darkSurface = Color(0xFF1E293B);
  static const Color darkCard = Color(0xFF334155);

  // Text Colors
  static const Color lightTextPrimary = Color(0xFF0F172A);
  static const Color lightTextSecondary = Color(0xFF64748B);

  static const Color darkTextPrimary = Color(0xFFF8FAFC);
  static const Color darkTextSecondary = Color(0xFFCBD5E1);

  // Border Colors
  static const Color borderLight = Color(0xFFE2E8F0);
  static const Color borderDark = Color(0xFF475569);

  // Premium Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
  );

  static const LinearGradient successGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF10B981), Color(0xFF34D399)],
  );

  static const LinearGradient summaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF4F46E5), Color(0xFF10B981)],
  );

  static const LinearGradient achievementGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFF59E0B), Color(0xFFFCD34D)],
  );

  static const LinearGradient darkGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1E293B), Color(0xFF334155)],
  );
}
