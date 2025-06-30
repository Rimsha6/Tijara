 import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tijara/core/consts/colors.dart';
import 'package:tijara/core/consts/styles.dart';
import 'package:tijara/views/auth%20screen/login_screen.dart';

import '../../core/consts/strings.dart';


class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                LoginScreen(),
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: green,
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Text( appname1, style: TextStyle(
             fontFamily: bold,
             fontSize: 62,
             color: white,
           ),),


         ],
       ),
     ),
   );
  }
}