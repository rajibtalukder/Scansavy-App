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
    if (passHide.isTrue) {
      passHide.value = false;
    } else {
      passHide.value = true;
    }
    print(passHide.value);
    update(['passUpdate']);
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;

  Future<bool> signIn() async {
    //isLoading.value = true;
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
      Get.to(CustomNavigationBar());
    }).catchError((e) {
      print(e.code);
      Utils.hidePopup();
      Utils.showSnackBar(e.code);
    });
    //isLoading.value = false;
    return success;
  }

  validateLogIn(String email, String pass) {
    isEmailOrPhoneValid = Utils.isEmailValid(email);
    isPasswordValid = Utils.isPasswordValid(pass);
  }

  Future<bool> isEmailAlreadyUsed(String emailPhnCntlr) async {
    try {
      List<String> signInMethods =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(emailPhnCntlr);
      // If signInMethods is not empty, that means the email is already in use.
      return signInMethods.isNotEmpty;
    } catch (e) {
      print("Error checking email registration: $e");
      return false;
    }
  }

  Future<bool> signUp() async {
    //isLoading.value = true;
    if (await isEmailAlreadyUsed(emailPhnCntlr.text)) {
      print("Email is already registered");
      Utils.showSnackBar('Email is already registered');
      return false;
    } else {
      Utils.showLoading();
      await auth
          .createUserWithEmailAndPassword(
              email: emailPhnCntlr.text, password: passCntlr.text)
          .then((value) async {
        Utils.hidePopup();
        await FirebaseAuth.instance.currentUser!.sendEmailVerification();
        Get.to(LoginScreen());
        //isLoading.value = false;
      }).catchError((e) {
        print(e.code);
        Utils.showSnackBar(e.code);
      });
      Utils.hidePopup();
      return true;
    }
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
