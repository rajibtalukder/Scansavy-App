import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scansavy/constants/colors.dart';
import 'package:scansavy/mvc/views/auth/login_screen.dart';
import '../../../custom_widgets/custom_button.dart';
import '../../../custom_widgets/custom_text_field.dart';
import '../../../custom_widgets/custom_texts.dart';
import '../../controllers/authentication_controller.dart';

class GeneralSignupScreen2 extends StatelessWidget {
  GeneralSignupScreen2({super.key});
  final AuthenticationController _authController = Get.find();

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
              customTextField(_authController.passCntlr,
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
                  fontWeight: FontWeight.w500, size: 16 ),
              SizedBox(height: 8.h),
              customTextField(_authController.conPassCntlr,
                  hintText: 'Enter Password',
                  obscureText: true,
                  icon: Icons.visibility_off_outlined),
              SizedBox(height: 30.h),
              customButton('Sign Up', onPressed: (){
                _authController.signUp();
              }, fontW: FontWeight.w400),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
