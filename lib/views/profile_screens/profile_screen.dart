import 'package:flutter/material.dart';
import 'package:tijara/widgets_common/bottom_nav_bar.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../consts/colors.dart';
import '../../consts/styles.dart';
import '../../widgets_common/profile_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        backgroundColor: green,
        title: const Text("Profile", style: TextStyle(fontFamily: medium, color: white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.09),
        child: Column(
          children: [
            SizedBox(height: 12),
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade200, blurRadius: 6, spreadRadius: 2)
                    ],
                  ),
                    height: screenHeight/3.5,
                    width: screenWidth,
                    child: Image.asset("Assets/images/profile_bg.png", fit: BoxFit.fill,)),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 90,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 14),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage("Assets/images/profile_img.jpeg"),
                          ),
                          Positioned(
                            bottom: -4, // slight offset to appear nicely
                            right: -4,  // align it slightly outside or flush to the border
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: lightGrey, // background circle for visibility
                                shape: BoxShape.circle,
                              ),
                              child: GestureDetector(
                                child: IconButton(
                                  icon: Icon(Icons.camera_alt_outlined, size: 20),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      "Muhammad".text.fontFamily(bold).size(22).make(),
                      "muhammad@example.com".text.fontFamily(medium).color(fontGrey).make(),
                    ],
                  ),
                )
              ]
            ),
            SizedBox(height: 30),
            // Profile options
            ProfileTile(
              icon: Icons.person,
              title: "Personal Details",
              onTap: () {
              },
              iconColor: black,
              textColor: darkFontGrey,
            ),
            ProfileTile(
              icon: Icons.edit,
              title: "Change Username",
              onTap: () {
              },
              iconColor: black,
              textColor: darkFontGrey,
            ),
            ProfileTile(
              icon: Icons.lock,
              title: "Change Password",
              onTap: () {
              },
              iconColor: black,
              textColor: darkFontGrey,
            ),
            ProfileTile(
              icon: Icons.location_on,
              title: "Change Address",
              onTap: () {
              },
              iconColor: black,
              textColor: darkFontGrey,
            ),
            ProfileTile(
              icon: Icons.phone_android,
              title: "Change Phone Number",
              onTap: () {
              },
              iconColor: black,
              textColor: darkFontGrey,
            ),
            ProfileTile(
              icon: Icons.logout,
              title: "Logout",
              onTap: () {
              },
              iconColor: Colors.red,
              textColor: Colors.red,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 4),
    );
  }
}
