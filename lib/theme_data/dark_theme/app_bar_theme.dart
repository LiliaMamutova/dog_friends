import 'package:dog_friends/theme_data/dark_theme/text_theme.dart';
import 'package:flutter/material.dart';

import 'color_scheme.dart';

final appBarTheme = AppBarTheme(
  actionsIconTheme: const IconThemeData(color: Colors.grey),
  iconTheme: const IconThemeData(color: lightGreenYellow),
  elevation: 0,
  backgroundColor: greenButtonText.withOpacity(0.2),
  foregroundColor: lightGreenYellow,
  titleTextStyle: headlineSmall,
);
