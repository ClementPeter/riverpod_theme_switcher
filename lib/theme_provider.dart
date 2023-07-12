import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///Declare provider for AppThemeState
final appThemeChangeNotifierProvider =
    ChangeNotifierProvider<AppThemeNotifier>((ref) {
  return AppThemeNotifier();
});

//provider class  to toggle App theme
class AppThemeNotifier extends ChangeNotifier {
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
