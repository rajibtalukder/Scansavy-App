import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scansavy/mvc/views/auth/central_signup_screen.dart';
import 'package:scansavy/constants/colors.dart';
import 'package:scansavy/custom_widgets/custom_button.dart';
import 'package:scansavy/custom_widgets/custom_texts.dart';
import 'package:scansavy/mvc/views/custom_navigation_bar.dart';

import 'auth/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 20.h,
        ),
        child: Column(
          children: [
            SizedBox(height: 90.h),
            SizedBox(
              height: 250.h,
              width: 250.w,
              child: Image.asset('assets/images/qr_man.png', fit: BoxFit.cover),
            ),
            SizedBox(height: 30.h),
            Align(
                alignment: Alignment.topLeft,
                child: subTitleText('Welcome To \nScansavy', size: 32)),
            SizedBox(height: 10.h),
            Align(
                alignment: Alignment.topLeft,
                child: subTitleText(
                    'Post, Scan & Share Items Around the World.',
                    size: 14,
                    fontWeight: FontWeight.w500)),
            SizedBox(height: 30.h),
            customButton('Sign Up', color: yellow, fontW: FontWeight.w400,
                onPressed: () {
              Get.to(const CentralSignupScreen());
            }),
            SizedBox(height: 20.h),
            customButton('Login', fontW: FontWeight.w400, onPressed: () {
              Get.to( LoginScreen());
            }),
            SizedBox(height: 50.h),
            GestureDetector(
              onTap: () {
                Get.to(CustomNavigationBar());
              },
              child: SizedBox(
                height: 56.h,
                child:
                    subTitleText('Skip For Now', fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
    );
  }
}
