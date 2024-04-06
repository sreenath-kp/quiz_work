import 'package:flutter/material.dart';
import 'package:quiz_work/screens/onboarding_screen.dart';
import 'package:quiz_work/screens/question_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const OnboardingScreen(),
        '/questions': (context) => const QuestionsScreen(),
      }
    );
  }
}
