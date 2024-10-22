import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scansavy/constants/colors.dart';
import 'package:scansavy/custom_widgets/custom_texts.dart';

Future<void> showCustomDialog(BuildContext context, String title, Widget widget,
    int heightReduce, int widthReduce,
    {bool reducePop = false}) async {
  showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
          backgroundColor: white,
          child: Container(
            width: widthReduce.w,
            height: heightReduce.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: secondaryTextColor,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: subTitleText(title),
                  ),
                ),
                SizedBox(height: 10.h),
                Expanded(
                  child: widget,
                ),
              ],
            ),
          ));
    },
  );
}


