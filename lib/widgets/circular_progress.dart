import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CircularProgress extends StatelessWidget {
  final int score;
  final double? size;

  const CircularProgress({
    super.key,
    required this.score,
    this.size,
  });

  Color _getProgressColor() {
    if (score >= 80) {
      return AppColors.green;
    } else if (score >= 60) {
      return AppColors.yellow;
    } else {
      return AppColors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isLandscape = screenWidth > screenHeight;

    final circleSize = size ?? (isLandscape ? screenHeight * 0.35 : screenWidth * 0.35);

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: circleSize,
          height: circleSize,
          child: CircularProgressIndicator(
            value: score / 100,
            strokeWidth: circleSize * 0.1,
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation<Color>(_getProgressColor()),
          ),
        ),
        Container(
          width: 0.9 * circleSize,
          height: 0.9 * circleSize,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.beige,
          ),
          child: Center(
            child: Text(
              score.toString(),
              style: TextStyle(
                fontSize: circleSize * 0.4,
                fontWeight: FontWeight.w800,
                color: const Color(0xFFE74C3C),
              ),
            ),
          ),
        ),
      ],
    );
  }
}