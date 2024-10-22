import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/colors.dart';

Widget searchBox() {
  return Container(
    height: 46.h,
    width: double.infinity,
    decoration:
        BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(9999.r))),
    child: Center(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(9999.r)),
        child: TextField(
          controller: TextEditingController(),
          enabled: true,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            border: InputBorder.none,
            filled: true,
            hintText: 'Search item or user',
            hintStyle: const TextStyle(color: secondaryTextColor, fontSize: 14),
            fillColor: grey,
            contentPadding: EdgeInsets.only(top: 14.h, left: 14.w),
            prefixIcon: const Icon(Icons.search_sharp, color: blackTextColor),
          ),
          style: const TextStyle(
            color: secondaryDarkTextColor,
            fontWeight: FontWeight.w500,
            height: 1,
          ),
        ),
      ),
    ),
  );
}
