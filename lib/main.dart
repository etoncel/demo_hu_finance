import 'package:flutter/material.dart';

import 'ui/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData,
      home: const HomePage(),
    );
  }
}

ThemeData themeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.orange,
    primary: const Color.fromARGB(255, 228, 99, 0),
    secondary: Colors.white,
    tertiary: Colors.black,
  ),
  useMaterial3: true,
  cardTheme: CardTheme(color: Colors.grey[100]),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      fontWeight: FontWeight.bold,
    ),
    bodySmall: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14.0,
    ),
  ),
);
