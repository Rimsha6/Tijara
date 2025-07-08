import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tijara/views/profile_screens/edit%20profile%20screens/change_address_screen.dart';
import 'package:tijara/views/profile_screens/edit%20profile%20screens/change_phone_number_screen.dart';
import 'package:tijara/views/profile_screens/edit%20profile%20screens/change_username_screen.dart';
import 'package:tijara/views/profile_screens/personal_details_screen.dart';
import 'package:tijara/widgets/bottom_nav_bar.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../core/consts/colors.dart';
import '../../core/consts/styles.dart';
import '../../core/locator.dart';
import '../../core/services/auth_services.dart';
import '../../widgets/profile_tile.dart';
import '../auth_screens/reset_password_screen.dart';
import '../splash_screen/splash_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locateUser = locator<AuthServices>();
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        backgroundColor: green,
        title: const Text("Profile",
            style: TextStyle(fontFamily: medium, color: white, fontSize: 18)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.09),
        child: Column(
          children: [
            SizedBox(height: 12),
            Stack(children: [
              Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 6,
                          spreadRadius: 2)
                    ],
                  ),
                  height: screenHeight / 3.5,
                  width: screenWidth,
                  child: Image.asset(
                    "Assets/images/profile_bg.png",
                    fit: BoxFit.fill,
                  )),
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
                          backgroundImage:
                              AssetImage("Assets/images/profile_img.jpeg"),
                        ),
                        Positioned(
                          bottom: -4, // slight offset to appear nicely
                          right:
                              -4, // align it slightly outside or flush to the border
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color:
                                  lightGrey, // background circle for visibility
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
                    "${locateUser.appUser.userName}"
                        .text
                        .fontFamily(bold)
                        .size(17)
                        .make(),
                    "${locateUser.appUser.userEmail}"
                        .text
                        .fontFamily(medium)
                        .color(fontGrey)
                        .make(),
                  ],
                ),
              )
            ]),
            SizedBox(height: 30),
            // Profile options
            ProfileTile(
              icon: Icons.person,
              title: "Personal Details",
              onTap: () {
                Get.to(PersonalDetailsScreen());
              },
              iconColor: black,
              textColor: darkFontGrey,
            ),
            ProfileTile(
              icon: Icons.edit,
              title: "Change Username",
              onTap: () {
                Get.to(ChangeUsernameScreen());
              },
              iconColor: black,
              textColor: darkFontGrey,
            ),
            ProfileTile(
              icon: Icons.lock,
              title: "Change Password",
              onTap: () {
                Get.to(ResetPasswordScreen());
              },
              iconColor: black,
              textColor: darkFontGrey,
            ),
            ProfileTile(
              icon: Icons.location_on,
              title: "Change Address",
              onTap: () {
                Get.to(ChangeAddressScreen());
              },
              iconColor: black,
              textColor: darkFontGrey,
            ),
            ProfileTile(
              icon: Icons.phone_android,
              title: "Change Phone Number",
              onTap: () {
                Get.to(ChangePhoneNoScreen());
              },
              iconColor: black,
              textColor: darkFontGrey,
            ),
            ProfileTile(
              icon: Icons.logout,
              title: "Logout",
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Logout",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.cancel_outlined),
                            ),
                          ),
                        ],
                      ),
                      content: const Padding(
                        padding: EdgeInsets.only(top: 14.0, left: 8, right: 8),
                        child: Text(
                          'Are you sure you want to logout of your account and close the app?',
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 14, color: Color(0xff7D7A7A)),
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "No",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            await locateUser.logoutUser();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SplashScreen()));
                          },
                          child: Text(
                            "Yes",
                            style: TextStyle(color: Colors.red),
                          ),
                        )
                      ],
                    );
                  },
                );
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
