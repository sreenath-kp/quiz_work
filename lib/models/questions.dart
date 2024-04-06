// We need to fetch the questions from the API
// create a question model

class Question {
  final String question;
  final List<String> answers;
  const Question(this.question, this.answers);
}

List<Question> questions = [
  // 5 questions simple science related
  const Question(
      'What is the chemical symbol for gold?', ['Au', 'Ag', 'Cu', 'Fe']),
  const Question('What is the hardest natural substance on Earth?',
      ['Diamond', 'Gold', 'Iron', 'Silver']),
  const Question('What is the primary function of the lungs?',
      ['Oxygenate blood', 'Digestion', 'Circulation', 'Excretion']),
  const Question('What is the powerhouse of the cell?',
      ['Mitochondria', 'Nucleus', 'Ribosome', 'Endoplasmic reticulum']),
];
