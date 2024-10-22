import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../../../custom_widgets/custom_texts.dart';
import '../../item_batch/item_batch_screen1.dart';

Widget drawerWidget() {
  return Drawer(
    backgroundColor: white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(0), bottomRight: Radius.circular(0)),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 64.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: 99.h,
              width: 123.w,
              child: Image.asset('assets/images/drawerLogo.png',
                  fit: BoxFit.contain)),
          SizedBox(height: 32.h),
          GestureDetector(
              onTap: (){
                Get.to( ItemBatchScreen1());
              },
              child: row('assets/images/books.png', 'Item Batches')),
          row('assets/images/fav.png', 'Favorite Items'),
          row('assets/images/analytics.png', 'Analytics'),
          row('assets/images/timer.png', 'Activity & History'),
          row('assets/images/setting.png', 'Settings'),
          row('assets/images/support.png', 'Support & Help'),
          row('assets/images/logout.png', 'Logout'),
        ],
      ),
    ),
  );
}

Padding row(String imgUrl, String name) {
  return Padding(
    padding:  EdgeInsets.only(bottom: 24.h),
    child: Row(
      children: [
        SizedBox(
            height: 22.h,
            width: 24.w,
            child: Image.asset(imgUrl,
                fit: BoxFit.cover)),
        SizedBox(width: 16.w),
        subTitleText(name,
            size: 16,
            fontWeight: FontWeight.w500,
            color: secondaryDarkTextColor),
      ],
    ),
  );
}