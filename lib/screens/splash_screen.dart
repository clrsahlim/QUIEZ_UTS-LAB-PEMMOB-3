import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'category_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.beige,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.beige,
          ),
          child: Center(
            child: Container(
              width: screenWidth * 0.9,
              constraints: const BoxConstraints(maxWidth: 500),
              padding: EdgeInsets.all(screenWidth * 0.08),
              decoration: BoxDecoration(
                color: AppColors.beige,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Hi there,\nWelcome to',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                      height: 1.3,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: screenWidth * 0.14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Merriweather',
                      ),
                      children: const [
                        TextSpan(text: 'Q', style: TextStyle(color: AppColors.red)),
                        TextSpan(text: 'U', style: TextStyle(color: AppColors.yellow)),
                        TextSpan(text: 'I', style: TextStyle(color: AppColors.green)),
                        TextSpan(text: 'E', style: TextStyle(color: AppColors.pink)),
                        TextSpan(text: 'Z', style: TextStyle(color: AppColors.blue)),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  Image.asset(
                    'assets/images/AppLogo.png',
                    width: screenWidth * 0.45,
                    height: screenWidth * 0.45,
                  ),

                  SizedBox(height: screenHeight * 0.05),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CategoryScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.red,
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.1,
                        vertical: screenHeight * 0.015,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 5,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Start the Quiz',
                          style: TextStyle(
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Poppins'
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        Icon(Icons.arrow_forward, color: Colors.white, size: screenWidth * 0.05),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}