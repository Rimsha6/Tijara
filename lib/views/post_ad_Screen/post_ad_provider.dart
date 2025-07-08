import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../core/locator.dart';
import '../../core/models/post_ad_model.dart';
import '../../core/services/auth_services.dart';
import '../../core/services/database_services.dart';

class PostAdProvider extends ChangeNotifier {
  final locateUser = locator<AuthServices>();
  final PostAdModel _postAdModel = PostAdModel();
  final DatabaseServices _databaseServices = DatabaseServices();
  bool isLoading = false;
  bool isTermsAccepted = false;
  File? selectedImage;

  PostAdModel get postAdModel => _postAdModel;

  void setFullLocation(String address, double lat, double lng) {
    _postAdModel.location = address;
    _postAdModel.latitude = lat;
    _postAdModel.longitude = lng;
    notifyListeners();
  }


  void toggleTerms(bool value) {
    isTermsAccepted = value;
    notifyListeners();
  }

  /// Pick Image Method  >>>>>>
  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      selectedImage = File(picked.path);
      notifyListeners();
    }
  }

  Future<String?> uploadImageToStorage() async {
    if (selectedImage == null) return null;
    final ref = FirebaseStorage.instance
        .ref()
        .child('ads/${DateTime.now().millisecondsSinceEpoch}');
    await ref.putFile(selectedImage!);
    return await ref.getDownloadURL();
  }

  /// Submit Add Method >>>>>>
  Future<void> submitAd() async {
    if (!isTermsAccepted || isLoading) return;

    isLoading = true;
    notifyListeners();

    try {
      _postAdModel.userId = locateUser.appUser.appUserId;
      _postAdModel.userName = locateUser.appUser.userName;
      _postAdModel.userEmail = locateUser.appUser.userEmail;
      // _postAdModel.imageUrl = await uploadImageToStorage();

      await _databaseServices.createAd(_postAdModel);
    } catch (e) {
      debugPrint('Failed to submit ad: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
