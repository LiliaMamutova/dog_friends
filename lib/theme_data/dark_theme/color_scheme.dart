import 'package:flutter/material.dart';

const darkBlue = Color(0xFF06354E);
const blueButtonText = Color(0xff007aa9);
const lightBlue = Color(0xff9ec3e0);
const lightPurple = Color(0xffc7c0c8);
const lightTerracotta = Color(0xffd1913e);
const white = Color(0xFFFFFFFF);
const deepBlue = Color(0xff0000FF);

const errorColor = Color(0xffa92420);

final darkBlueOpacity = MaterialStateProperty.all<Color>(
  darkBlue.withOpacity(0.9),
);

const colorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: blueButtonText,
  onPrimary: darkBlue,
  secondary: blueButtonText,
  onSecondary: lightBlue,
  error: errorColor,
  onError: errorColor,
  background: darkBlue,
  onBackground: lightPurple,
  surface: lightPurple,
  onSurface: lightPurple,
);
