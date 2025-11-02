class QuizResult {
  final int questionIndex;
  final String question;
  final int userAnswer;
  final int correctAnswer;
  final bool isCorrect;

  QuizResult({
    required this.questionIndex,
    required this.question,
    required this.userAnswer,
    required this.correctAnswer,
    required this.isCorrect,
  });
}