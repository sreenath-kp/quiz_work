import 'package:flutter/material.dart';

class QuizSummary extends StatelessWidget {
  const QuizSummary(this.summary, {super.key});

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[100],
      ),
      child: SizedBox(
        height: 300,
        child: SingleChildScrollView(
          child: Column(
            children: summary.map((e) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: e['choosen_answer'] == e['correct_answer']
                        ? Colors.green[300]
                        : Colors.red[300],
                    child: Text(
                      ((e['question_index'] as int) + 1).toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e['question'] as String,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        if (e['choosen_answer'] != e['correct_answer'])
                          Text(
                            e['choosen_answer'] as String,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        const SizedBox(height: 5),
                        Text(
                          e['correct_answer'] as String,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
