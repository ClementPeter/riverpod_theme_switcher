import 'package:flutter/material.dart';

class AppTheme {
  static const blackColor = Color(0xff000000);
  static const whiteColor = Color(0xffFFFFFF);
  static const tealColor = Colors.teal;

  //specify light theme properties
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: whiteColor,
    appBarTheme: const AppBarTheme(
      color: tealColor,
      iconTheme: IconThemeData(color: whiteColor),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: blackColor),
    ),
  );

  //specfify dark theme properties
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: blackColor,
    appBarTheme: const AppBarTheme(
      color: blackColor,
      iconTheme: IconThemeData(color: whiteColor),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: whiteColor),
    ),
  );
}
