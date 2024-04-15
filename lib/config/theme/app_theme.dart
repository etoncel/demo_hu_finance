import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.orange,
    primary: const Color(0xffFF6203),
    secondary: const Color(0xffF7F4F2),
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
