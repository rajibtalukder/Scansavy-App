import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scansavy/mvc/views/profile/widgets/personal_info_data.dart';

import '../../../../constants/colors.dart';
import '../../../../custom_widgets/custom_texts.dart';
import '../../../controllers/profile_controller.dart';

class PersonalInfoWidget extends StatelessWidget {
   PersonalInfoWidget({super.key});
   ProfileController profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        id: 'expandUpdate',
        builder: (context) {
          return Container(
            height: profileController.isExpanded.value ? 298.h : 48.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            margin:
            EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
              color: white,
              boxShadow: const [
                BoxShadow(
                  color: grey,
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: Offset(0, 0), // Shadow position
                ),
              ],
            ),
            child: Column(
              children: [
                SizedBox(height: 12.h),
                GestureDetector(
                  onTap: () {
                    profileController.expandedFun();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      subTitleText('Personal Information',
                          size: 16, fontWeight: FontWeight.w500),
                      const Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                ),
                profileController.isExpanded.value
                    ? Column(
                  children: [
                    personalInfoData('Username', profileController.userData?.userName??""),
                    personalInfoData('Email', profileController.userData?.emailOrPhone??""),
                    personalInfoData('Mobile Number', '+01766482816'),
                    personalInfoData('Password', profileController.userData?.confirmPassword??"",
                        isLine: false),
                  ],
                )
                    : const SizedBox()
              ],
            ),
          );
        });
  }


}
