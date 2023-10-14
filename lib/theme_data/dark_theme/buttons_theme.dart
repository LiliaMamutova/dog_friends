import 'package:dog_friends/theme_data/dark_theme/text_theme.dart';
import 'package:flutter/material.dart';

import 'color_scheme.dart';
import 'measurements.dart';

final elevatedButtonTheme = ElevatedButtonThemeData(
  style: ButtonStyle(
    textStyle: MaterialStateProperty.all<TextStyle>(bodyLarge),
    backgroundColor: MaterialStateProperty.all<Color>(
      crema,
    ),
    shape: MaterialStateProperty.all<OutlinedBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    ),
    overlayColor: overlayColor,
    foregroundColor: MaterialStateProperty.all<Color>(greenButtonText),
  ),
);

final textButtonTheme = TextButtonThemeData(
  style: ButtonStyle(
    textStyle: MaterialStateProperty.all<TextStyle>(bodyLarge),
    foregroundColor: MaterialStateProperty.all<Color>(crema),
    splashFactory: InkSparkle.splashFactory,
    overlayColor: overlayColor,
  ),
);
