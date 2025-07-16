import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../core/locator.dart';
import '../../core/models/app_user.dart';
import '../../core/services/auth_services.dart';

class HomeProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  AuthServices locateUser = locator<AuthServices>();
  AuthServices authServices = AuthServices();
  bool isLoading = true;
  AppUser? appUser;

  HomeProvider() {
    fetchAds();
  }
  final List<String> categories = [
    "Vehicles",
    "Bikes",
    "Mobiles",
    "Fashion",
    "Electronics",
    "Animals",
    "Home Decor",
    "Books",
    "Sports",
    "Kids",
    "Furniture",
    "Hobbies",
    "Industrial and Business",
  ];

  final Map<String, List<Map<String, dynamic>>> _adsByCategory = {};

  Map<String, List<Map<String, dynamic>>> get adsByCategory => _adsByCategory;

  Future<void> fetchAds() async {
    isLoading = true;
    notifyListeners();
    _adsByCategory.clear();
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('PostAds')
          .orderBy('createdAt', descending: true)
          .get();

      for (var doc in snapshot.docs) {
        final data = doc.data();
        final category = data['category'];

        if (category != null && categories.contains(category)) {
          if (!_adsByCategory.containsKey(category)) {
            _adsByCategory[category] = [];
          }
          _adsByCategory[category]!.add(data);
        }
      }
    } catch (e) {
      debugPrint('Error fetching ads: $e');
    }

    isLoading = false;
    notifyListeners();
  }

  List<Map<String, dynamic>> getAdsForCategory(String category) {
    print(category);
    return _adsByCategory[category] ?? [];
  }

  init() async {
    print("INIT Called.......>>>>>>>>>");
    locateUser = locator<AuthServices>();
    await locateUser.init();
    appUser = await locateUser.appUser;
    notifyListeners();
  }

  Future<bool> isAdFavorite(String adId) async {
    try {
      List<String> favList = await getFavAdList();
      return favList.contains(adId);
    } catch (e) {
      print("Error checking favorite status: $e");
      return false;
    }
  }

  Future<List<String>> getFavAdList() async {
    try {
      /// Ensure currentUserId is correctly retrieved
      String? currentUserId = locateUser.appUser.appUserId;
      if (currentUserId == null) {
        print("User not logged in!");
        return [];
      }

      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('AppUser')
          .doc(currentUserId)
          .get();

      if (userDoc.exists) {
        Map<String, dynamic>? userData =
            userDoc.data() as Map<String, dynamic>?;
        if (userData == null || !userData.containsKey('favAdList')) {
          print("No favAdList found in Firestore for user: $currentUserId");
          return [];
        }

        List<String> favAdList = List<String>.from(userData['favAdList']);
        print("Retrieved Favorite Ad List: $favAdList");
        return favAdList;
      } else {
        print("User document does not exist!");
      }
    } catch (e) {
      print("Error fetching favorite ad: $e");
    }
    return [];
  }

  Future<void> toggleFavoriteBook(String adId) async {
    try {
      DocumentReference userDoc =
          _firestore.collection('AppUser').doc(locateUser.appUser.appUserId);

      DocumentSnapshot snapshot = await userDoc.get();
      if (!snapshot.exists) return;

      List<dynamic> favList =
          (snapshot.data() as Map<String, dynamic>)['favAdList'] ?? [];

      List<String> updatedFavList = List<String>.from(favList);

      if (updatedFavList.contains(adId)) {
        updatedFavList.remove(adId);
      } else {
        updatedFavList.add(adId);
      }
      await userDoc.update({'favAdList': updatedFavList});
      notifyListeners();
    } catch (e) {
      print("Error toggling favorite ad: $e");
    }
  }

  Future<List<Map<String, dynamic>>> getFavUsersData(
      List<String> favUserList) async {
    List<Map<String, dynamic>> favAdsData = [];
    try {
      if (favUserList.isEmpty) {
        print("Favorite user list is empty.");
        return [];
      }

      for (String adId in favUserList) {
        print("Fetching ad with Id: $adId");
        DocumentSnapshot bookDoc = await FirebaseFirestore.instance
            .collection('PostAds')
            .doc(adId)
            .get();

        if (bookDoc.exists) {
          Map<String, dynamic> adData =
          bookDoc.data() as Map<String, dynamic>;
          favAdsData.add(adData);
        } else {
          print("No ad found for ID: $adId");
        }
      }

      print("Fetched Favorite ad: $favAdsData");
      return favAdsData;
    } catch (e) {
      print("Error fetching favorite ad data: $e");
      return [];
    }
  }
}
