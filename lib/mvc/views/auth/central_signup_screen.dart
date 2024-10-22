import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:scansavy/custom_widgets/custom_texts.dart';
import 'package:scansavy/mvc/views/auth/business_signup_screen1.dart';
import 'package:scansavy/mvc/views/auth/general_signup_screen1.dart';
import 'package:scansavy/mvc/views/auth/general_signup_screen2.dart';

import '../../../constants/colors.dart';
import '../../../custom_widgets/custom_button.dart';

class CentralSignupScreen extends StatelessWidget {
  const CentralSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 86.h),
            titleText('Start sharing items with Scansavy',
                fontWeight: FontWeight.w600, size: 32),
            SizedBox(height: 40.h),
            SizedBox(
              height: 280.h,
              width: 280.w,
              child: SvgPicture.asset("assets/images/central_image.svg"),
            ),
            Spacer(),
            customButton('Sign Up as General User',
                color: yellow, fontW: FontWeight.w400, onPressed: () {
              Get.to( GeneralSignupScreen1());
            }),
            SizedBox(height: 20.h),
            customButton('Sign Up as Business', fontW: FontWeight.w400,
                onPressed: () {
              Get.to(const BusinessSignupScreen1());
            }),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
