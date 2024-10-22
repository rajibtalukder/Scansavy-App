import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scansavy/mvc/views/welcome_screen.dart';

import '../../custom_widgets/custom_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 30.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 260.h),
            SizedBox(
              height: 206.h,
              width: 160.w,
              child: Image.asset('assets/images/logo.png',
                  fit: BoxFit.contain),
            ),
            SizedBox(height: 220.h),
            customButton('Get Started',onPressed: () {
              Get.to(const WelcomeScreen());
            },),
          ],
        ),
      ),
    );
  }
}