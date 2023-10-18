import 'package:dog_friends/theme_data/dark_theme/text_theme.dart';
import 'package:flutter/material.dart';

import 'color_scheme.dart';

final appBarTheme = AppBarTheme(
  actionsIconTheme: const IconThemeData(color: lightPurple),
  iconTheme: const IconThemeData(color: lightBlue),
  elevation: 0,
  backgroundColor: blueButtonText.withOpacity(0.2),
  foregroundColor: lightBlue,
  titleTextStyle: headlineSmall,
);
