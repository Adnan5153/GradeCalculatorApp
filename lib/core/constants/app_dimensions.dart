import 'package:flutter/material.dart';

// Application dimension constants
class AppDimensions {
  AppDimensions._();

  // Spacing
  static const double spacingXS = 4;
  static const double spacingSM = 8;
  static const double spacingMD = 16;
  static const double spacingLG = 24;
  static const double spacingXL = 32;
  static const double spacingXXL = 48;

  // Padding
  static const EdgeInsets screenPadding = EdgeInsets.all(24);

  static const EdgeInsets cardPadding = EdgeInsets.all(16);

  static const EdgeInsets contentPadding = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 12,
  );

  // Border Radius
  static const double radiusSM = 8;
  static const double radiusMD = 12;
  static const double radiusLG = 16;
  static const double radiusXL = 20;
  static const double radiusXXL = 24;
  static const double radiusCircular = 999;

  // Elevation
  static const double elevationNone = 0;
  static const double elevationSM = 2;
  static const double elevationMD = 4;
  static const double elevationLG = 8;

  // App Bar
  static const double appBarHeight = kToolbarHeight;

  // Buttons
  static const double buttonHeight = 56;
  static const double buttonIconSize = 20;

  // Text Fields
  static const double textFieldBorderWidth = 1;
  static const double focusedBorderWidth = 2;

  // Icons
  static const double iconXS = 16;
  static const double iconSM = 20;
  static const double iconMD = 24;
  static const double iconLG = 32;
  static const double iconXL = 40;

  // Navigation Bar
  static const double bottomNavIconSize = 24;

  // Cards
  static const double summaryCardHeight = 140;
  static const double statisticsCardHeight = 120;

  // Subject Tile
  static const double subjectTileMinHeight = 72;

  // Lottie Animations
  static const double lottieSmall = 120;
  static const double lottieMedium = 200;
  static const double lottieLarge = 260;

  // Loading Indicator
  static const double loadingSize = 100;

  // Dialogs
  static const double dialogRadius = 20;

  // Avatar / Badge
  static const double badgeSize = 36;

  // Grade Chips
  static const double gradeChipHeight = 32;

  // Dividers
  static const double dividerThickness = 1;

  // Animation Durations
  static const Duration fastAnimation = Duration(milliseconds: 200);

  static const Duration normalAnimation = Duration(milliseconds: 300);

  static const Duration slowAnimation = Duration(milliseconds: 500);

  static const Duration splashDuration = Duration(seconds: 2);

  static const Duration successDuration = Duration(seconds: 2);
}
