// Screen to display the question and the options
// After the user selects an option, we will show the next question

import 'package:flutter/material.dart';
import 'package:quiz_work/models/questions.dart';
import 'package:quiz_work/screens/result_screen.dart';

class QuestionsScreen extends StatefulWidget {
  final List<Question> questions;
  const QuestionsScreen({super.key, required this.questions});
  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;
  // questions from other file ( later we will fetch from API)
  List<String> selectedAnswers = [];
  void answerQuestion(String selectedAnswer) {
    selectedAnswers.add(selectedAnswer);
    if (currentQuestionIndex == widget.questions.length - 1) {
      // show the result screen
      // TODO
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            questions: widget.questions,
            selectedAnswers: selectedAnswers,
          ),
        ),
      );

      return;
    }

    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.questions[currentQuestionIndex];
    return Scaffold(
      backgroundColor: const Color(0xFFFEDC62),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(10, 10),
              ),
            ],
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                currentQuestion.question,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              ...currentQuestion.answers.map((text) {
                return ElevatedButton(
                  onPressed: () {
                    answerQuestion(text);
                  },
                  child: Text(text),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
