import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scansavy/mvc/controllers/authentication_controller.dart';
import 'package:scansavy/mvc/views/auth/general_signup_screen2.dart';

import '../../../constants/colors.dart';
import '../../../custom_widgets/custom_button.dart';
import '../../../custom_widgets/custom_text_field.dart';
import '../../../custom_widgets/custom_texts.dart';

class GeneralSignupScreen1 extends StatelessWidget {
  GeneralSignupScreen1({super.key});

  final AuthenticationController _authController = Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 20.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 120.h),
              subTitleText('Sign Up to Your \nAccount', size: 32),
              SizedBox(height: 30.h),
              subTitleText('Username',
                  fontWeight: FontWeight.w500, size: 16),
              SizedBox(height: 8.h),
              customTextField(_authController.userNameCntlr,
                  hintText: 'Enter Username'),
              SizedBox(height: 12.h),
              subTitleText('Email or Phone Number',
                  fontWeight: FontWeight.w500, size: 16),
              SizedBox(height: 8.h),
              customTextField(_authController.emailPhnCntlr,
                  hintText: 'Enter Email or Phone Number'),
              SizedBox(height: 30.h),
              customButton('Next', fontW: FontWeight.w400, onPressed: () {
                Get.to(GeneralSignupScreen2());
              }),
              SizedBox(height: 20.h),
              firstRow(),
              SizedBox(height: 20.h),
              secondRow(),
            ],
          ),
        ),
      ),
    );
  }

  Row secondRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 50.h,
          width: 50.w,
          child: Image.asset('assets/images/apple.png', fit: BoxFit.cover),
        ),
        SizedBox(width: 20.w),
        SizedBox(
          height: 50.h,
          width: 50.w,
          child: Image.asset('assets/images/google.png', fit: BoxFit.cover),
        ),
      ],
    );
  }

  Row firstRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 1.h,
          width: 100.w,
          color: black,
        ),
        subTitleText('Or Continue With',
            fontWeight: FontWeight.w500, size: 14),
        Container(
          height: 1.h,
          width: 100.w,
          color: black,
        ),
      ],
    );
  }
}
