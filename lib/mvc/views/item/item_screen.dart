import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scansavy/constants/colors.dart';
import 'package:scansavy/custom_widgets/custom_button.dart';
import 'package:scansavy/custom_widgets/custom_text_field.dart';
import 'package:scansavy/custom_widgets/custom_texts.dart';
import 'package:scansavy/mvc/controllers/item_controller.dart';
import 'package:scansavy/mvc/controllers/profile_controller.dart';
import 'package:scansavy/mvc/views/item/widgets/image_box_widget.dart';

class ItemScreen extends StatelessWidget {
  ItemScreen({super.key});

  ItemController itemController = Get.put(ItemController());
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: subTitleText('Post Item', fontWeight: FontWeight.w500, size: 20),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: GetBuilder<ItemController>(
            id: 'imgPathUpdate',
            builder: (authController) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImageBoxWidget(),
                    itemController.imagePath.isEmpty
                        ? const SizedBox()
                        : SizedBox(height: 16.h),
                    itemController.imagePath.isEmpty
                        ? const SizedBox()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customButton('Choose New',
                                  color: yellow,
                                  height: 36.h,
                                  width: 164.w,
                                  textSize: 14,
                                  fontW: FontWeight.w400, onPressed: () {
                                itemController.imagePath = '';
                                itemController.update(['imgPathUpdate']);
                              }),
                              customButton('Remove',
                                  color: white,
                                  brdr: true,
                                  height: 36.h,
                                  width: 164.w,
                                  textSize: 14,
                                  textColor: black,
                                  fontW: FontWeight.w400, onPressed: () {
                                itemController.imagePath = '';
                                itemController.update(['imgPathUpdate']);
                              }),
                            ],
                          ),
                    SizedBox(height: 24.h),
                    subTitleText('Item Name',
                        size: 16, fontWeight: FontWeight.w500),
                    SizedBox(height: 8.h),
                    customTextField(TextEditingController(),
                        hintText: 'Enter Product Name'),
                    SizedBox(height: 16.h),
                    subTitleText('Item Category',
                        size: 16, fontWeight: FontWeight.w500),
                    SizedBox(height: 8.h),
                    customTextField(TextEditingController(),
                        isActive: false,
                        hintText: 'Select Category',
                        icon: Icons.keyboard_arrow_down,
                        iconColor: secondaryTextColor),
                    SizedBox(height: 16.h),
                    subTitleText('Item Link',
                        size: 16, fontWeight: FontWeight.w500),
                    SizedBox(height: 8.h),
                    customTextField(TextEditingController(),
                        hintText: 'Enter Website Link of Item'),
                    SizedBox(height: 16.h),
                    subTitleText('Item Tags',
                        size: 16, fontWeight: FontWeight.w500),
                    SizedBox(height: 8.h),
                    customTextField(TextEditingController(),
                        hintText: 'Enter Similar Tags'),
                    SizedBox(height: 32.h),
                    customButton('Post Item', fontW: FontWeight.w400,
                        onPressed: () {
                      profileController.itemCount.value++;
                      profileController.update();
                      itemController.imagePath = '';
                      itemController.update(['imgPathUpdate']);
                      Get.snackbar(
                        margin: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 70.h),
                        'Item Posted',
                        "",
                        colorText: Colors.white,
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: black,
                      );
                    }),
                    SizedBox(height: 32.h),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
