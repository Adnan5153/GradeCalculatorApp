import 'package:flutter/material.dart';

// Manages application theme state
class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  bool get isDarkMode => _themeMode == ThemeMode.dark;

  // Toggle between light and dark themes
  void toggleTheme() {
    _themeMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;

    notifyListeners();
  }

  // Explicitly set theme mode
  void setTheme(ThemeMode mode) {
    if (_themeMode == mode) {
      return;
    }

    _themeMode = mode;
    notifyListeners();
  }
}
