import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget trendingItems() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    physics: const BouncingScrollPhysics(),
    child: Row(
      children: [
        for (int i = 0; i < 6; i++)
          Container(
            margin: EdgeInsets.only(right: 10.w),
            height: 160.h,
            width: 120.w,
            decoration: BoxDecoration(
                borderRadius:
                BorderRadius.all(Radius.circular(10.r)),
                image: const DecorationImage(
                    image: AssetImage('assets/images/img1.jpg'),
                    fit: BoxFit.cover)),
          )
      ],
    ),
  );
}