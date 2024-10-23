import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scansavy/mvc/models/post_item_model.dart';
import 'package:scansavy/utils/utils.dart';

class PostItemController extends GetxController {
  User? user = FirebaseAuth.instance.currentUser;

  TextEditingController itemNameCntr = TextEditingController();
  TextEditingController categoryCntr = TextEditingController();
  TextEditingController itemLinkCntr = TextEditingController();
  TextEditingController itemTagCntr = TextEditingController();

  ///image picker code for picture ...........
  var imagePath = '';
  final ImagePicker picker = ImagePicker();

  void pickedImage(ImageSource imgCam) async {
    final XFile? image = await picker.pickImage(source: imgCam);
    imagePath = image!.path;
    update(['imgPathUpdate']);
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;

  Future<void> uploadItem() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        Utils.showSnackBar('Please sign in to upload items.');
        return;
      }

      Utils.showLoading();

      File imageFile = File(imagePath);
      String fileName = imagePath.split('/').last;

      // Reference to Firebase Storage
      Reference firebaseStorageRef =
      FirebaseStorage.instance.ref().child('images/$fileName');

      // Upload task
      UploadTask uploadTask = firebaseStorageRef.putFile(imageFile);

      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      String imageUrl = await taskSnapshot.ref.getDownloadURL();

      PostItemModel item = PostItemModel(
        name: itemNameCntr.text,
        category: categoryCntr.text,
        link: itemLinkCntr.text,
        tag: itemTagCntr.text,
        imageUrl: imageUrl,
      );

      // Storing item to Firestore
      await FirebaseFirestore.instance
          .collection('Posted Items')
          .doc(user.email).collection("datas").doc().set(item.toMap());

      Utils.hidePopup();
      Utils.showSnackBar("Items uploaded successfully!");
      itemNameCntr.clear();
      itemLinkCntr.clear();
      itemTagCntr.clear();
      imageUrl= "";
      imagePath= "";

      print('Item uploaded and stored successfully!');
    } catch (e) {
      Utils.hidePopup();
      Utils.showSnackBar(e.toString());
      print('Failed to upload item: $e');
    }
  }


/*Future<void> uploadItem() async {
    try {
      // Check if user is authenticated
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        Utils.showSnackBar('Please sign in to upload items.');
        return;
      }

      // Step 1: Upload image to Firebase Storage
      Utils.showLoading();
      File imageFile = File(imagePath);
      String fileName = imagePath.split('/').last;
      Reference firebaseStorageRef = FirebaseStorage.instance.ref().child('images/$fileName');
      UploadTask uploadTask = firebaseStorageRef.putFile(imageFile);

      // Wait for the upload to complete and get the download URL
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      String imageUrl = await taskSnapshot.ref.getDownloadURL();

      // Step 2: Create the Item model
      PostItemModel item = PostItemModel(
        name: itemNameCntr.text,
        category: categoryCntr.text,
        link: itemLinkCntr.text,
        tag: itemTagCntr.text,
        imageUrl: imageUrl,
      );

      // Step 3: Store the item model in Firestore
      await FirebaseFirestore.instance.collection('Posted Items').add(item.toMap());

      Utils.hidePopup();
      Utils.showSnackBar("Items uploaded successfully!");

      print('Item uploaded and stored successfully!');
    } catch (FirebaseException e) {
    Utils.hidePopup();
    if (e.code == 'unauthorized') {
    Utils.showSnackBar('You are not authorized to perform this action.');
    } else {
    Utils.showSnackBar('Failed to upload item: ${e.message}');
    }
    print('Failed to upload item: ${e.message}');
    }
  }*/
}
