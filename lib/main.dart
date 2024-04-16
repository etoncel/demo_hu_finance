import 'package:flutter/material.dart';
import 'presentation/ui/pages/home_page.dart';
import 'package:hu_basica/config/theme/app_theme.dart';

void main() {
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

interface class Bike {
  void turnOnEngine() {
    print("Hola");
  }

  void accelerate() {}
}

class Moto extends Bike {
  @override
  void turnOnEngine() {
    // TODO: implement turnOnEngine
    super.turnOnEngine();
  }
}
