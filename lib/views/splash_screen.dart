 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tijara/consts/colors.dart';
import 'package:tijara/consts/styles.dart';
import '../consts/strings.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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