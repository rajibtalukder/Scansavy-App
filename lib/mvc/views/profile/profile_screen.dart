import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scansavy/mvc/views/profile/widgets/drawer_widget.dart';
import 'package:scansavy/mvc/views/profile/widgets/my_items_widget.dart';
import 'package:scansavy/mvc/views/profile/widgets/personal_info_widget.dart';

import '../../../custom_widgets/custom_texts.dart';
import '../../controllers/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: profileController.scaffoldKey,
      drawer: drawerWidget(),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: profileController.openDrawer,
            child: const Icon(Icons.menu, size: 30)),
        backgroundColor: Colors.white,
        title:
            subTitleText('My Profile', fontWeight: FontWeight.w500, size: 20),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PersonalInfoWidget(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    subTitleText('My Items',
                        size: 20, fontWeight: FontWeight.w500),
                    SizedBox(height: 16.h),
                    myItemWidget(profileController)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



}
