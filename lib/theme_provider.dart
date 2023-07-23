import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_switcher_riverpod/app_theme.dart';

// ///Declare ChangeNotifierProvider for AppThemeNotifier
// final appThemeChangeNotifierProvider =
//     ChangeNotifierProvider<AppThemeChangeNotifier>((ref) {
//   return AppThemeChangeNotifier();
// });

// //provider class  to toggle App theme
// class AppThemeChangeNotifier extends ChangeNotifier {
//   //toggle theme modes
//   bool isDarkModeEnabled = false;
//   //SharedPreferences _prefs;

// //constructor - called first when class is build
//   AppThemeChangeNotifier() {
//     loadTheme();
//   }

//   //enable light mode
//   void setLightTheme() {
//     isDarkModeEnabled = false;
//     saveTheme();
//     notifyListeners();
//   }

//   //enable dark mode
//   void setDarkTheme() {
//     isDarkModeEnabled = true;
//     saveTheme();
//     notifyListeners();
//   }

//   //method to save current theme to SharedPreference
//   Future<void> saveTheme() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setBool('isDarkModeEnabled', isDarkModeEnabled);
//   }

//   //Method to load the saved theme from SharedPreference
//   Future<void> loadTheme() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.getInt('isDarkModeEnabled') ?? false;
//     notifyListeners();
//   }
// }
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
///Re-writing Theming using STATE NOTIFIER PROVIDER
final appThemeStateNotifierProvider =
    StateNotifierProvider<AppThemeStateNotifier, ThemeData>((ref) {
  return AppThemeStateNotifier();
});

class AppThemeStateNotifier extends StateNotifier<ThemeData> {
  //
  ThemeMode _mode;

  AppThemeStateNotifier({ThemeMode mode = ThemeMode.dark})
      : _mode = mode,
        super(AppTheme.darkTheme) {
    print('::app theme default constructor -> DARK::');
    getTheme();
  }

  ThemeMode get mode => _mode;

  //Get the Starting App THEME
  void getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString('theme');

    if (theme == 'light') {
      _mode = ThemeMode.light;
      state = AppTheme.lightTheme;
      //prefs.setString('theme', 'light');
    } else {
      _mode = ThemeMode.dark;
      state = AppTheme.darkTheme;
      //prefs.setString('key', 'dark');
    }
  }

  void toggleTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (_mode == ThemeMode.dark) {
      _mode = ThemeMode.light;
      state = AppTheme.lightTheme;
      prefs.setString('theme', 'light');
    } else {
      _mode = ThemeMode.dark;
      state = AppTheme.darkTheme;
      prefs.setString('theme', 'dark');
    }
  }
}
