import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tijara/core/consts/colors.dart';
import 'package:tijara/core/consts/styles.dart';
import 'package:tijara/views/home_screen/home_screen.dart';
import '../../core/consts/strings.dart';
import '../../core/locator.dart';
import '../../core/services/auth_services.dart';
import '../auth_screens/signin_screen/signin_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _authService = locator<AuthServices>();
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    splashScreenDelay();
  }

  Future<void> splashScreenDelay() async {
    await Future.delayed(const Duration(seconds: 2));
    await checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      final hasInternet = connectivityResult != ConnectivityResult.none;

      if (!hasInternet) {
        setState(() {
          _loading = false;
          _error = 'No internet connection. Please check your network and pull to refresh.';
        });
        showSnackBar('No internet connection');
        return;
      }

      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        try {
          await _authService.init();
          Get.offAll(() => const HomeScreen());
        } catch (e) {
          setState(() {
            _loading = false;
            _error = 'Could not fetch user profile data. Please pull to refresh.';
          });
          showSnackBar('Failed to load user data.');
        }
      } else {
        Get.offAll(() => const SigninScreen());
      }
    } catch (e) {
      setState(() {
        _loading = false;
        _error = 'Unexpected error occurred. Please pull to refresh.';
      });
      showSnackBar('Something went wrong.');
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green,
      body: _loading
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              appname1,
              style: TextStyle(
                fontFamily: bold,
                fontSize: 62,
                color: white,
              ),
            ),
          ],
        ),
      )
          : _error != null
          ? RefreshIndicator(
        onRefresh: checkLoginStatus,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      _error!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: checkLoginStatus,
                    icon: const Icon(Icons.refresh),
                    label: const Text("Retry"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: green,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
          : const SizedBox(),
    );
  }

}
