import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_mode_state.dart';

class ThemeModeCubit extends Cubit<ThemeModeState> {
  ThemeModeCubit() : super(ThemeModeInitial());

  late bool _isDark = false;
  late bool _isLight = true;

  bool get isDark => _isDark;

  bool get isLight => _isLight;

  void changeThemeMode() {
    _isDark = !_isDark;
    _isLight = !_isLight;

    emit(ThemeModeChanged());
  }
}
