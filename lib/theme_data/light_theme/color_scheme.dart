import 'package:flutter/material.dart';

const darkBlue = Color(0xCE06354E);
const blueButtonText = Color(0xff007aa9);
const lightBlue = Color(0xff9ec3e0);
const lightPurple = Color(0xffc7c0c8);
const white = Color(0xFFFFFFFF);
const deepBlue = Color(0xff0000FF);
const lightTerracotta = Color(0xffd1913e);

const errorColor = Color(0xffa92420);

final darkBlueOpacity = MaterialStateProperty.all<Color>(
  lightPurple.withOpacity(0.9),
);

const colorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: darkBlue,
  onPrimary: lightBlue,
  secondary: blueButtonText,
  onSecondary: lightBlue,
  error: errorColor,
  onError: errorColor,
  background: darkBlue,
  onBackground: darkBlue,
  surface: darkBlue,
  onSurface: lightPurple,
);
