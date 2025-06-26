import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tijara/data/sample_of_search_result_ads.dart';
import 'package:tijara/views/drawer%20screens/detail.dart';
import 'package:tijara/views/drawer%20screens/my_ad_detail_screen.dart';
import 'package:tijara/views/drawer%20screens/about_us_screen.dart';
import 'package:tijara/views/home%20screens/ad_detail_screen.dart';
import 'package:tijara/views/profile_screens/change_address_screen.dart';
import 'package:tijara/views/profile_screens/change_phone_number_screen.dart';
import 'package:tijara/views/profile_screens/change_username_screen.dart';
import 'package:tijara/views/chat%20screens/chat_detail_screen.dart';
import 'package:tijara/views/chat%20screens/chat_screen.dart';
import 'package:tijara/views/home%20screens/favourite_screen.dart';
import 'package:tijara/views/forgot_password_screen.dart';
import 'package:tijara/views/login_screen.dart';
import 'package:tijara/views/drawer%20screens/my_ads_screen.dart';
import 'package:tijara/views/home%20screens/notification_screen.dart';
import 'package:tijara/views/profile_screens/personal_details_screen.dart';
import 'package:tijara/views/home%20screens/post_ad_screen.dart';
import 'package:tijara/views/profile_screens/profile_screen.dart';
import 'package:tijara/views/reset_password_screen.dart';
import 'package:tijara/views/drawer%20screens/setting_screen.dart';
import 'package:tijara/views/search_result_screen.dart';
import 'package:tijara/views/sign_up_screen.dart';
import 'package:tijara/views/splash_screen.dart';

import 'models/ad.dart';

void main () async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final AdModel ad = AdModel(
        image: [
          "Assets/images/toyota_camry.jpeg",
        ],
        title: "Toyota Camry",
        price: "25,000 SAR",
        description: "2018 model, well-maintained, low mileage. New tyres Installed, geunine paint, no touching.\nDriven around 50000 km ",
        location: "Riyadh",
        category: "Vehicles",
        views: 210,
        isFavorite: true,
        contact: "03215034567");

    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: AdDetailScreen(ad: ad),
    );
  }
}

