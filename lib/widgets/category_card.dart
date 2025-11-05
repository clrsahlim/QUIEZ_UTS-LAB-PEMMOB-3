import 'package:flutter/material.dart';
import '../utils/responsive_utils.dart';

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
    final responsive = ResponsiveUtils(context);

    // Hitung card size berdasarkan orientation
    double cardWidth;
    double cardHeight;

    if (responsive.isLandscape) {
      // Landscape: card lebih kecil dan proporsional dengan tinggi layar
      cardWidth = responsive.screenHeight * 0.35;
      cardHeight = responsive.screenHeight * 0.3;
    } else {
      // Portrait: seperti biasa
      cardWidth = (responsive.screenWidth - 60) / 2;
      cardHeight = cardWidth * 0.85;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: cardWidth,
        height: cardHeight,
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
            SizedBox(height: cardHeight * 0.02),
            Image.asset(
              imagePath,
              width: cardHeight * 0.35,
              height: cardHeight * 0.35,
              fit: BoxFit.contain,
            ),
            SizedBox(height: cardHeight * 0.05),
            Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: cardWidth * 0.05),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: responsive.fontSize(
                      mobile: 0.045,
                      landscape: 0.035,
                    ),
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: cardHeight * 0.02),
          ],
        ),
      ),
    );
  }
}