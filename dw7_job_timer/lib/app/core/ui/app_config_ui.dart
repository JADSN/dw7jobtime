import 'package:flutter/material.dart';

class AppConfigUi {
  AppConfigUi._();

  static const MaterialColor _primarySwatch = MaterialColor(
    0XFF0066B0,
    {
      50: Color(0xFF005C9E),
      100: Color(0xFF00528D),
      200: Color(0xFF00477B),
      300: Color(0xFF003D6A),
      400: Color(0xFF003358),
      500: Color(0xFF002946),
      600: Color(0xFF001F35),
      700: Color(0xFF001423),
      800: Color(0xFF000A12),
      900: Color(0xFF000000),
    },
  );

  static final ThemeData theme = ThemeData(
    primarySwatch: _primarySwatch,
    primaryColor: const Color(0xFF0066B0),
    primaryColorLight: const Color(0xFF219FFF),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
      labelStyle: TextStyle(
        color: Colors.black,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}
