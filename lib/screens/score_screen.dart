import 'package:flutter/material.dart';
import 'package:quiez_clarissa_labpm3/screens/result_details_screen.dart';
import '../models/quiz_result.dart';
import '../widgets/circular_progress.dart';
import 'category_screen.dart';
import '../utils/app_colors.dart';

class ScoreScreen extends StatelessWidget {
  final String userName;
  final String category;
  final List<QuizResult> results;
  final int totalQuestions;

  const ScoreScreen({
    super.key,
    required this.userName,
    required this.category,
    required this.results,
    required this.totalQuestions,
  });

  int get correctAnswers => results.where((r) => r.isCorrect).length;
  int get wrongAnswers => results.where((r) => !r.isCorrect && r.userAnswer != -1).length;
  int get score => ((correctAnswers / totalQuestions) * 100).round();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.red,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.05),
              child: Row(
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
            ),
            Expanded(
              child: Align(
                alignment: const Alignment(0, -0.2),
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      width: screenWidth * 0.9,
                      constraints: const BoxConstraints(maxWidth: 500),
                      margin: EdgeInsets.only(top: screenWidth * 0.175),
                      padding: EdgeInsets.only(
                        top: screenWidth * 0.22,
                        left: screenWidth * 0.08,
                        right: screenWidth * 0.08,
                        bottom: screenWidth * 0.08,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.beige,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            userName,
                            style: TextStyle(
                              fontSize: screenWidth * 0.065,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.038,
                              vertical: screenHeight * 0.008,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.pink,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              category,
                              style: TextStyle(
                                fontSize: screenWidth * 0.035,
                                fontWeight: FontWeight.w800,
                                color: AppColors.red,
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.025),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.04,
                              vertical: screenHeight * 0.015,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: AppColors.yellow,
                                width: 2,
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    _buildStatItem(
                                      icon: Icons.quiz,
                                      value: totalQuestions.toString(),
                                      label: 'Questions',
                                      color: AppColors.darkerblue,
                                      screenWidth: screenWidth,
                                    ),
                                    Container(
                                      height: screenWidth * 0.12,
                                      width: 2,
                                      color: AppColors.yellow,
                                    ),
                                    _buildStatItem(
                                      icon: Icons.check_circle,
                                      value: correctAnswers.toString().padLeft(2, '0'),
                                      label: 'Correct',
                                      color: AppColors.darkergreen,
                                      screenWidth: screenWidth,
                                    ),
                                    Container(
                                      height: screenWidth * 0.12,
                                      width: 2,
                                      color: AppColors.yellow,
                                    ),
                                    _buildStatItem(
                                      icon: Icons.cancel,
                                      value: wrongAnswers.toString().padLeft(2, '0'),
                                      label: 'Wrong',
                                      color: AppColors.red,
                                      screenWidth: screenWidth,
                                    ),
                                  ],
                                ),
                                SizedBox(height: screenHeight * 0.015),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ResultDetailsScreen(
                                          userName: userName,
                                          category: category,
                                          results: results,
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.yellow,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.035,
                                      vertical: screenHeight * 0.008,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Text(
                                    'See Result Details',
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.035,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Poppins',
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.025),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (_) => const CategoryScreen()),
                                      (route) => false,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.darkerblue,
                                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              child: Text(
                                'Try Another Quiz',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.04,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 0,
                      child: CircularProgress(
                        score: score,
                        size: screenWidth * 0.35,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required String value,
    required String label,
    required double screenWidth,
    required Color color,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: screenWidth * 0.06,
              color: color,
            ),
            SizedBox(width: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: screenWidth * 0.035,
            fontWeight: FontWeight.w800,
            color: color,
          ),
        ),
      ],
    );
  }
}