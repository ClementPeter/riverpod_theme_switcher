import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

///Declare ChangeNotifierProvider for AppThemeNotifier
final appThemeChangeNotifierProvider =
    ChangeNotifierProvider<AppThemeChangeNotifier>((ref) {
  return AppThemeChangeNotifier();
});

//provider class  to toggle App theme
class AppThemeChangeNotifier extends ChangeNotifier {
  //toggle theme modes
  bool isDarkModeEnabled = false;

//constructor - called first when class is build
  AppThemeChangeNotifier() {
    loadTheme();
  }

  //enable light mode
  void setLightTheme() {
    isDarkModeEnabled = false;
    saveTheme();
    notifyListeners();
  }

  //enable dark mode
  void setDarkTheme() {
    isDarkModeEnabled = true;
    saveTheme();
    notifyListeners();
  }

  //method to save current theme to SharedPreference
  Future<void> saveTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkModeEnabled', isDarkModeEnabled);
  }

  //Method to load the saved theme from SharedPreference
  Future<void> loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getInt('isDarkModeEnabled') ?? false;
    notifyListeners();
  }
}
