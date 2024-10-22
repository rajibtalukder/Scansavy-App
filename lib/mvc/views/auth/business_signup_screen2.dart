import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scansavy/mvc/views/auth/business_signup_screen3.dart';

import '../../../constants/colors.dart';
import '../../../custom_widgets/custom_button.dart';
import '../../../custom_widgets/custom_text_field.dart';
import '../../../custom_widgets/custom_texts.dart';

class BusinessSignupScreen2 extends StatelessWidget {
  const BusinessSignupScreen2({super.key});

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
              subTitleText('Add Details About \nYour Business ', size: 32),
              SizedBox(height: 30.h),
              subTitleText('Business Category',
                  fontWeight: FontWeight.w500, size: 16),
              SizedBox(height: 8.h),
              customTextField(TextEditingController(),
                  isActive: false,
                  hintText: 'Select Category',
                  icon: Icons.keyboard_arrow_down,
                  iconColor: secondaryTextColor),
              SizedBox(height: 20.h),
              subTitleText('Business Address',
                  fontWeight: FontWeight.w500, size: 16),
              SizedBox(height: 8.h),
              customTextField(TextEditingController(),
                  isActive: false,
                  hintText: 'Select Location',
                  icon: Icons.keyboard_arrow_down,
                  iconColor: secondaryTextColor),
              SizedBox(height: 20.h),
              subTitleText('Website Link',
                  fontWeight: FontWeight.w500, size: 16),
              SizedBox(height: 8.h),
              customTextField(TextEditingController(), hintText: 'Enter Link'),
              SizedBox(height: 30.h),
              customButton('Next', fontW: FontWeight.w400, onPressed: () {
                Get.to(const BusinessSignupScreen3());
              }),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
