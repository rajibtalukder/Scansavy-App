import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController{

  var itemCount = 0.obs;

  RxBool isExpanded = false.obs;

  void expandedFun(){
    isExpanded.value =! isExpanded.value;
    update(['expandUpdate']);
  }


  // Drawer Start---------------------------
  var scaffoldKey = GlobalKey<ScaffoldState>();
  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }
  void closeDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }
// Drawer End---------------------------


}