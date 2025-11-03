import 'package:flutter/material.dart';
import '../models/quiz_question.dart';
import '../models/quiz_result.dart';
import '../data/quiz_data.dart';
import '../widgets/progress_bar.dart';
import '../widgets/answer_button.dart';
import '../utils/app_colors.dart';
import '../screens/score_screen.dart';

class QuizScreen extends StatefulWidget {
  final String userName;
  final String category;

  const QuizScreen({
    super.key,
    required this.userName,
    required this.category,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late List<QuizQuestion> questions;
  int currentQuestionIndex = 0;
  List<QuizResult> results = [];
  Map<int, int> selectedAnswers = {}; // Simpan jawaban per question index

  @override
  void initState() {
    super.initState();
    questions = QuizData.getAllQuestions()[widget.category] ?? [];
  }

  void _answerQuestion(int selectedAnswer) {
    setState(() {
      selectedAnswers[currentQuestionIndex] = selectedAnswer;
    });

    // Update atau tambah result
    final existingResultIndex = results.indexWhere(
          (result) => result.questionIndex == currentQuestionIndex,
    );

    final question = questions[currentQuestionIndex];
    final isCorrect = selectedAnswer == question.correctAnswer;

    final newResult = QuizResult(
      questionIndex: currentQuestionIndex,
      question: question.question,
      userAnswer: selectedAnswer,
      correctAnswer: question.correctAnswer,
      isCorrect: isCorrect,
    );

    if (existingResultIndex != -1) {
      results[existingResultIndex] = newResult;
    } else {
      results.add(newResult);
    }
  }

  void _nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      _showResults();
    }
  }

  void _previousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
      });
    }
  }

  void _showResults() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => ScoreScreen(
          userName: widget.userName,
          category: widget.category,
          results: results,
          totalQuestions: questions.length,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final question = questions[currentQuestionIndex];
    final selectedAnswerIndex = selectedAnswers[currentQuestionIndex]; // Ambil jawaban untuk soal ini

    final List<Color> answerColors = [
      AppColors.yellow,
      AppColors.blue,
      AppColors.green,
      AppColors.pink,
    ];

    return Scaffold(
      backgroundColor: AppColors.beige,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              padding: EdgeInsets.all(screenWidth * 0.05),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                      IconButton(
                        icon: const Icon(Icons.home, color: Colors.white),
                        onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.userName,
                              style: TextStyle(
                                color: AppColors.beige,
                                fontSize: screenWidth * 0.045,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.03,
                                vertical: screenHeight * 0.005,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.pink,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                widget.category,
                                style: TextStyle(
                                  color: AppColors.red,
                                  fontSize: screenWidth * 0.03,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.015),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                        child: ProgressBar(
                          currentQuestion: currentQuestionIndex + 1,
                          totalQuestions: questions.length,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.015),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.05),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(screenWidth * 0.05),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                              question.question,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: screenWidth * 0.045,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (question.imageUrl != null) ...[
                              SizedBox(height: screenHeight * 0.01),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  question.imageUrl!,
                                  width: screenWidth * 0.45,
                                  height: screenWidth * 0.32,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      width: screenWidth * 0.4,
                                      height: screenWidth * 0.4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.grey[300],
                                      ),
                                      child: const Icon(Icons.image, size: 50),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      ...List.generate(
                        question.options.length,
                            (index) => AnswerButton(
                          label: '${String.fromCharCode(65 + index)}.',
                          answer: question.options[index],
                          color: answerColors[index % answerColors.length],
                          isSelected: selectedAnswerIndex == index,
                          onTap: () => _answerQuestion(index),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: screenHeight * 0.025,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: currentQuestionIndex > 0 ? _previousQuestion : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.08,
                        vertical: screenHeight * 0.015,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Previous',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: selectedAnswerIndex != null ? _nextQuestion : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.red,
                      disabledBackgroundColor: Colors.grey[400],
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.08,
                        vertical: screenHeight * 0.015,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}