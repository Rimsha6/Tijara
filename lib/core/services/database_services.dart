import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/app_user.dart';
import '../models/post_ad_model.dart';

class DatabaseServices {
  final firebaseFireStore = FirebaseFirestore.instance;

  /// Register User
  registerUser(AppUser appUser) {
    try {
      firebaseFireStore
          .collection("AppUser")
          .doc(appUser.appUserId)
          .set(appUser.toJson());
    } catch (e) {
      print('Exception $e');
    }
  }

  /// Get User
  Future<AppUser> getUser(String id) async {
    try {
      final snapshot = await firebaseFireStore.collection('AppUser').doc(id).get();
      if (!snapshot.exists || snapshot.data() == null) {
        throw Exception('User data not found in Firestore.');
      }
      return AppUser.fromJson(snapshot.data()!, snapshot.id);
    } catch (e) {
      print('Exception @DatabaseService/getUser: $e');
      rethrow;
    }
  }

  /// Update User Profile
  updateUserProfile(AppUser appUser) async {
    try {
      firebaseFireStore
          .collection('AppUser')
          .doc(appUser.appUserId)
          .update(appUser.toJson());
    } catch (e) {
      print('Exception@UpdateUserProfile=>$e');
    }
  }
  Future<void> createAd(PostAdModel postAdModel) async {
    try {
      final docRef = await firebaseFireStore
          .collection('PostAds')
          .add(postAdModel.toJson());

      await docRef.update({'adId': docRef.id});
    } catch (e) {
      print('Exception@DatabaseService/createAd => $e');
      rethrow;
    }
  }

}
