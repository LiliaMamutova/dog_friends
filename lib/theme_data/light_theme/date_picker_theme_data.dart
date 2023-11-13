import 'package:dog_friends/theme_data/light_theme/color_scheme.dart';
import 'package:flutter/material.dart';

final datePickerTheme = DatePickerThemeData(
  backgroundColor: white,
  surfaceTintColor: darkBlue,
  headerBackgroundColor: blueButtonText,
  todayForegroundColor: MaterialStateProperty.all<Color>(
    lightPurple,
  ),
  // todayBorder: const BorderSide(
  //   color: lightTerracotta,
  //   width: 1.0,
  // ),
);
