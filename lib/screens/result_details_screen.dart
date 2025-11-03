import 'package:flutter/material.dart';
import '../models/quiz_result.dart';
import '../data/quiz_data.dart';
import 'score_screen.dart';
import '../utils/app_colors.dart';

class ResultDetailsScreen extends StatelessWidget {
  final String userName;
  final String category;
  final List<QuizResult> results;

  const ResultDetailsScreen({
    super.key,
    required this.userName,
    required this.category,
    required this.results,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final questions = QuizData.getAllQuestions()[category] ?? [];

    return Scaffold(
      backgroundColor: AppColors.beige,
      appBar: AppBar(
        backgroundColor: AppColors.beige,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.home, color: Colors.black),
            onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                children: [
                  Text(
                    userName,
                    style: TextStyle(
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.04,
                      vertical: screenHeight * 0.008,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.pink,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      category,
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.w800,
                        color: AppColors.red,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                itemCount: results.length,
                itemBuilder: (context, index) {
                  final result = results[index];
                  final question = questions[result.questionIndex];

                  return Container(
                    margin: EdgeInsets.only(bottom: screenHeight * 0.018),
                    padding: EdgeInsets.all(screenWidth * 0.04),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              result.isCorrect ? Icons.check_circle : Icons.cancel,
                              color: result.isCorrect ? AppColors.darkergreen : AppColors.red,
                              size: screenWidth * 0.06,
                            ),
                            SizedBox(width: screenWidth * 0.02),
                            Expanded(
                              child: Text(
                                'Question ${index + 1}',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.04,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        if (question.imageUrl != null) ...[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                child: Image.asset(
                                  question.imageUrl!,
                                  width: screenWidth * 0.18,
                                  height: screenWidth * 0.18,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      width: screenWidth * 0.25,
                                      height: screenWidth * 0.25,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                      ),
                                      child: const Icon(Icons.broken_image, size: 30),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.04),
                              Expanded(
                                child: Text(
                                  result.question,
                                  style: TextStyle(fontSize: screenWidth * 0.038),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.02),
                        ] else ...[
                          Text(
                            result.question,
                            style: TextStyle(fontSize: screenWidth * 0.038),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                        ],
                        if (result.userAnswer != -1)
                          Text(
                            'Your Answer: ${question.options[result.userAnswer]}',
                            style: TextStyle(
                              fontSize: screenWidth * 0.035,
                              color: result.isCorrect ? AppColors.darkergreen : AppColors.red,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        else
                          Text(
                            'No answer selected',
                            style: TextStyle(
                              fontSize: screenWidth * 0.035,
                              color: Colors.orange,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        if (!result.isCorrect)
                          Text(
                            'True Answer: ${question.options[result.correctAnswer]}',
                            style: TextStyle(
                              fontSize: screenWidth * 0.035,
                              color: AppColors.darkergreen,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.05),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.red,
                    padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Back to Score',
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}