import 'package:flutter/material.dart';
import 'package:quiz_work/models/questions.dart';
import 'package:quiz_work/widgets/quiz_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {required this.questions, required this.selectedAnswers, super.key});
  final List<Question> questions;
  final List<String> selectedAnswers;
  List<Map<String, Object>> getSummary() {
    final summary = <Map<String, Object>>[];

    for (int i = 0; i < selectedAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].question,
          'correct_answer': questions[i].answers[0],
          'choosen_answer': selectedAnswers[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summary = getSummary();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summary
        .where(
            (element) => element['correct_answer'] == element['choosen_answer'])
        .length;

    return Scaffold(
      backgroundColor: const Color(0xFFF7D9FF),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(height: 30),
              QuizSummary(summary),
              const SizedBox(height: 30),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color(0xFF4255FF),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Restart Quiz',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
