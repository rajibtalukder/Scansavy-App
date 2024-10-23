import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scansavy/mvc/models/post_item_model.dart';
import 'package:scansavy/mvc/views/welcome_screen.dart';
import '../../utils/utils.dart';
import '../models/user_model.dart';


class ProfileController extends GetxController{

  var itemCount = 0.obs;
  RxBool isExpanded = false.obs;
  void expandedFun(){
    isExpanded.value =! isExpanded.value;
    update(['expandUpdate']);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchPostedItem();
    getUserDetails();
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

  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> signOut() async {
    await auth.signOut().then((value) {
      Get.offAll( const WelcomeScreen());
    });
  }

  List<PostItemModel> itemList = [];


  Future<List<PostItemModel>> fetchPostedItem() async {
    try {
      CollectionReference collectionReference = FirebaseFirestore.instance
          .collection('Posted Items')
          .doc(auth.currentUser?.email)
          .collection('datas');

      QuerySnapshot querySnapshot = await collectionReference.get();
      itemList = [];

      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        PostItemModel postItemModel = PostItemModel(
          name: data['name'],
          category: data['category'],
          link: data['link'],
          tag: data['tag'],
          imageUrl: data['imageUrl']
        );
        itemList.add(postItemModel);
      }
      update(['updatePostItem']);
      return itemList;
    } catch (e) {
      Utils.showSnackBar(e.toString());
      return [];
    }
  }

  final _db = FirebaseFirestore.instance;
  UserModel? userData;

  Future<UserModel?> getUserDetails() async {
    try {
      final snapshot = await _db
          .collection('User')
          .where('EmailOrPhone', isEqualTo: auth.currentUser?.email)
          .get();

      if (snapshot.docs.isNotEmpty) {
        userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
        update(['profileUpdate']);
        return userData;
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching user details: $e');
      Utils.showSnackBar(e.toString());
      return null;
    }
  }


}