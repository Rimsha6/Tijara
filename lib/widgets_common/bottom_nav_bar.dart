import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:tijara/views/chat%20screens/chat_screen.dart';
import 'package:tijara/views/favourite%20screen/favourite_screen.dart';
import 'package:tijara/views/home%20screens/home_screen.dart';
import 'package:tijara/views/Sell%20Screen/post_ad_screen.dart';
import 'package:tijara/views/profile_screens/profile_screen.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/consts/colors.dart';
import '../core/consts/styles.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  const BottomNavBar({super.key, required this.currentIndex});

  void _onTap(int index) {
    if (index == 2) {
      Get.to(() => PostAdScreen());
      return;
    }

    switch (index) {
      case 0:
        Get.offAll(() => HomeScreen());
        break;
      case 1:
        Get.offAll(() => FavouriteScreen());
        break;
      case 3:
        Get.offAll(() => ChatScreen());
        break;
      case 4:
        Get.offAll(() => ProfileScreen());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: _onTap,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          backgroundColor: white,
          selectedItemColor: green,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          selectedFontSize: 14,
          selectedLabelStyle: TextStyle(),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, size: 35),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline_sharp, size: 35),
              label: "Favourites",
            ),
            BottomNavigationBarItem(
              icon: SizedBox(height: 35, width: 35),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline, size: 35),
              label: "Chats",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined, size: 35),
              label: "Profile",
            ),
          ],
        ),
        Positioned(
          top: -35,
          left: screenWidth / 2 - 30,
          child: GestureDetector(
            onTap: () {
              Get.to(() => PostAdScreen());
            },
            child: Column(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: green,
                  child: Icon(Icons.add, color: white, size: 35),
                ),
                const SizedBox(height: 10),
                Text(
                  "Sell",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

