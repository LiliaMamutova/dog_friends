import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const uk = Locale("uk");
const en = Locale("en");

class LocalizationNotifier extends StateNotifier<Locale> {
  LocalizationNotifier() : super(en);

  void changeLocale() {
    state = state == uk ? en : uk;
  }
}

final localizationNotifierProvider =
    StateNotifierProvider<LocalizationNotifier, Locale>(
        (ref) => LocalizationNotifier());
