import 'package:flutter/material.dart';

class ColorsApp {
  static const Color black = Color(0xFF181717);
  static const Color gray = Color(0xFF6A737D);
  static const Color blue = Color(0xFF0366D6);

  static final ThemeData theme = ThemeData(
    primaryColor: const Color.fromRGBO(24, 23, 23, 1),
    scaffoldBackgroundColor: ColorsApp.black,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: ColorsApp.black,
      linearTrackColor: ColorsApp.gray.withAlpha(30),
      circularTrackColor: ColorsApp.gray.withAlpha(60),
      strokeWidth: 2,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorsApp.black,
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(color: Colors.white, fontSize: 14),
      displaySmall: TextStyle(color: Colors.white, fontSize: 12),
      bodyMedium: TextStyle(color: Colors.white),
      bodyLarge: TextStyle(color: Colors.white),
      bodySmall: TextStyle(color: Colors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: ColorsApp.gray),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsApp.black,
      selectedLabelStyle: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: TextStyle(color: Colors.white, fontSize: 24),
      selectedIconTheme: IconThemeData(size: 28, color: Colors.white),
      unselectedIconTheme: IconThemeData(size: 28, color: ColorsApp.gray),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsApp.blue,
        foregroundColor: Colors.white,
      ),
    ),
  );
}

extension LanguageProgrammingColor on String {
  Color get languageProgramColor {
    final map = {
      "javascript": Color(0xFFF1E05A),
      "python": Color(0xFF3572A5),
      "java": Color(0xFFB07219),
      "dart": Color(0xFF00B4AB),
      "kotlin": Color(0xFFF18E33),
      "typescript": Color(0xFF2B7489),
      "c++": Color(0xFFF34B7D),
      "c#": Color(0xFF178600),
      "go": Color(0xFF00ADD8),
      "ruby": Color(0xFF701516),
      "php": Color(0xFF4F5D95),
      "swift": Color(0xFFFFAC45),
      "rust": Color(0xFFDEA584),
      "html": Color(0xFFE34C26),
      "css": Color(0xFF563D7C),
      "shell": Color(0xFF89E051),
      "sql": Color(0xFFE38C00),
      "json": Color(0xFF292929),
    };

    return map[toLowerCase()] ?? Colors.grey;
  }
}
