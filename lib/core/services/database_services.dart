import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/app_user.dart';
import '../models/chat_model.dart';
import '../models/post_ad_model.dart';

class DatabaseServices {
  final firebaseFireStore = FirebaseFirestore.instance;
  // final String currentUserId = FirebaseAuth.instance.currentUser!.uid;

  /// Register User  >>>>
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

  /// Get User  >>>>>>>>>>>
  Future<AppUser> getUser(String id) async {
    try {
      final snapshot =
          await firebaseFireStore.collection('AppUser').doc(id).get();
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

  /// Update User Name >>
  updateUserName(userId, userName) async {
    try {
      firebaseFireStore.collection('AppUser').doc(userId).update({
        'userName': userName,
      });
    } catch (e) {
      print('Exception@UpdateUserName=>$e');
    }
  }

  /// Update Phone Number >>
  updatePhoneNo(userId, phoneNo) async {
    try {
      firebaseFireStore.collection('AppUser').doc(userId).update({
        'phoneNo': phoneNo,
      });
    } catch (e) {
      print('Exception@UpdatePhoneNumber=>$e');
    }
  }

  /// Update User Address  >>
  updateAddress(userId, address) async {
    try {
      firebaseFireStore.collection('AppUser').doc(userId).update({
        'address': address,
      });
    } catch (e) {
      print('Exception@UpdateAddress=>$e');
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

  /// Get User Data at Chat/Inbox Screen >>>>>>
  Future<Map<String, dynamic>?> getUserData(String userId) async {
    final doc = await firebaseFireStore.collection('AppUser').doc(userId).get();
    return doc.data();
  }

  /// Get Messages Function >>>>>>>>>>>>>
  Stream<List<ChatMessage>> getMessages(String userId, currentUserId) {
    return firebaseFireStore
        .collection('chats')
        .orderBy('timestamp')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) =>
                ChatMessage.fromJson(doc.data() as Map<String, dynamic>))
            .where((m) =>
                (m.senderId == currentUserId && m.receiverId == userId) ||
                (m.senderId == userId && m.receiverId == currentUserId))
            .toList());
  }

  /// Send Messages Function >>>>>>>>>>>>>
  Future<void> sendMessage(ChatMessage message) async {
    await firebaseFireStore.collection('chats').add(message.toJson());
  }

  /// Get Inbox User Data Function >>>>>>
  Stream<List<String>> getInboxUserIds(currentUserId) {
    return firebaseFireStore.collection('chats').snapshots().map((snapshot) {
      final sent =
          snapshot.docs.where((doc) => doc['senderId'] == currentUserId);
      final received =
          snapshot.docs.where((doc) => doc['receiverId'] == currentUserId);
      final ids = <String>{}
        ..addAll(sent.map((d) => d['receiverId'] as String))
        ..addAll(received.map((d) => d['senderId'] as String));
      return ids.toList();
    });
  }
}
