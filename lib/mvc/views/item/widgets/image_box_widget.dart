import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../constants/colors.dart';
import '../../../../custom_widgets/custom_button.dart';
import '../../../controllers/postitem_controller.dart';

class ImageBoxWidget extends StatelessWidget {
   ImageBoxWidget({super.key});
   PostItemController itemController = Get.put(PostItemController());

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 457.h,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16.r)),
            border: itemController.imagePath.isEmpty
                ? Border.all(color: secondaryTextColor)
                : null),
        child: itemController.imagePath.isEmpty
            ? Column(
          children: [
            SizedBox(height: 150.h),
            SizedBox(
              height: 150.h,
              width: 150.w,
              child: Image.asset(
                'assets/images/camera.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 35.h),
            customButton('Take Photo',
                height: 36,
                width: 256,
                color: yellow,
                textSize: 14, onPressed: () {
                  itemController
                      .pickedImage(ImageSource.camera);
                }),
            SizedBox(height: 15.h),
            customButton('Choose From Gallery',
                textColor: black,
                height: 36,
                width: 256,
                color: white,
                brdr: true,
                textSize: 14, onPressed: () {
                  itemController
                      .pickedImage(ImageSource.gallery);
                }),
          ],
        )
            : ClipRRect(
          borderRadius:
          BorderRadius.all(Radius.circular(16.r)),
          child: Image.file(
            File(itemController.imagePath),
            fit: BoxFit.cover,
          ),
        ));
  }
}
