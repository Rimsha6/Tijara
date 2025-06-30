import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tijara/core/consts/colors.dart';
import 'package:tijara/core/consts/styles.dart';
import 'package:tijara/views/auth%20screen/forgot_password_screen.dart';
import 'package:tijara/views/home%20screens/home_screen.dart';
import 'package:tijara/views/auth%20screen/sign_up_screen.dart';
import 'package:tijara/widgets_common/custom_button.dart';
import 'package:tijara/widgets_common/customt_textfield.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatefulWidget{
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
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
                Container(
                   child: Image.asset('Assets/images/bg_image.png'),
                 ),
                Padding(
                  padding: EdgeInsets.fromLTRB(screenHeight * 0.03,screenHeight * 0.02,screenHeight * 0.03,screenHeight * 0.03),
                  child: Text("Welcome to Tijara",style: TextStyle(fontSize: screenHeight * 0.022,fontFamily: bold,fontWeight: FontWeight.w600),),
                ),
                 Padding(
                   padding:  EdgeInsets.fromLTRB(screenHeight * 0.03,0,screenHeight * 0.03,0),
                    child: customTextField(title: "Username", hint: "User@gmail.com" ,icon: Icons.person,iconOnRight: true,color: lightGrey),
                 ),
                Padding(
                  padding:  EdgeInsets.fromLTRB(screenHeight * 0.03,0,screenHeight * 0.03,0),
                  child: customTextField(title: "Password", hint: "*******" ,icon: Icons.remove_red_eye_sharp,iconOnRight: true,color: lightGrey),
                ),
                (screenHeight * 0.02).heightBox,
                customButton(title: "Log In",color: green,
                  textColor: white,width: screenWidth * 0.86 ,
                  height: screenHeight * 0.049,
                  onPressed: (){
                  Get.to(HomeScreen());
                  },),
                Padding(
                  padding:  EdgeInsets.fromLTRB(0,screenHeight * 0.018,screenWidth * 0.07,screenHeight * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      "Forgot Password?".text.color(green).size(14).fontFamily(medium).make().onTap((){
                        Get.to(ForgotPasswordScreen());
                      }),
                    ],
                  ),
                ),
               Spacer(),
               Padding(
                 padding:  EdgeInsets.fromLTRB(0, screenHeight * 0.015 , 0, screenHeight * 0.04),
                 child: HStack([
                  "Don't have an account? ".text.fontFamily(medium).size(14).make(),
                   " Sign Up ".text.color(green).size(17).fontFamily(bold).make().onTap((){
                     Get.to(SignUpScreen());
                   }),
                 ]),
               ),

              ],
            ),
          ),
        )
    );
  }
}