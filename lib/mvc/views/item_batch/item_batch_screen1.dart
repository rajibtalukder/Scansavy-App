import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scansavy/constants/colors.dart';
import 'package:scansavy/mvc/controllers/item_batch_controller.dart';
import 'package:scansavy/mvc/views/item_batch/widgets/batch_list.dart';
import 'package:scansavy/mvc/views/item_batch/widgets/empty_batch.dart';
import '../../../custom_widgets/custom_texts.dart';

class ItemBatchScreen1 extends StatelessWidget {
  ItemBatchScreen1({super.key});

  ItemBatchController itemBatchController = Get.put(ItemBatchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          actions: [
            PopupMenuButton<String>(
              color: white,
              onSelected: (value) {
                switch (value) {
                  case 'Rename Batch':
                    break;
                  case 'Delete Item':
                    break;
                }
              },
              itemBuilder: (BuildContext context) {
                return {'Rename Batch', 'Delete Item'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: subTitleText(choice,
                        size: 14, fontWeight: FontWeight.w500),
                  );
                }).toList();
              },
            )
          ],

          // actions: [const Icon(Icons.more_vert), SizedBox(width: 10.w)],
          automaticallyImplyLeading: false,
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.arrow_back_ios_new, size: 20)),
          backgroundColor: Colors.white,
          title: subTitleText('Item Batches',
              fontWeight: FontWeight.w500, size: 20)),
      body: Obx(
        () => itemBatchController.batchCount.value == 0
            ? emptyBatch()
            : batchList(itemBatchController),
      ),
    );
  }
}
