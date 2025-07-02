import 'package:flutter/material.dart';
import 'package:tijara/widgets/customt_textfield.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../core/consts/colors.dart';
import '../../core/consts/styles.dart';
import '../../widgets/custom_button.dart';

class ForgotPasswordScreen extends StatefulWidget{
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
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
                child: IconButton(
                  icon: Icon(Icons.arrow_back_rounded, color: Colors.white,size: 27),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(screenHeight * 0.03,screenHeight * 0.05,screenHeight * 0.03,screenHeight * 0.01),
            child: Text("Forgot your Password!",style: TextStyle(fontSize: screenHeight * 0.018,fontFamily: bold,fontWeight: FontWeight.w600,color: black),),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(screenHeight * 0.03,screenHeight * 0.03,screenHeight * 0.03,screenHeight * 0.01),
            child: Text("Please enter your Email.",style: TextStyle(fontSize: screenHeight * 0.016,fontFamily: medium,fontWeight: FontWeight.w500,color: black),),
          ),
          Padding(
            padding:  EdgeInsets.fromLTRB(screenHeight * 0.03,screenHeight * 0.045,screenHeight * 0.03,0),
            child: customTextField(title: "Email" ,hint: "User@gmail.com",iconOnRight: true,icon: Icons.email ,color: lightGrey),
          ),
          (screenHeight * 0.030).heightBox,
          customButton(title: "Submit",color: green,
            textColor: white,width: screenWidth * 0.86 ,
            height: screenHeight * 0.049,
            onPressed: (){},),

        ],
      ),

    );
  }
}