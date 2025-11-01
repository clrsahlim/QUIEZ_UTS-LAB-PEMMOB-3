import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QUIEZ App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Merriweather',
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}