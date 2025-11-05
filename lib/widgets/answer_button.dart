import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class AnswerButton extends StatelessWidget {
  final String label;
  final String answer;
  final VoidCallback onTap;
  final Color color;
  final bool isSelected;

  const AnswerButton({
    super.key,
    required this.label,
    required this.answer,
    required this.onTap,
    required this.color,
    this.isSelected = false,
  });

  Color _getDarkerColor(Color color) {
    if (color == AppColors.yellow) return AppColors.darkeryellow;
    if (color == AppColors.blue) return AppColors.darkerblue;
    if (color == AppColors.green) return AppColors.darkergreen;
    if (color == AppColors.pink) return AppColors.darkerpink;
    return color;
  }

  Color _getTextColor(Color color) {
    if (color == AppColors.yellow) return AppColors.red;
    if (color == AppColors.blue) return Colors.black;
    if (color == AppColors.green) return Colors.white;
    if (color == AppColors.pink) return AppColors.red;
    return Colors.white;
  }

  Color _getCircleColor(Color color) {
    if (color == AppColors.yellow) return AppColors.beige;
    if (color == AppColors.blue) return AppColors.darkerblue;
    if (color == AppColors.green) return AppColors.beige;
    if (color == AppColors.pink) return AppColors.red;
    return Colors.white;
  }

  Color _getLabelColor(Color color) {
    if (color == AppColors.yellow) return AppColors.red;
    if (color == AppColors.blue) return AppColors.beige;
    if (color == AppColors.green) return AppColors.darkergreen;
    if (color == AppColors.pink) return AppColors.beige;
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isLandscape = screenWidth > screenHeight;

    final baseFontSize = isLandscape ? screenHeight : screenWidth;
    final baseSpacing = isLandscape ? screenHeight : screenWidth;

    final darkerColor = _getDarkerColor(color);
    final textColor = _getTextColor(color);
    final circleColor = _getCircleColor(color);
    final labelColor = _getLabelColor(color);

    return Padding(
      padding: EdgeInsets.only(bottom: isLandscape ? baseSpacing * 0.02 : baseSpacing * 0.03),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(
            maxWidth: isLandscape ? screenWidth * 0.8 : double.infinity,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: baseSpacing * 0.035,
            vertical: baseSpacing * 0.025,
          ),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
            border: isSelected ? Border.all(color: Colors.white, width: 3) : null,
            boxShadow: [
              BoxShadow(
                color: darkerColor,
                offset: const Offset(0, 4),
                blurRadius: 0,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: baseFontSize * 0.07,
                height: baseFontSize * 0.07,
                decoration: BoxDecoration(
                  color: circleColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    label,
                    style: TextStyle(
                      color: labelColor,
                      fontWeight: FontWeight.bold,
                      fontSize: baseFontSize * 0.035,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
              SizedBox(width: baseSpacing * 0.025),
              Expanded(
                child: Text(
                  answer,
                  style: TextStyle(
                    color: textColor,
                    fontSize: baseFontSize * 0.035,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}