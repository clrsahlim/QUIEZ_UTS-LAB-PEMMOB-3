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
    final isLandscape = screenWidth > screenHeight;

    final baseFontSize = isLandscape ? screenHeight : screenWidth;
    final baseSpacing = isLandscape ? screenHeight : screenWidth;

    return Scaffold(
      backgroundColor: AppColors.red,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(isLandscape ? baseSpacing * 0.04 : screenWidth * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    iconSize: isLandscape ? 24 : 24,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () => Navigator.pop(context),
                  ),
                  IconButton(
                    icon: const Icon(Icons.home, color: Colors.white),
                    iconSize: isLandscape ? 24 : 24,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Align(
                  alignment: isLandscape ? Alignment.center : const Alignment(0, -0.2),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: isLandscape ? baseSpacing * 0.02 : 0,
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          width: isLandscape ? screenWidth * 0.7 : screenWidth * 0.9,
                          constraints: BoxConstraints(maxWidth: isLandscape ? 600 : 500),
                          margin: EdgeInsets.only(
                            top: isLandscape ? baseSpacing * 0.15 : screenWidth * 0.175,
                          ),
                          padding: EdgeInsets.only(
                            top: isLandscape ? baseSpacing * 0.25 : screenWidth * 0.22,
                            left: isLandscape ? baseSpacing * 0.06 : screenWidth * 0.08,
                            right: isLandscape ? baseSpacing * 0.06 : screenWidth * 0.08,
                            bottom: isLandscape ? baseSpacing * 0.065 : screenWidth * 0.08,
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
                                  fontSize: isLandscape ? baseFontSize * 0.055 : screenWidth * 0.065,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(height: isLandscape ? baseSpacing * 0.01 : screenHeight * 0.01),

                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: isLandscape ? baseSpacing * 0.03 : screenWidth * 0.038,
                                  vertical: isLandscape ? baseSpacing * 0.008 : screenHeight * 0.008,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.pink,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  category,
                                  style: TextStyle(
                                    fontSize: isLandscape ? baseFontSize * 0.032 : screenWidth * 0.035,
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.red,
                                  ),
                                ),
                              ),
                              SizedBox(height: isLandscape ? baseSpacing * 0.05 : screenHeight * 0.025),

                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: isLandscape ? baseSpacing * 0.03 : screenWidth * 0.04,
                                  vertical: isLandscape ? baseSpacing * 0.015 : screenHeight * 0.015,
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
                                    // Stats row
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        _buildStatItem(
                                          icon: Icons.quiz,
                                          value: totalQuestions.toString(),
                                          label: 'Questions',
                                          color: AppColors.darkerblue,
                                          screenWidth: screenWidth,
                                          baseFontSize: baseFontSize,
                                          isLandscape: isLandscape,
                                        ),
                                        Container(
                                          height: isLandscape ? baseFontSize * 0.1 : screenWidth * 0.12,
                                          width: 2,
                                          color: AppColors.yellow,
                                        ),
                                        _buildStatItem(
                                          icon: Icons.check_circle,
                                          value: correctAnswers.toString().padLeft(2, '0'),
                                          label: 'Correct',
                                          color: AppColors.darkergreen,
                                          screenWidth: screenWidth,
                                          baseFontSize: baseFontSize,
                                          isLandscape: isLandscape,
                                        ),
                                        Container(
                                          height: isLandscape ? baseFontSize * 0.1 : screenWidth * 0.12,
                                          width: 2,
                                          color: AppColors.yellow,
                                        ),
                                        _buildStatItem(
                                          icon: Icons.cancel,
                                          value: wrongAnswers.toString().padLeft(2, '0'),
                                          label: 'Wrong',
                                          color: AppColors.red,
                                          screenWidth: screenWidth,
                                          baseFontSize: baseFontSize,
                                          isLandscape: isLandscape,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: isLandscape ? baseSpacing * 0.015 : screenHeight * 0.015),

                                    // See Result Details button
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
                                          horizontal: isLandscape ? baseSpacing * 0.03 : screenWidth * 0.035,
                                          vertical: isLandscape ? baseSpacing * 0.012 : screenHeight * 0.008,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                      ),
                                      child: Text(
                                        'See Result Details',
                                        style: TextStyle(
                                          fontSize: isLandscape ? baseFontSize * 0.032 : screenWidth * 0.035,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Poppins',
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: isLandscape ? baseSpacing * 0.07 : screenHeight * 0.025),

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
                                    padding: EdgeInsets.symmetric(
                                      vertical: isLandscape ? baseSpacing * 0.015 : screenHeight * 0.015,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                  child: Text(
                                    'Try Another Quiz',
                                    style: TextStyle(
                                      fontSize: isLandscape ? baseFontSize * 0.038 : screenWidth * 0.04,
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
                            size: isLandscape ? null : screenWidth * 0.35,
                          ),
                        ),
                      ],
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

  Widget _buildStatItem({
    required IconData icon,
    required String value,
    required String label,
    required double screenWidth,
    required double baseFontSize,
    required bool isLandscape,
    required Color color,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: isLandscape ? baseFontSize * 0.05 : screenWidth * 0.06,
              color: color,
            ),
            SizedBox(width: isLandscape ? baseFontSize * 0.01 : 8),
            Text(
              value,
              style: TextStyle(
                fontSize: isLandscape ? baseFontSize * 0.045 : screenWidth * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: isLandscape ? baseFontSize * 0.03 : screenWidth * 0.035,
            fontWeight: FontWeight.w800,
            color: color,
          ),
        ),
      ],
    );
  }
}