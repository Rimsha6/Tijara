import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tijara/views/profile_screens/profile_screen.dart';
import 'package:tijara/widgets_common/customt_textfield.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/consts/colors.dart';
import '../../core/consts/styles.dart';
import '../../widgets_common/custom_button.dart' show customButton;

class ResetPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: white,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                child: Image.asset(
                  "Assets/images/bg_image.png",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 40, // adjust for safe area
                left: 16,
                child: BackButton(
                  color: white,
                  onPressed: (){
                    Get.back();
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                screenHeight * 0.03, screenHeight * 0.05, screenHeight * 0.03,
                screenHeight * 0.01),
            child: Text("Reset your Password!", style: TextStyle(
              color: black,
                fontSize: screenHeight * 0.018,
                fontFamily: bold,
                fontWeight: FontWeight.w600
                ),
                ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                screenHeight * 0.03, screenHeight * 0.03, screenHeight * 0.03,
                screenHeight * 0.01),
            child: Text("Please enter your Password.", style: TextStyle(
                fontSize: screenHeight * 0.016,
                fontFamily: medium,
                fontWeight: FontWeight.w500),),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                screenWidth * 0.06, screenHeight * 0.045, screenWidth * 0.06, 0),
            child: customTextField(title: "Password", hint: "*******",icon: Icons.remove_red_eye_sharp,iconOnRight: true,color: lightGrey),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                screenWidth * 0.06, screenHeight * 0.01, screenWidth * 0.06, 0),
            child: customTextField(title: "New Password", hint: "*******",color: lightGrey),
          ),
          (screenHeight * 0.030).heightBox,
          customButton(
            title: "Save",
            color: green,
            textColor: white,
            width: screenWidth * 0.86,
            height: screenHeight * 0.049,
            onPressed: () {
              Get.to(ProfileScreen());
            },),

        ],
      ),
    );
  }
}