import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scansavy/custom_widgets/custom_texts.dart';
import 'package:scansavy/mvc/views/home/widgets/item_for_you_widget.dart';
import 'package:scansavy/mvc/views/home/widgets/search_widget.dart';
import 'package:scansavy/mvc/views/home/widgets/trending_items.dart';

import '../../../constants/colors.dart';

class HomeScreen extends StatelessWidget {

  List<String> dropItems = [
    'Fashion',
    'Home & Kitchen',
    'Electronics',
    'Sports & Adventure',
    'Games & Toys',
    'Books & Media',
    'Automotive',
    'Arts & Crafts'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              searchBox(),
              SizedBox(height: 10.h),
              subTitleText('Trending Items',
                  size: 20, fontWeight: FontWeight.w500),
              SizedBox(height: 10.h),
              trendingItems(),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  subTitleText('Items For You',
                      size: 20, fontWeight: FontWeight.w500),
                  Container(
                    height: 36.h,
                    width: 106.w,
                    decoration: BoxDecoration(
                      border: Border.all(color: black, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    ),
                    // child: Center(
                    //   child: subTitleText('Categories',
                    //       size: 14, fontWeight: FontWeight.w500),
                    // ),
                    child: DropdownButton<String>(
                      items: dropItems.map((String value) {
                        return DropdownMenuItem<String>(
                          value: 'value',
                          child: subTitleText(value,
                              size: 14, fontWeight: FontWeight.w500),
                        );
                      }).toList(),
                      iconSize: 0.0,
                      onChanged: (_) {},
                      menuMaxHeight: 400.h,
                      underline: const SizedBox(),
                      isExpanded: true,
                      hint: Center(
                        child: subTitleText('Categories',
                            size: 14, fontWeight: FontWeight.w500),
                      ),

                    ),
                  )
                ],
              ),
              itemForYouWidget()
            ],
          ),
        ),
      ),
    );
  }
}
