import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scansavy/mvc/controllers/profile_controller.dart';
import 'package:scansavy/mvc/views/home/widgets/dialogBoxWidget.dart';

import '../../../../constants/colors.dart';

Widget myItemWidget(ProfileController controller) {
  return Obx(()=> GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.itemCount.value,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 4,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                    backgroundColor: white,
                    child: Container(
                      width: 312.w,
                      height: 546.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.r),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 10.h),
                          Dialogboxwidget(),
                        ],
                      ),
                    ));
              },
            );
          },
          child: Container(
            height: 217.h,
            width: 163.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                image: const DecorationImage(
                    image: AssetImage('assets/images/img2.jpg'),
                    fit: BoxFit.cover)),
          ),
        );
      },
    ),
  );
}

