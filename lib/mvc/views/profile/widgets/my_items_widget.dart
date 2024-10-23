import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scansavy/mvc/controllers/profile_controller.dart';
import 'package:scansavy/mvc/views/home/widgets/dialogBoxWidget.dart';
import 'package:scansavy/utils/utils.dart';

import '../../../../constants/colors.dart';

Widget myItemWidget(ProfileController controller) {
  return GetBuilder<ProfileController>(
      id: 'updatePostItem',
      builder: (context) {
        return controller.itemList.isEmpty
            ? const Center(child: CircularProgressIndicator(color: black))
            : GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.itemList.length,
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
                          image: DecorationImage(
                              image: NetworkImage(
                                  controller.itemList[index].imageUrl),
                              fit: BoxFit.cover)),
                    ),
                  );
                },
              );
      });
}
