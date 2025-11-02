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
    final darkerColor = _getDarkerColor(color);
    final textColor = _getTextColor(color);
    final circleColor = _getCircleColor(color);
    final labelColor = _getLabelColor(color);

    return Padding(
      padding: EdgeInsets.only(bottom: screenWidth * 0.04),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04,
            vertical: screenWidth * 0.03,
          ),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
            border: isSelected
                ? Border.all(color: Colors.white, width: 3)
                : null,
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
                width: screenWidth * 0.08,
                height: screenWidth * 0.08,
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
                      fontSize: screenWidth * 0.04,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
              SizedBox(width: screenWidth * 0.03),
              Expanded(
                child: Text(
                  answer,
                  style: TextStyle(
                    color: textColor,
                    fontSize: screenWidth * 0.04,
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