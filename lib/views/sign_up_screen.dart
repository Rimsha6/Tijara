import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tijara/views/login_screen.dart';
import 'package:velocity_x/velocity_x.dart';

import '../consts/colors.dart';
import '../consts/styles.dart' ;
import '../widgets_common/custom_button.dart';
import '../widgets_common/customt_textfield.dart';

class SignUpScreen extends StatefulWidget{
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          child: Column(
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
        child: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: Colors.white,size: 33),
          onPressed: () {
           Get.to(LoginScreen());
          },
        ),
      ),
    ],
  ),
  Padding(
    padding: EdgeInsets.fromLTRB(screenWidth * 0.06,screenHeight * 0.00,screenWidth * 0.06,screenHeight * 0.01),
    child: Text("Create Your Account ",style: TextStyle(fontSize: screenHeight * 0.024,fontFamily: bold,fontWeight: FontWeight.w600),),
  ),
  Padding(
    padding:  EdgeInsets.fromLTRB(screenWidth * 0.06,0,screenWidth * 0.06,0),
    child: customTextField(title: "Name", hint: "Full Name" ,iconOnRight: true,icon: Icons.person,color: lightGrey),
  ),
  Padding(
    padding:  EdgeInsets.fromLTRB(screenHeight * 0.03,0,screenHeight * 0.03,0),
    child: customTextField(title: "Phone Number", hint: "0331234567",icon: Icons.phone_android,iconOnRight: true,color: lightGrey ),
  ),
  Padding(
    padding:  EdgeInsets.fromLTRB(screenWidth * 0.06,0,screenWidth * 0.06,0),
    child: customTextField(title: "Password", hint: "********" ,icon: Icons.remove_red_eye_rounded,iconOnRight: true,color: lightGrey),
  ),
  Padding(
    padding:  EdgeInsets.fromLTRB(screenWidth * 0.06,0,screenWidth * 0.06,0),
    child: customTextField(title: "Re-Type Password", hint: "********", icon: Icons.remove_red_eye_rounded,iconOnRight: true,color: lightGrey),
  ),
  (screenHeight * 0.02).heightBox,
  customButton(title: "Sign Up",color: green,
    textColor: white,
    width: screenWidth * 0.865 ,
    height: screenHeight * 0.049,
    onPressed: (){
    },),
  (screenHeight * 0.05).heightBox,
  Padding(
    padding:  EdgeInsets.fromLTRB(screenWidth *0.04,0,screenWidth *0.04,0),
    child: Row(children: [
      Expanded(
        child: Divider(
          color: green,
          thickness: 1,
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(4,0,4,0),
        child: "Or Sign Up using".text.fontFamily(medium).size(16).make(),
      ),
      Expanded(
        child: Divider(
          color: green,
          thickness: 1,
        ),
      ),
    ]),
  ),
  (screenHeight * 0.02).heightBox,
  HStack([
    Image.asset("Assets/logos/google_logo.png",width: 80,height: 80,).flexible(),
    (screenWidth * 0.07).widthBox,
    Image.asset("Assets/logos/gmail_logo.png",width: 80,height: 80,).flexible(),
    (screenWidth * 0.07).widthBox,
    Image.asset("Assets/logos/fb_logo.png",width: 80,height: 80,).flexible(),
  ])
],
          ),
        ),
      ),
    );
  }
}