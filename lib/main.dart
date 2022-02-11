import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  MaterialColor kPrimaryColor = const MaterialColor(
    0xFF0A0E21,
    const <int, Color>{
      200: const Color(0xFF0A0E21),
      300: const Color(0xFF0A0E21),
      400: const Color(0xFF0A0E21),
      500: const Color(0xFF0A0E21),
      600: const Color(0xFF0A0E21),
      700: const Color(0xFF0A0E21),
      800: const Color(0xFF0A0E21),
      900: const Color(0xFF0A0E21),
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: InputPage(),
    );
  }
}

