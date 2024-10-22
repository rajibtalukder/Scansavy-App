import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scansavy/custom_widgets/custom_button.dart';
import 'package:scansavy/custom_widgets/custom_text_field.dart';
import 'package:scansavy/mvc/views/item_batch/create_batch_screen.dart';
import '../../../constants/colors.dart';
import '../../../custom_widgets/custom_texts.dart';
import '../../controllers/item_batch_controller.dart';

class ItemBatchScreen2 extends StatelessWidget {
   ItemBatchScreen2({super.key});
   ItemBatchController itemBatchController = Get.find();

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
          title: subTitleText('Item Batches',
              fontWeight: FontWeight.w500, size: 20)),
      body: Padding(
        padding: EdgeInsets.all(24.w),
        child: Center(
          child: Container(
            height: 158.h,
            width: 288.w,
            padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 18.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
              color: white,
              boxShadow: const [
                BoxShadow(
                  color: grey,
                  spreadRadius: 3,
                  blurRadius: 12,
                  offset: Offset(0, 0), // Shadow position
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                subTitleText('Batch Name',
                    size: 14, fontWeight: FontWeight.w500),
                customTextField(TextEditingController(),
                    hintText: 'Enter Batch Name'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customButton('Create',
                        color: yellow,
                        width: 112.w,
                        textSize: 14,
                        height: 36.h,
                        onPressed: (){
                          Get.to(const CreateBatchScreen());
                          itemBatchController.batchCount.value++;
                          itemBatchController.update();
                        }
                    ),
                    customButton('Cancel',
                        color: white,
                        brdr: true,
                        textColor: black,
                        width: 112.w,
                        textSize: 14,
                        height: 36.h,
                        onPressed: (){
                          Get.back();
                        }
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
