import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppUser extends ChangeNotifier {
  String? appUserId;
  String? userName;
  String? userEmail;
  bool? isFirstLogin;
  String? createdAt;
  String? password;

  AppUser({
    this.appUserId,
    this.userEmail,
    this.userName,
    this.isFirstLogin,
    this.createdAt,
    this.password,
  });

  AppUser.fromJson(json, id) {
    appUserId = id;
    userName = json['userName'] ?? '';
    userEmail = json['userEmail'];
    isFirstLogin = json['isFirstLogin'];
    createdAt = json['createdAt'];
  }

  toJson() {
    return {
      'appUserId': appUserId,
      'userName': userName,
      'userEmail': userEmail,
      'isFirstLogin': isFirstLogin,
      'createdAt': createdAt,
    };
  }
}
