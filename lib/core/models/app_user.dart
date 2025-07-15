import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppUser extends ChangeNotifier {
  String? appUserId;
  String? userName;
  String? userEmail;
  String? phoneNo;
  String? address;
  bool? isFirstLogin;
  String? createdAt;
  String? password;

  AppUser({
    this.appUserId,
    this.userEmail,
    this.userName,
    this.phoneNo,
    this.address,
    this.isFirstLogin,
    this.createdAt,
    this.password,
  });

  AppUser.fromJson(json, id) {
    appUserId = id;
    userName = json['userName'] ?? '';
    userEmail = json['userEmail'];
    phoneNo = json['phoneNo'] ?? 'N/A';
    address = json['address'] ?? 'N/A';
    isFirstLogin = json['isFirstLogin'];
    createdAt = json['createdAt'];
  }

  toJson() {
    return {
      'appUserId': appUserId,
      'userName': userName,
      'userEmail': userEmail,
      'phoneNo': phoneNo,
      'address': address,
      'isFirstLogin': isFirstLogin,
      'createdAt': createdAt,
    };
  }
}
