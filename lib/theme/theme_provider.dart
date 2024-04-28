import 'package:flutter/material.dart';
import 'package:notes_app/theme/theme.dart';

class ThemeProvider with ChangeNotifier {
//initially, theme is lightmode
  ThemeData _themeData = lightMode;

// getter method to access the theme fom other parts of the code
  ThemeData get themeData => _themeData;

//getter method to see if we are in darkmode or not
  bool get isDarkMode => _themeData == darkMode;

//setter method to set the new theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

// we will use this to toggle in a switch between light and dark mode.
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
