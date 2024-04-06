// We need to fetch the questions from the API
// create a question model

import 'dart:convert';
import 'package:http/http.dart';
import 'package:html_unescape/html_unescape.dart';

class Question {
  final String question;
  final List<String> answers;
  const Question(this.question, this.answers);
}

// List<Question> questions = [
//   // 5 questions simple science related
//   const Question(
//       'What is the chemical symbol for gold?', ['Au', 'Ag', 'Cu', 'Fe']),
//   const Question('What is the hardest natural substance on Earth?',
//       ['Diamond', 'Gold', 'Iron', 'Silver']),
//   const Question('What is the primary function of the lungs?',
//       ['Oxygenate blood', 'Digestion', 'Circulation', 'Excretion']),
//   const Question('What is the powerhouse of the cell?',
//       ['Mitochondria', 'Nucleus', 'Ribosome', 'Endoplasmic reticulum']),
// ];

// TODO: fetch questions from API
// http package
// get request
// response
// json.decode
// map

class Questions {
  Questions();
  Future<List<Question>?> fetchQuestion(String category) async {
    List<Question> fetchedQuestions = [];
    try {
      Response response = await get(Uri(
          scheme: 'https',
          host: 'opentdb.com',
          path: 'api.php',
          queryParameters: {
            'amount': '10',
            'category': category,
            'type': 'multiple',
          }));
      Map data = jsonDecode(response.body);
      var unescape = HtmlUnescape();
      final results = data['results'];
      for (var result in results) {
        final q = Question(unescape.convert(result['question']),
            [...result['incorrect_answers'], result['correct_answer']]);

        q.answers.map((e) => unescape.convert(e)).toList();
        fetchedQuestions.add(q);
      }
      return fetchedQuestions;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
