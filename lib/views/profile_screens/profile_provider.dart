import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:tijara/core/services/database_services.dart';

import '../../core/locator.dart';
import '../../core/services/auth_services.dart';

class ProfileProvider with ChangeNotifier {
  final locateUser = locator<AuthServices>();
  final DatabaseServices _databaseServices = DatabaseServices();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  /// UPDATE USERNAME FUNCTION >>>>>>>>>>>>
  Future<void> updateUsername(BuildContext context) async {
    final userId = locateUser.appUser.appUserId;
    final userName = usernameController.text.trim();
    if (userId == null || userName.isEmpty) {
      Get.snackbar(
        'Validation Error',
        'Username cannot be empty',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );

      return;
    }
    try {
      await _databaseServices.updateUserName(userId, userName);
      Get.snackbar(
        'Success',
        'Username updated successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      Navigator.pop(context);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to update username: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  /// UPDATE PHONE NUMBER FUNCTION >>>>>>>>>>>>
  Future<void> updatePhoneNumber(BuildContext context) async {
    final userId = locateUser.appUser.appUserId;
    final phoneNumber = phoneNumberController.text.trim();
    if (userId == null || phoneNumber.isEmpty) {
      Get.snackbar(
        'Validation Error',
        'phoneNumber cannot be empty',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );

      return;
    }
    try {
      await _databaseServices.updatePhoneNo(userId, phoneNumber);
      Get.snackbar(
        'Success',
        'phoneNumber updated successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      Navigator.pop(context);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to update phonenumber: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  /// UPDATE USER ADDRESS FUNCTION >>>>>>>>>>>>
  Future<void> updateAddress(BuildContext context) async {
    final userId = locateUser.appUser.appUserId;
    final userAddress = addressController.text.trim();
    if (userId == null || userAddress.isEmpty) {
      Get.snackbar(
        'Validation Error',
        'address cannot be empty',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );

      return;
    }
    try {
      await _databaseServices.updateAddress(userId, userAddress);
      Get.snackbar(
        'Success',
        'address updated successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      Navigator.pop(context);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to update address: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }
}
