import 'package:dog_friends/features/user/screens/user_profile_screen.dart';
import 'package:dog_friends/theme_data/dark_theme/dark_theme.dart';
import 'package:dog_friends/theme_data/light_theme/light_theme.dart';
import 'package:dog_friends/value_notifier/vn.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: notifier,
        builder: (_, mode, __) {
          return MaterialApp(
            title: 'Dog Friends',
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode:
                mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light,
            home: const UserProfileScreen(),
          );
        });
  }
}
