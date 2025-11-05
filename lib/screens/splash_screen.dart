import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/responsive_utils.dart';
import 'category_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

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
            child: SingleChildScrollView(
              child: Container(
                width: responsive.containerWidth(),
                constraints: responsive.containerConstraints(),
                padding: responsive.padding(all: responsive.isDesktop ? 4 : (responsive.isLandscape ? 4 : 8)),
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
                        fontSize: responsive.fontSize(
                          mobile: 0.06,
                          landscape: 0.07,
                          desktop: 28,
                        ),
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                        height: 1.3,
                      ),
                    ),
                    SizedBox(height: responsive.spacing(
                      mobile: 0.015,
                      landscape: 0.02,
                      desktop: 12,
                    )),

                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: responsive.fontSize(
                            mobile: 0.14,
                            landscape: 0.15,
                            desktop: 72,
                          ),
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

                    SizedBox(height: responsive.spacing(
                      mobile: 0.03,
                      landscape: 0.04,
                      desktop: 30,
                    )),

                    Image.asset(
                      'assets/images/AppLogo.png',
                      width: responsive.isDesktop
                          ? 200
                          : (responsive.isLandscape
                          ? responsive.heightPercent(35)
                          : responsive.widthPercent(45)),
                      height: responsive.isDesktop
                          ? 200
                          : (responsive.isLandscape
                          ? responsive.heightPercent(35)
                          : responsive.widthPercent(45)),
                      fit: BoxFit.contain,
                    ),

                    SizedBox(height: responsive.spacing(
                      mobile: 0.05,
                      landscape: 0.06,
                      desktop: 40,
                    )),

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
                          horizontal: responsive.isDesktop
                              ? 50
                              : (responsive.isLandscape
                              ? responsive.heightPercent(8)
                              : responsive.widthPercent(10)),
                          vertical: responsive.isDesktop
                              ? 16
                              : (responsive.isLandscape
                              ? responsive.heightPercent(2.5)
                              : responsive.heightPercent(1.5)),
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
                                fontSize: responsive.fontSize(
                                  mobile: 0.045,
                                  landscape: 0.045,
                                  desktop: 18,
                                ),
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'Poppins'
                            ),
                          ),
                          SizedBox(width: responsive.spacing(
                            mobile: 0.02,
                            desktop: 12,
                          )),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: responsive.iconSize(
                              mobile: 0.05,
                              landscape: 0.06,
                              desktop: 20,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: responsive.heightPercent(2)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}