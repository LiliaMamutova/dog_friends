import 'package:flutter/material.dart';

const black = Color(0xFF001524);
const greenButtonText = Color(0xFF445D48);
const lightGreenYellow = Color(0xFFD6CC99);
const crema = Color(0xFFFDE5D4);
const lightBrown = Color(0xFFBCA37F);

const errorColor = Color(0xFFCD5C08);

final overlayColor = MaterialStateProperty.all<Color>(
  lightBrown.withOpacity(0.9),
);

const colorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: black,
  onPrimary: lightGreenYellow,
  secondary: greenButtonText,
  onSecondary: lightBrown,
  error: errorColor,
  onError: errorColor,
  background: lightBrown,
  onBackground: lightBrown,
  surface: lightBrown,
  onSurface: lightBrown,
);
