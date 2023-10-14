import 'dart:math';

import 'package:flutter/material.dart';

double textScaleFactor(BuildContext context,
    {double maxTextScaleFactor = 1.3}) {
  final width = MediaQuery.of(context).size.width;
  double val = (width / 1400) * maxTextScaleFactor;
  return max(1, min(val, maxTextScaleFactor));
}
