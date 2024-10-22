import 'package:get/get.dart';

class CustomNavigationController extends GetxController{
  final selectedIndex = 0.obs;

  void changeIndex(int index){
    selectedIndex.value = index;
  }
}