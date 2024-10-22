import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/colors.dart';
import '../../../../custom_widgets/custom_texts.dart';

Widget personalInfoData(String title, String subtitle, {bool isLine = true}) {
  return Column(
    children: [
      SizedBox(height: 12.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              subTitleText(title,
                  fontWeight: FontWeight.w500,
                  color: secondaryDarkTextColor,
                  size: 14),
              subTitleText(subtitle, fontWeight: FontWeight.w500, size: 14),
            ],
          ),
          SizedBox(
            height: 16.h,
            width: 16.h,
            child: Image.asset(
              'assets/images/edit.png',
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
      isLine ? SizedBox(height: 12.h) : SizedBox(),
      isLine
          ? Divider(height: 2.h, color: secondaryTextColor.withOpacity(0.3))
          : const SizedBox(),
    ],
  );
}