import 'package:dog_friends/theme_data/dark_theme/bottom_navigation_bar_theme.dart';
import 'package:flutter/material.dart';

import '../dark_theme/card_theme.dart';
import 'app_bar_theme.dart';
import 'buttons_theme.dart';
import 'color_scheme.dart';
import 'inputs_theme.dart';
import 'snackbar_theme.dart';
import 'text_selection_theme.dart';
import 'text_styles.dart';
import 'toggle_button_theme.dart';

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  textTheme: textTheme,
  iconTheme: const IconThemeData(color: lightTerracotta),
  inputDecorationTheme: mainInputTheme,
  elevatedButtonTheme: elevatedButtonTheme,
  textButtonTheme: textButtonTheme,
  scaffoldBackgroundColor: darkBlue,
  appBarTheme: appBarTheme,
  snackBarTheme: snackbarTheme,
  colorScheme: colorScheme,
  textSelectionTheme: textSelectionTheme,
  toggleButtonsTheme: toggleButtonsTheme,
  bottomNavigationBarTheme: bottomNavigationBarTheme,
  cardTheme: cardTheme,
);
