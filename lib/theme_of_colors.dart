import 'package:flutter/material.dart';

final theme = ThemeData(
  primaryColor: const Color(0xFF90a955),
  hintColor: const Color(0xA498A1A2),
  scaffoldBackgroundColor: const Color(0x5C15A5F3),
  inputDecorationTheme: InputDecorationTheme(),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: Colors.white,
      fontSize: 60,
      fontFamily: "LilitaOneScript",
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      textStyle: const TextStyle(
        fontSize: 30,
        fontFamily: "LilitaOneScript",
      ),
    ),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
  useMaterial3: true,
);
