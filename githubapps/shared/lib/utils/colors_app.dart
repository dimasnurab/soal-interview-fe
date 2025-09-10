import 'package:flutter/material.dart';

class ColorsApp {
  static const Color black = Color(0xFF181717);
  static const Color gray = Color(0xFF6A737D);
  static const Color blue = Color(0xFF0366D6);

  static final ThemeData theme = ThemeData(
    primaryColor: const Color.fromRGBO(24, 23, 23, 1),
    scaffoldBackgroundColor: ColorsApp.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorsApp.black,
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: ColorsApp.black,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(color: ColorsApp.gray),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsApp.blue,
        foregroundColor: Colors.white,
      ),
    ),
  );
}
