import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../custom_widgets/custom_texts.dart';

class ViewBatchItemScreen extends StatelessWidget {
  const ViewBatchItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          actions: [const Icon(Icons.more_vert), SizedBox(width: 10.w)],
          automaticallyImplyLeading: false,
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.arrow_back_ios_new, size: 20)),
          backgroundColor: Colors.white,
          title:
              subTitleText('Item Name', fontWeight: FontWeight.w500, size: 20)),
      body: Padding(
          padding: EdgeInsets.all(16.h),
          child: GridView.builder(
            itemCount: 3,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 4,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 217.h,
                width: 163.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/img2.jpg'),
                        fit: BoxFit.cover)),
              );
            },
          )),
    );
  }
}
