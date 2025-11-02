class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctAnswer;
  final String? imageUrl;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctAnswer,
    this.imageUrl,
  });
}