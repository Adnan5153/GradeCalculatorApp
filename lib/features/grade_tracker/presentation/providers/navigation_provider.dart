import 'package:flutter/material.dart';

// Manages bottom navigation state
class NavigationProvider extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  // Update selected navigation tab
  void changeIndex(int index) {
    if (_currentIndex == index) {
      return;
    }

    _currentIndex = index;
    notifyListeners();
  }

  // Navigate to Add Subject screen
  void goToAddSubject() {
    changeIndex(0);
  }

  // Navigate to Subject List screen
  void goToSubjectList() {
    changeIndex(1);
  }

  // Navigate to Summary screen
  void goToSummary() {
    changeIndex(2);
  }
}
