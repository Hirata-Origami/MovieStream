import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData theme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.red,
    hintColor: Colors.redAccent,
    scaffoldBackgroundColor: Colors.black87,
    textTheme: TextTheme(
      headlineLarge: TextStyle(
          color: Colors.white, fontSize: 32, fontWeight: FontWeight.w900),
      titleLarge: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
      bodyMedium: TextStyle(color: Colors.white70, fontSize: 14),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.red,
      titleTextStyle: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    ),
    colorScheme: ColorScheme.dark(
      surface: Colors.black,
      primary: Colors.red,
      secondary: Colors.redAccent,
    ),
  );

  static final TextStyle movieTitleStyle = TextStyle(
    color: Colors.redAccent,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle movieBodyStyle = TextStyle(
    color: Colors.white70,
    fontSize: 18,
  );

  static final TextStyle movieDetailStyle = TextStyle(
    color: Colors.grey[500],
    fontSize: 16,
  );
}
