import 'package:dog_friends/screens/welcome_screen.dart';
import 'package:dog_friends/theme_of_colors.dart';
import 'package:flutter/material.dart';

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
      home: const WelcomeScreen(),
    );
  }
}
