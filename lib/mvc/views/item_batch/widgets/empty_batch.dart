import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../custom_widgets/custom_button.dart';
import '../../../../custom_widgets/custom_texts.dart';
import '../item_batch_screen2.dart';

Widget emptyBatch() {
  return Padding(
    padding: EdgeInsets.all(16.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 80.h,
          width: 80.h,
          child: Image.asset('assets/images/question.png', fit: BoxFit.cover),
        ),
        SizedBox(height: 16.h),
        subTitleText('No Batch Created',
            size: 20, fontWeight: FontWeight.w500),
        SizedBox(height: 10.h),
        subTitleText(
            overfl: true,
            textCenter: true,
            'Start adding items from your feed and collection to create batches',
            fontWeight: FontWeight.w400,
            size: 14),
        SizedBox(height: 24.h),
        customButton('Create Batch',
            width: 256.w,
            height: 48.h,
            textSize: 14,
            fontW: FontWeight.w400, onPressed: () {
              Get.to(ItemBatchScreen2());
            })
      ],
    ),
  );
}