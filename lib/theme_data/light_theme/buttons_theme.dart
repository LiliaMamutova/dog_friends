import 'package:dog_friends/theme_data/light_theme/text_styles.dart';
import 'package:flutter/material.dart';

import 'color_scheme.dart';
import 'measurements.dart';

final elevatedButtonTheme = ElevatedButtonThemeData(
  style: ButtonStyle(
    textStyle: MaterialStateProperty.all<TextStyle>(
        bodyLarge.copyWith(color: lightTerracotta)),
    backgroundColor: MaterialStateProperty.all<Color>(
      darkBlue,
    ),
    shape: MaterialStateProperty.all<OutlinedBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    ),
    overlayColor: darkBlueOpacity,
    foregroundColor: MaterialStateProperty.all<Color>(lightPurple),
  ),
);

final textButtonTheme = TextButtonThemeData(
  style: ButtonStyle(
    textStyle: MaterialStateProperty.all<TextStyle>(bodyLarge),
    foregroundColor: MaterialStateProperty.all<Color>(blueButtonText),
    splashFactory: InkSparkle.splashFactory,
    overlayColor: darkBlueOpacity,
  ),
);
