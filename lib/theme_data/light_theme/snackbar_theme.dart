import 'package:dog_friends/theme_data/light_theme/text_theme.dart';
import 'package:flutter/material.dart';

import 'color_scheme.dart';
import 'measurements.dart';

final snackbarTheme = SnackBarThemeData(
  showCloseIcon: true,
  closeIconColor: blueButtonText,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(snackbarBorderRadius),
  ),
  backgroundColor: lightBlue.withOpacity(0.2),
  contentTextStyle: bodyMedium,
  actionTextColor: darkBlue,
);
