import 'package:flutter/material.dart';
import 'package:demo_hu_finance/helper/get_it_injection.dart';
import 'presentation/ui/pages/home/home_page.dart';
import 'config/theme/app_theme.dart';

void main() {
  setUpGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeData,
      home: const HomePage(),
    );
  }
}
