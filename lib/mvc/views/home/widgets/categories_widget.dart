import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/colors.dart';
import '../../../../custom_widgets/custom_texts.dart';

class CategoriesWidget extends StatefulWidget {
  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  List<String> dropdownItems = ['CEO', 'COO', 'CFO', 'CTO'];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return  Container(
        height: 36.h,
        width: 106.w,
        decoration: BoxDecoration(
          border: Border.all(color: black, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
        ),
      child:
        Center(
          child: subTitleText('Categories',
              size: 14, fontWeight: FontWeight.w500),
        ),
      );
    }

}
