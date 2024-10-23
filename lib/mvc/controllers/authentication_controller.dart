import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';
import '../models/user_model.dart';
import '../views/auth/login_screen.dart';
import '../views/custom_navigation_bar.dart';

class AuthenticationController extends GetxController {
  TextEditingController signinEmail = TextEditingController();
  TextEditingController signinPass = TextEditingController();

  TextEditingController userNameCntlr = TextEditingController();
  TextEditingController emailPhnCntlr = TextEditingController();
  TextEditingController passCntlr = TextEditingController();
  TextEditingController conPassCntlr = TextEditingController();

  RxBool passHide = true.obs;
  bool isEmailOrPhoneValid = true;
  bool isPasswordValid = true;

  void passValueChange() {
    passHide.value = !passHide.value;
    print(passHide.value);
    update(['passUpdate']);
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;

  Future<bool> signIn() async {
    Utils.showLoading();
    validateLogIn(signinEmail.text, signinPass.text);
    if (!isPasswordValid) {
      Utils.hidePopup();
      Utils.showSnackBar('Password length is too short');
      return false;
    }
    bool success = false;
    await auth
        .signInWithEmailAndPassword(
        email: signinEmail.text, password: signinPass.text)
        .then((value) {
      Utils.showSnackBar('You\'re logged in successfully');
      Utils.hidePopup();
      success = true;
      Get.offAll(CustomNavigationBar());
    }).catchError((e) {
      print(e.code);
      Utils.hidePopup();
      Utils.showSnackBar(e.code);
    });
    return success;
  }

  validateLogIn(String email, String pass) {
    isEmailOrPhoneValid = Utils.isEmailValid(email);
    isPasswordValid = Utils.isPasswordValid(pass);
  }


  Future<bool> signUp() async {
      Utils.showLoading();
      await auth
          .createUserWithEmailAndPassword(
          email: emailPhnCntlr.text, password: passCntlr.text)
          .then((value) async {
        Utils.hidePopup();
        await FirebaseAuth.instance.currentUser!.sendEmailVerification();
        createUser(UserModel(userName: userNameCntlr.text,
            emailOrPhone: emailPhnCntlr.text,
            password: passCntlr.text,
            confirmPassword: conPassCntlr.text));
        Get.to(()=>LoginScreen());
      }).catchError((e) {
        Utils.hidePopup();
        Utils.showSnackBar(e.code);
      });
      return true;

  }

  Future<void> createUser(UserModel userModel) async {
    await _db
        .collection('User')
        .doc(auth.currentUser?.email)
        .set(userModel.toJson())
        .catchError((e) {
      print(e);
      Utils.showSnackBar(e.code);
    });
  }





}
