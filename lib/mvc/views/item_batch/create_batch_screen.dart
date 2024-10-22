import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../custom_widgets/custom_texts.dart';

class CreateBatchScreen extends StatelessWidget {
  const CreateBatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          actions: [const Icon(Icons.more_vert), SizedBox(width: 10.w)],
          automaticallyImplyLeading: false,
          leading: GestureDetector(
              onTap: (){
                Get.back();
              },
              child: const Icon(Icons.arrow_back_ios_new, size: 20)),
          backgroundColor: Colors.white,
          title: subTitleText('Batch Name',
              fontWeight: FontWeight.w500, size: 20)),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 80.h,
              width: 80.h,
              child:
              Image.asset('assets/images/circle_check.png', fit: BoxFit.cover),
            ),
            SizedBox(height: 16.h),
            subTitleText('Batch Created',
                size: 20, fontWeight: FontWeight.w500),
            SizedBox(height: 10.h),
            subTitleText(
                overfl: true,
                textCenter: true,
                'Start adding items from your feed and collection to create batches',
                fontWeight: FontWeight.w400,
                size: 14),
          ],
        ),
      ),
    );
  }
}
