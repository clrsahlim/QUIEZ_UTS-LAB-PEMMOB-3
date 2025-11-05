import 'package:flutter/material.dart';
import '../models/quiz_result.dart';
import '../data/quiz_data.dart';
import 'score_screen.dart';
import '../utils/app_colors.dart';
import '../utils/responsive_utils.dart';

class ResultDetailsScreen extends StatelessWidget {
  final String userName;
  final String category;
  final List<QuizResult> results;

  const ResultDetailsScreen({
    super.key,
    required this.userName,
    required this.category,
    required this.results,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    final questions = QuizData.getAllQuestions()[category] ?? [];

    return Scaffold(
      backgroundColor: AppColors.beige,
      appBar: AppBar(
        backgroundColor: AppColors.beige,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: responsive.iconSize(mobile: 0.06, landscape: 0.06),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: responsive.isLandscape ? 16.0 : 0.0,
            ),
            child: IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.black,
                size: responsive.iconSize(
                  mobile: 0.06,
                  landscape: 0.06,
                ),
              ),
              onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: responsive.containerConstraints(),
            child: Column(
              children: [
                Padding(
                  padding: responsive.padding(horizontal: 5),
                  child: Column(
                    children: [
                      Text(
                        userName,
                        style: TextStyle(
                          fontSize: responsive.fontSize(
                            mobile: 0.06,
                            landscape: 0.045,
                          ),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: responsive.spacing(mobile: 0.01, landscape: 0.008)),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: responsive.widthPercent(4),
                          vertical: responsive.spacing(mobile: 0.008, landscape: 0.006),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.pink,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          category,
                          style: TextStyle(
                            fontSize: responsive.fontSize(
                              mobile: 0.04,
                              landscape: 0.032,
                            ),
                            fontWeight: FontWeight.w800,
                            color: AppColors.red,
                          ),
                        ),
                      ),
                      SizedBox(height: responsive.spacing(mobile: 0.03, landscape: 0.02)),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: responsive.padding(horizontal: 5),
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      final result = results[index];
                      final question = questions[result.questionIndex];

                      return Container(
                        margin: EdgeInsets.only(
                          bottom: responsive.spacing(mobile: 0.018, landscape: 0.012),
                        ),
                        padding: responsive.padding(all: 4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  result.isCorrect ? Icons.check_circle : Icons.cancel,
                                  color: result.isCorrect ? AppColors.darkergreen : AppColors.red,
                                  size: responsive.iconSize(
                                    mobile: 0.06,
                                    landscape: 0.045,
                                  ),
                                ),
                                SizedBox(width: responsive.widthPercent(2)),
                                Expanded(
                                  child: Text(
                                    'Question ${index + 1}',
                                    style: TextStyle(
                                      fontSize: responsive.fontSize(
                                        mobile: 0.04,
                                        landscape: 0.032,
                                      ),
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: responsive.spacing(mobile: 0.01, landscape: 0.008)),
                            if (question.imageUrl != null) ...[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      question.imageUrl!,
                                      width: responsive.isLandscape
                                          ? responsive.screenHeight * 0.14
                                          : responsive.screenWidth * 0.18,
                                      height: responsive.isLandscape
                                          ? responsive.screenHeight * 0.14
                                          : responsive.screenWidth * 0.18,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Container(
                                          width: responsive.isLandscape
                                              ? responsive.screenHeight * 0.14
                                              : responsive.screenWidth * 0.18,
                                          height: responsive.isLandscape
                                              ? responsive.screenHeight * 0.14
                                              : responsive.screenWidth * 0.18,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Icon(
                                            Icons.broken_image,
                                            size: responsive.iconSize(
                                              mobile: 0.08,
                                              landscape: 0.05,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(width: responsive.widthPercent(4)),
                                  Expanded(
                                    child: Text(
                                      result.question,
                                      style: TextStyle(
                                        fontSize: responsive.fontSize(
                                          mobile: 0.038,
                                          landscape: 0.028,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: responsive.spacing(mobile: 0.02, landscape: 0.012)),
                            ] else ...[
                              Text(
                                result.question,
                                style: TextStyle(
                                  fontSize: responsive.fontSize(
                                    mobile: 0.038,
                                    landscape: 0.028,
                                  ),
                                ),
                              ),
                              SizedBox(height: responsive.spacing(mobile: 0.02, landscape: 0.012)),
                            ],
                            if (result.userAnswer != -1)
                              Text(
                                'Your Answer: ${question.options[result.userAnswer]}',
                                style: TextStyle(
                                  fontSize: responsive.fontSize(
                                    mobile: 0.035,
                                    landscape: 0.026,
                                  ),
                                  color: result.isCorrect ? AppColors.darkergreen : AppColors.red,
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            else
                              Text(
                                'No answer selected',
                                style: TextStyle(
                                  fontSize: responsive.fontSize(
                                    mobile: 0.035,
                                    landscape: 0.026,
                                  ),
                                  color: Colors.orange,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            if (!result.isCorrect)
                              Padding(
                                padding: EdgeInsets.only(
                                  top: responsive.spacing(mobile: 0.005, landscape: 0.003),
                                ),
                                child: Text(
                                  'True Answer: ${question.options[result.correctAnswer]}',
                                  style: TextStyle(
                                    fontSize: responsive.fontSize(
                                      mobile: 0.035,
                                      landscape: 0.026,
                                    ),
                                    color: AppColors.darkergreen,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: responsive.padding(all: 5),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.red,
                        padding: EdgeInsets.symmetric(
                          vertical: responsive.spacing(mobile: 0.015, landscape: 0.012),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Back to Score',
                        style: TextStyle(
                          fontSize: responsive.fontSize(
                            mobile: 0.045,
                            landscape: 0.032,
                          ),
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}