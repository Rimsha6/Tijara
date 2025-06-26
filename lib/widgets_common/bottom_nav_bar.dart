import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../consts/colors.dart';
import '../consts/styles.dart';

class BottomNavBar extends StatelessWidget{
  final int currentIndex;
  const BottomNavBar({super.key, required this.currentIndex});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          backgroundColor: white,
          selectedItemColor: green,
          unselectedItemColor: darkFontGrey,
          showUnselectedLabels: true,
          selectedFontSize: 14,
          selectedLabelStyle: TextStyle(fontFamily: bold),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, size: 35, color: grey),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline_sharp, color: grey, size: 35),
              label: "Favourites",
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 35,
                width: 35,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline, color: grey, size: 35),
              label: "Chats",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined, color: grey, size: 35),
              label: "Profile",
            ),
          ],
        ),
        // Positioned sell button
        Positioned(
          top: -35,
          left : screenWidth/ 2 - 30,
          child: GestureDetector(
            onTap: () {
            },
            child: Column(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: green,
                  child: Icon(Icons.add, color: grey, size: 35),
                ),
                10.heightBox,
                "Sell".text.fontFamily(medium).size(14).color(grey).make(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}