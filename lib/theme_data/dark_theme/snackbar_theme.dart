import 'package:dog_friends/theme_data/dark_theme/text_theme.dart';
import 'package:flutter/material.dart';

import 'color_scheme.dart';
import 'measurements.dart';

final snackbarTheme = SnackBarThemeData(
  showCloseIcon: true,
  closeIconColor: crema,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(snackbarBorderRadius),
  ),
  backgroundColor: greenButtonText.withOpacity(0.2),
  contentTextStyle: bodyMedium,
  actionTextColor: lightGreenYellow,
);
