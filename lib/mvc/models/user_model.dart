import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String userName;
  final String emailOrPhone;
  final String password;
  final String confirmPassword;

  UserModel({
    required this.userName,
    required this.emailOrPhone,
    required this.password,
    required this.confirmPassword,
  });

  toJson() {
    return {
      'FirstName': userName,
      'EmailOrPhone': emailOrPhone,
      'Password': password,
      'ConfirmPassword': confirmPassword,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return UserModel(
      userName: data?['FirstName'],
      emailOrPhone: data?['EmailOrPhone'],
      password: data?['Password'],
      confirmPassword: data?['ConfirmPassword'],
    );
  }
}
