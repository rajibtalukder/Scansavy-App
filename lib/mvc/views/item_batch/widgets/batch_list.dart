import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scansavy/mvc/controllers/item_batch_controller.dart';
import 'package:scansavy/mvc/views/item_batch/view_batch_item_screen.dart';

import '../../../../constants/colors.dart';
import '../../../../custom_widgets/custom_button.dart';
import '../../../../custom_widgets/custom_texts.dart';
import '../item_batch_screen2.dart';

Widget batchList(ItemBatchController controller) {
  return SingleChildScrollView(
    child: Column(
      children: [
        SizedBox(
          height: 640.h,
          child: SingleChildScrollView(
            child: Column(
              children: [
                for (int i = 0; i < controller.batchCount.value; i++)
                  Padding(
                    padding:
                    EdgeInsets.only(bottom: 16.h, left: 16.w, right: 16.w),
                    child: Material(
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      shadowColor: grey.withOpacity(0.5),
                      color: white,
                      child: ListTile(
                        onTap: (){
                          Get.to(const ViewBatchItemScreen());
                        },
                        title: subTitleText('Batch Name',
                            size: 16, fontWeight: FontWeight.w500),
                        subtitle: subTitleText('0 Item',
                            size: 14, fontWeight: FontWeight.w400),
                        leading: Container(
                          height: 48.h,
                          width: 36.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              image: const DecorationImage(
                                  image: AssetImage('assets/images/img1.jpg'),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(16.h),
          child: customButton('Create Batch', fontW: FontWeight.w400,
              onPressed: () {
                Get.to(ItemBatchScreen2());
              }),
        ),
      ],
    ),
  );
}