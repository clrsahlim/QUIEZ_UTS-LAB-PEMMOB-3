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
    final screenHeight = MediaQuery.of(context).size.height;
    final isLandscape = screenWidth > screenHeight;

    // Gunakan height untuk landscape, width untuk portrait
    final baseFontSize = isLandscape ? screenHeight : screenWidth;

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
              minHeight: baseFontSize * 0.022,
            ),
          ),
        ),
        SizedBox(width: baseFontSize * 0.025),
        Text(
          '$currentQuestion/$totalQuestions',
          style: TextStyle(
            color: AppColors.yellow,
            fontSize: baseFontSize * 0.035,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}