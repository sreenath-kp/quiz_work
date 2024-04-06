import 'package:flutter/material.dart';
import 'package:quiz_work/models/questions.dart';
import 'package:quiz_work/screens/question_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  String selectedCategory = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF4255FF),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.question_answer,
                size: 140,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              const Text(
                'Quiz away',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(12.0, 40, 12.0, 0),
                child: ListTile(
                  leading: Icon(Icons.lightbulb),
                  title: Text('Choose a category for the questions'),
                ),
              ),
              DropdownMenu(
                width: 200,
                trailingIcon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                ),
                inputDecorationTheme: const InputDecorationTheme(
                    fillColor: Color.fromARGB(255, 46, 64, 217), filled: true),
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                label: const Text(
                  'Category',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                dropdownMenuEntries: const [
                  DropdownMenuEntry(value: '17', label: 'Nature & Biology'),
                  DropdownMenuEntry(value: '18', label: 'Computer Science'),
                  DropdownMenuEntry(value: '19', label: 'Mathemtics'),
                  DropdownMenuEntry(value: '23', label: 'History'),
                  DropdownMenuEntry(value: '11', label: 'Films'),
                ],
                onSelected: (value) {
                  setState(() {
                    selectedCategory = value!;
                  });
                },
              ),
              const SizedBox(height: 150),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFCD1F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () async {
                  // Navigate to the quiz screen
                  if (selectedCategory.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please select a category'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                    return;
                  }

                  final response =
                      await Questions().fetchQuestion(selectedCategory);
                  if (response != null) {
                  } else {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Failed to load questions'),
                      ),
                    );
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          QuestionsScreen(questions: response!),
                    ),
                  );
                },
                child: const Text(
                  'Start Quiz',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ],
          ),
        ));
  }
}
