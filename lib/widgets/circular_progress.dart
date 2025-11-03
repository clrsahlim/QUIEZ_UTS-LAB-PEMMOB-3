import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CircularProgress extends StatelessWidget {
  final int score;
  final double size;

  const CircularProgress({
    super.key,
    required this.score,
    required this.size,
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
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: size,
          height: size,
          child: CircularProgressIndicator(
            value: score / 100,
            strokeWidth: size * 0.1,
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation<Color>(_getProgressColor()),
          ),
        ),
        Container(
          width: 0.9 * size,
          height: 0.9 * size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.beige,
          ),
          child: Center(
            child: Text(
              score.toString(),
              style: TextStyle(
                fontSize: size * 0.4,
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