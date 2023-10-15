import 'package:dog_friends/theme_data/color_data/theme_of_colors.dart';
import 'package:flutter/material.dart';

import 'features/dog/screen/dogs_list_feature.dart';

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
      home: const DogsListScreen(),
    );
  }
}
