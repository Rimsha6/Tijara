import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../core/locator.dart';
import '../../core/models/app_user.dart';
import '../../core/services/auth_services.dart';

class HomeProvider extends ChangeNotifier {
  bool isLoading = true;
  AppUser? appUser ;
  AuthServices authServices = AuthServices();
  AuthServices locateUser = locator<AuthServices>();

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

  init()async{
    print("INIT Called.......>>>>>>>>>");
    locateUser = locator<AuthServices>();
    await locateUser.init();
    appUser = await locateUser.appUser;
    notifyListeners();
  }
}
