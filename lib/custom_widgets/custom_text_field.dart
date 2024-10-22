
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';

Widget customTextField(TextEditingController controller,
    {
      bool obscureText = false,
      bool? isValid,
      Function()? onSufIconPress,
      bool isKeyboardPhone= false,
      IconData? icon,
      IconData? preficon,
      Color? iconColor,
      double? height,
      String? hintText,
      String? errorText,
      bool? isActive,
    }) {
  return Column(
    children: [
      Container(
        height: height?.h??46.h,
        width: double.infinity,
        decoration: BoxDecoration(

          //border: Border.all(color: borderColor,width: 1),
            borderRadius: BorderRadius.all(Radius.circular(8.r))
        ),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
            child: TextField(
              controller: controller,
              enabled: isActive??true,
              keyboardType:isKeyboardPhone?TextInputType.number: TextInputType.text,
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                hintText: hintText,
                hintStyle: TextStyle(color: secondaryTextColor,fontSize: 14.sp),
                fillColor: grey,
                contentPadding: EdgeInsets.only(top: 14.h, left: 14.w),

                suffixIcon:icon!=null? GestureDetector(
                    onTap: onSufIconPress,
                    child: Icon(icon,color: iconColor??blackTextColor)): const SizedBox(),
                prefixIcon:preficon!=null? Icon(preficon,color: iconColor??blackTextColor):null,
              ),
              obscureText: obscureText,
              style: const TextStyle(
                color: secondaryDarkTextColor,
                fontWeight: FontWeight.w500,
                height: 1,
              ),
            ),
          ),
        ),
      ),
      if (isValid != null && !isValid)
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 25.w),
            child: Text(
              errorText ?? "",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: red,
              ),
            ),
          ),
        ),
    ],
  );
}