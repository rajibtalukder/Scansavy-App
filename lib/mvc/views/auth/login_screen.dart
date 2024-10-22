import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scansavy/constants/colors.dart';
import 'package:scansavy/custom_widgets/custom_text_field.dart';
import 'package:scansavy/mvc/controllers/authentication_controller.dart';
import 'package:scansavy/mvc/views/auth/general_signup_screen1.dart';
import '../../../custom_widgets/custom_button.dart';
import '../../../custom_widgets/custom_texts.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final AuthenticationController _authController =
      Get.put(AuthenticationController());

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
              SizedBox(height: 110.h),
              subTitleText('Login to your \naccount', size: 32),
              SizedBox(height: 30.h),
              subTitleText('Username', fontWeight: FontWeight.w500, size: 16),
              SizedBox(height: 8.h),
              customTextField(_authController.signinEmail,
                  hintText: 'Enter Username'),
              SizedBox(height: 12.h),
              subTitleText('Password', fontWeight: FontWeight.w500, size: 16),
              SizedBox(height: 8.h),
              GetBuilder<AuthenticationController>(
                  id: "passUpdate",
                  builder: (context) {
                    return customTextField(_authController.signinPass,
                        hintText: 'Enter Password',
                        icon: _authController.passHide.value
                            ? Icons.visibility
                            : Icons.visibility_off_outlined,
                        onSufIconPress: () {
                      _authController.passValueChange();
                    },
                        obscureText:
                            _authController.passHide.value ? false : true);
                  }),
              SizedBox(height: 12.h),
              subTitleText('Forgot password?', color: yellow, size: 14),
              SizedBox(height: 30.h),
              customButton('Login', fontW: FontWeight.w400, onPressed: () {
                _authController.signIn();
              }),
              SizedBox(height: 20.h),
              firstRow(),
              SizedBox(height: 20.h),
              secondRow(),
              SizedBox(height: 80.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  subTitleText('Don’t have an account? ',
                      fontWeight: FontWeight.w500, size: 18),
                  GestureDetector(
                    onTap: () {
                      Get.to(GeneralSignupScreen1());
                    },
                    child: subTitleText('Sign UP',
                        color: yellow, fontWeight: FontWeight.w500, size: 18),
                  ),
                ],
              )
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
        subTitleText('Or Continue With', fontWeight: FontWeight.w500, size: 14),
        Container(
          height: 1.h,
          width: 100.w,
          color: black,
        ),
      ],
    );
  }
}
