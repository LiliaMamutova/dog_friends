import 'package:dog_friends/screen_1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFF90a955),
        // Основний колір (зелений)
        hintColor: Color(0xA498A1A2),
        // Акцентний колір (темно-зелений)
        scaffoldBackgroundColor: const Color(0x5C15A5F3),
        inputDecorationTheme: InputDecorationTheme(),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 60,
            fontFamily: "LilitaOneScript",
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 30,
              fontFamily: "LilitaOneScript",
            ),
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const StartScreen(),
    );
  }
}
