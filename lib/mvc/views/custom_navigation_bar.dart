import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scansavy/constants/colors.dart';
import 'package:scansavy/mvc/controllers/custom_navigation_controller.dart';
import 'package:scansavy/mvc/views/item/post_item_screen.dart';
import 'package:scansavy/mvc/views/profile/profile_screen.dart';
import 'package:scansavy/mvc/views/scan/scan_screen.dart';

import 'home/home_screen.dart';

class CustomNavigationBar extends StatelessWidget {
  final List<Widget> pages = [
    HomeScreen(),
    const ScanScreen(),
    PostItemScreen(),
    ProfileScreen(),
  ];

  final CustomNavigationController customNavigationController =
      Get.put(CustomNavigationController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: pages[customNavigationController.selectedIndex.value],
        bottomNavigationBar: SizedBox(
          height: 80.h,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: black,
            selectedFontSize: 0,
            currentIndex: customNavigationController.selectedIndex.value,
            onTap: (index) {
              customNavigationController.changeIndex(index);
            },
            items: [
              _buildNavigationBarItem(
                'assets/images/home.png',
                'assets/images/home.png',
              ),
              _buildNavigationBarItem(
                'assets/images/scan.png',
                'assets/images/scan.png',
              ),
              _buildNavigationBarItem(
                'assets/images/add.png',
                'assets/images/add.png',
              ),
              _buildNavigationBarItem(
                'assets/images/profile.png',
                'assets/images/profile.png',
              ),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavigationBarItem(
      String iconPath, String activeIconPath) {
    return BottomNavigationBarItem(
      icon: SizedBox(
        height: 24.h,
        width: 24.w,
        child: Image.asset(
          iconPath,
          fit: BoxFit.contain,
          color: white,
        ),
      ),
      activeIcon: SizedBox(
        height: 32.h,
        width: 32.w,
        child: Image.asset(
          activeIconPath,
          fit: BoxFit.contain,
          color: white,
        ),
      ),
      label: '',
    );
  }
}
