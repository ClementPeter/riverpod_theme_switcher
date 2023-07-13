import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///Declare ChangeNotifierProvider for AppThemeNotifier
final appThemeChangeNotifierProvider =
    ChangeNotifierProvider<AppThemeChangeNotifier>((ref) {
  return AppThemeChangeNotifier();
});

//provider class  to toggle App theme
class AppThemeChangeNotifier extends ChangeNotifier {
  //toggle theme modes
  bool isDarkModeEnabled = false;

  //enable light mode
  void setLightTheme() {
    isDarkModeEnabled = false;
    notifyListeners();
  }

  //enable dark mode
  void setDarkTheme() {
    isDarkModeEnabled = true;
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
