// lib/screens/category_screen.dart
import 'package:flutter/material.dart';
import '../widgets/category_card.dart';
import '../utils/app_colors.dart';
import 'quiz_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final TextEditingController _nameController = TextEditingController();
  String? _selectedCategory;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _startQuiz() {
    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your name')),
      );
      return;
    }
    if (_selectedCategory == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a category')),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => QuizScreen(
          userName: _nameController.text.trim(),
          category: _selectedCategory!,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.beige,
        appBar: AppBar(
          backgroundColor: AppColors.beige,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.home, color: Colors.black),
              onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                            fontSize: screenWidth * 0.1,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Merriweather'
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
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Center(
                    child: Text(
                      'Preparation',
                      style: TextStyle(
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Row(
                    children: [
                      Icon(Icons.person, size: screenWidth * 0.06),
                      SizedBox(width: screenWidth * 0.01),
                      Text(
                        'Your Name',
                        style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Poppins'
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  TextField(
                    controller: _nameController,
                    keyboardType: TextInputType.text,
                    maxLength: 15,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0x80FFFFFF),
                      counterText: '',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: AppColors.red),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: AppColors.red),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: AppColors.red, width: 2),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.04,
                        vertical: screenHeight * 0.015,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Row(
                    children: [
                      Icon(Icons.category, size: screenWidth * 0.06),
                      SizedBox(width: screenWidth * 0.02),
                      Text(
                        'Choose Category',
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CategoryCard(
                            title: 'General\nKnowledge',
                            imagePath: 'assets/images/generalknowledge.png',
                            color: _selectedCategory == 'General Knowledge'
                                ? AppColors.darkerred
                                : AppColors.red,
                            textColor: AppColors.beige,
                            isSelected: _selectedCategory == 'General Knowledge',
                            onTap: () => setState(() => _selectedCategory = 'General Knowledge'),
                          ),
                          CategoryCard(
                            title: 'Greek\nHistory',
                            imagePath: 'assets/images/greekhistory.png',
                            color: _selectedCategory == 'Greek History'
                                ? AppColors.darkerpink
                                : AppColors.pink,
                            textColor: AppColors.red,
                            isSelected: _selectedCategory == 'Greek History',
                            onTap: () => setState(() => _selectedCategory = 'Greek History'),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CategoryCard(
                            title: 'Guess the\nSong',
                            imagePath: 'assets/images/guessthesong.png',
                            color: _selectedCategory == 'Guess the Song'
                                ? AppColors.darkeryellow
                                : AppColors.yellow,
                            textColor: AppColors.red,
                            isSelected: _selectedCategory == 'Guess the Song',
                            onTap: () => setState(() => _selectedCategory = 'Guess the Song'),
                          ),
                          CategoryCard(
                            title: 'Guess the\nSinger',
                            imagePath: 'assets/images/guesstheartist.png',
                            color: _selectedCategory == 'Guess the Singer'
                                ? AppColors.darkerblue
                                : AppColors.blue,
                            textColor: AppColors.black,
                            isSelected: _selectedCategory == 'Guess the Singer',
                            onTap: () => setState(() => _selectedCategory = 'Guess the Singer'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _startQuiz,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.darkergreen,
                        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Start the Quiz',
                            style: TextStyle(
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Icon(Icons.arrow_forward, color: Colors.white, size: screenWidth * 0.05),
                        ],
                      ),
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