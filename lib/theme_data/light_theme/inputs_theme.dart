import 'package:flutter/material.dart';

import 'color_scheme.dart';
import 'measurements.dart';
import 'text_theme.dart';

final mainInputTheme = InputDecorationTheme(
  iconColor: lightTerracotta,
  hintStyle: labelMedium.copyWith(
    color: lightTerracotta,
  ),
  border: const OutlineInputBorder(
    borderSide: BorderSide(
      color: darkBlue,
      width: 1.0,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(borderRadius),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(borderRadius),
    borderSide: const BorderSide(color: lightBlue, width: 1.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(borderRadius),
    borderSide: const BorderSide(
      color: darkBlue,
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
    color: lightBlue,
    width: 1.0,
  ),
  labelStyle: labelMedium.copyWith(
    color: darkBlue,
  ),
  errorStyle: labelMedium.copyWith(
    color: errorColor,
  ),
  filled: false,
  prefixStyle: const TextStyle(
    color: darkBlue,
  ),
);
