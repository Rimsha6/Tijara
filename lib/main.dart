import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tijara/core/data/sample_of_search_result_ads.dart';
import 'package:tijara/views/profile_screens/edit%20profile%20screens/change_address_screen.dart';
import 'package:tijara/views/profile_screens/edit%20profile%20screens/change_phone_number_screen.dart';
import 'package:tijara/views/profile_screens/edit%20profile%20screens/change_username_screen.dart';
import 'package:tijara/views/auth%20screen/forgot_password_screen.dart';
import 'package:tijara/views/auth%20screen/login_screen.dart';
import 'package:tijara/views/profile_screens/personal_details_screen.dart';
import 'package:tijara/views/profile_screens/profile_screen.dart';
import 'package:tijara/views/auth%20screen/reset_password_screen.dart';
import 'package:tijara/views/search%20result%20screen/search_result_screen.dart';
import 'package:tijara/views/auth%20screen/sign_up_screen.dart';
import 'package:tijara/views/splash%20screen/splash_screen.dart';

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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
        home: SplashScreen(),
    );
  }
}

