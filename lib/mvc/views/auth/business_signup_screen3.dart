import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';
import '../../../custom_widgets/custom_button.dart';
import '../../../custom_widgets/custom_text_field.dart';
import '../../../custom_widgets/custom_texts.dart';

class BusinessSignupScreen3 extends StatelessWidget {
  const BusinessSignupScreen3({super.key});

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
              subTitleText('One More Step to \nGo', size: 32),
              SizedBox(height: 30.h),
              subTitleText('Set Password',
                  fontWeight: FontWeight.w500, size: 16),
              SizedBox(height: 8.h),
              customTextField(TextEditingController(),
                  hintText: 'Enter Password',
                  obscureText: true,
                  icon: Icons.visibility_off_outlined),
              SizedBox(height: 12.h),
              subTitleText(
                  'Password must contain minimum 1 digit and \nspecial character',
                  fontWeight: FontWeight.w400,
                  color: secondaryTextColor,
                  size: 14),
              SizedBox(height: 20.h),
              subTitleText('Confirm Password',
                  fontWeight: FontWeight.w500, size: 16),
              SizedBox(height: 8.h),
              customTextField(TextEditingController(),
                  hintText: 'Enter Password',
                  obscureText: true,
                  icon: Icons.visibility_off_outlined),
              SizedBox(height: 30.h),
              customButton('Sign Up', fontW: FontWeight.w400),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
