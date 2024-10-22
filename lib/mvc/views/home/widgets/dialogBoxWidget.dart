import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scansavy/mvc/controllers/demo_controller.dart';

import '../../../../constants/colors.dart';
import '../../../../custom_widgets/custom_button.dart';
import '../../../../custom_widgets/custom_texts.dart';

class Dialogboxwidget extends StatelessWidget {
   Dialogboxwidget({super.key});

  DemoController demoController = Get.put(DemoController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 372.h,
                width: 280.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/img2.jpg'),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                  top: 10.h,
                  right: 10.w,
                  child: Container(
                    height: 32.h,
                    width: 32.h,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius:
                            BorderRadius.all(Radius.circular(9999.r))),
                    child: const Icon(
                      Icons.favorite,
                      size: 24,
                      color: black,
                    ),
                  ))
            ],
          ),
          SizedBox(height: 15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              subTitleText('Nike Air Force 1',
                  size: 16, fontWeight: FontWeight.w500),
              SizedBox(width: 40.w),
              SizedBox(
                height: 20.h,
                width: 20.h,
                child:
                    Image.asset('assets/images/books.png', fit: BoxFit.cover),
              ),
              GestureDetector(
                onTap: () {
                  Get.dialog(Dialog(
                    insetPadding: EdgeInsets.only(left: 230.w, top: 300.h),
                    child: Container(
                        height: 80.h,
                        //width: 150.w,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap:(){
                                demoController.numberOfBatch.value++;
                              },
                              child: subTitleText('Add to batch',
                                  color: secondaryDarkTextColor,
                                  size: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            subTitleText('Report Item',
                                color: secondaryDarkTextColor,
                                size: 14,
                                fontWeight: FontWeight.w500),
                          ],
                        )),
                  ));
                },
                child: SizedBox(
                  height: 20.h,
                  width: 20.h,
                  child:
                      Image.asset('assets/images/send.png', fit: BoxFit.cover),
                ),
              )
            ],
          ),
          SizedBox(height: 10.h),
          subTitleText(
              'Lorem ipsum dolor sit amet consectetur. Laoreet purus consectetur lacus ante odio',
              size: 12,
              overfl: true,
              fontWeight: FontWeight.w400,
              color: secondaryDarkTextColor),
          SizedBox(height: 10.h),
          customButton('View Item', color: yellow, height: 36.h, textSize: 14)
        ],
      ),
    );
  }
}
