import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class ProgressBar extends StatelessWidget {
  final int currentQuestion;
  final int totalQuestions;

  const ProgressBar({
    super.key,
    required this.currentQuestion,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final progress = currentQuestion / totalQuestions;

    return Row(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.white.withOpacity(0.3),
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.yellow),
              minHeight: screenWidth * 0.025,
            ),
          ),
        ),
        SizedBox(width: screenWidth * 0.03),
        Text(
          '$currentQuestion/$totalQuestions',
          style: TextStyle(
            color: AppColors.yellow,
            fontSize: screenWidth * 0.04,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}