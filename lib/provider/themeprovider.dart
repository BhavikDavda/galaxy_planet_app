import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  bool _isDarkMode=true;

  bool get isDarkMode=>_isDarkMode;

  ThemeMode get currentMode=>_isDarkMode ? ThemeMode.light : ThemeMode.dark;

  void toggleTheme(){
    _isDarkMode=!_isDarkMode;
    notifyListeners();
  }
}