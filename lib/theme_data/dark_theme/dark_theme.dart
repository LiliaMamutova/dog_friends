import 'package:flutter/material.dart';

import 'app_bar_theme.dart';
import 'buttons_theme.dart';
import 'color_scheme.dart';
import 'inputs_theme.dart';
import 'snackbar_theme.dart';
import 'text_selection_theme.dart';
import 'text_theme.dart';
import 'toggle_button_theme.dart';

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  textTheme: textTheme,
  iconTheme: const IconThemeData(color: lightGreenYellow),
  inputDecorationTheme: mainInputTheme,
  elevatedButtonTheme: elevatedButtonTheme,
  textButtonTheme: textButtonTheme,
  scaffoldBackgroundColor: const Color(0x5C15A5F3),
  appBarTheme: appBarTheme,
  snackBarTheme: snackbarTheme,
  colorScheme: colorScheme,
  textSelectionTheme: textSelectionTheme,
  toggleButtonsTheme: toggleButtonsTheme,
);
