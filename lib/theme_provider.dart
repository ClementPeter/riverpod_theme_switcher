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
  bool isDarkModeEnabled = true;
  //SharedPreferences _prefs;

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
//
//
//
//
//
//
//

///Theming with ChangeNotifierProvider and shared preference
// ///Theming with ChangeNotifierProvider and for AppThemeNotifier
// final appThemeChangeNotifierProvider =
//     ChangeNotifierProvider<AppThemeChangeNotifier>((ref) {
//   return AppThemeChangeNotifier();
// });

// //provider class  to toggle App theme
// class AppThemeChangeNotifier extends ChangeNotifier {
//   //toggle theme modes
//   bool isDarkModeEnabled = false;

//   //enable light mode
//   void setLightTheme() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString('theme', 'light')
//     isDarkModeEnabled = false;
//     notifyListeners();
//   }

//   //enable dark mode
//   void setDarkTheme() {
//     isDarkModeEnabled = true;
//     notifyListeners();
//   }

//   //void  toggleTheme
// }

//
//
//
//
//
//
//
//
//
//
///Re-writing using STATE NOTIFIER PROVIDER
///
final appThemeStateNotifierProvider = StateNotifierProvider((ref) {
  return AppThemeStateNotifier();
});

class AppThemeStateNotifier extends StateNotifier<bool> {
  AppThemeStateNotifier() : super(false);

  //toggle themeMode
  void toggleTheme() {
    state = !state;
  }
}
