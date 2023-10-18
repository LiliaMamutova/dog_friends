import 'package:dog_friends/theme_data/dark_theme/text_theme.dart';
import 'package:flutter/material.dart';

import 'color_scheme.dart';
import 'measurements.dart';

final elevatedButtonTheme = ElevatedButtonThemeData(
  style: ButtonStyle(
    textStyle: MaterialStateProperty.all<TextStyle>(
        bodyLarge.copyWith(color: darkBlue)),
    backgroundColor: MaterialStateProperty.all<Color>(
      lightPurple,
    ),
    shape: MaterialStateProperty.all<OutlinedBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    ),
    overlayColor: darkBlueOpacity,
    foregroundColor: MaterialStateProperty.all<Color>(darkBlue),
  ),
);

final textButtonTheme = TextButtonThemeData(
  style: ButtonStyle(
    textStyle: MaterialStateProperty.all<TextStyle>(bodyLarge),
    foregroundColor: MaterialStateProperty.all<Color>(lightPurple),
    splashFactory: InkSparkle.splashFactory,
    overlayColor: darkBlueOpacity,
  ),
);
