import 'package:dog_friends/theme_of_colors.dart';
import 'package:flutter/material.dart';

import 'log_in_by_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dog Friends',
      theme: theme,
      home: const LogInByScreen(),
    );
  }
}
