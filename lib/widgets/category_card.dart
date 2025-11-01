import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color color;
  final Color textColor;
  final VoidCallback onTap;
  final bool isSelected;

  const CategoryCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.color,
    this.textColor = Colors.white,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardSize = (screenWidth - 60) / 2;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: cardSize,
        height: cardSize * 0.85,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          border: isSelected
              ? Border.all(color: Colors.white, width: 4)
              : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: cardSize * 0.02),
            Image.asset(
              imagePath,
              width: cardSize * 0.3,
              height: cardSize * 0.3,
              fit: BoxFit.contain,
            ),
            SizedBox(height: cardSize * 0.05),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}