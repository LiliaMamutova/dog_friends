import 'package:flutter/material.dart';

import 'color_scheme.dart';
import 'measurements.dart';
import 'text_theme.dart';

final mainInputTheme = InputDecorationTheme(
  iconColor: lightGreenYellow,
  hintStyle: labelMedium.copyWith(
    color: lightGreenYellow,
  ),
  border: const OutlineInputBorder(
    borderSide: BorderSide(
      color: lightGreenYellow,
      width: 1.0,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(borderRadius),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(borderRadius),
    borderSide: const BorderSide(color: lightGreenYellow, width: 1.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(borderRadius),
    borderSide: const BorderSide(
      color: lightGreenYellow,
      width: 1.0,
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(borderRadius),
    borderSide: const BorderSide(color: errorColor, width: 1.0),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(borderRadius),
    borderSide: const BorderSide(color: errorColor, width: 2.0),
  ),
  activeIndicatorBorder: const BorderSide(
    color: lightGreenYellow,
    width: 1.0,
  ),
  labelStyle: labelMedium.copyWith(
    color: lightGreenYellow,
  ),
  errorStyle: labelMedium.copyWith(
    color: errorColor,
  ),
  filled: false,
  prefixStyle: const TextStyle(
    color: lightGreenYellow,
  ),
);
