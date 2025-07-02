
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tijara/core/consts/colors.dart';
import 'package:tijara/core/consts/strings.dart';
import 'package:tijara/core/data/swiper.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/consts/styles.dart' show bold, medium;

class AboutUsScreen extends StatelessWidget{
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
   return Scaffold(
     backgroundColor: white,
     body: SingleChildScrollView(
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
                    Get.back();
                   },
                 ),
               ),
             ],
           ),
           Padding(
             padding: EdgeInsets.fromLTRB(screenHeight * 0.03,screenHeight * 0.01,screenHeight * 0.03,screenHeight * 0.01),
             child: Text("About Us",style: TextStyle(fontSize: screenHeight * 0.022,fontFamily: bold,fontWeight: FontWeight.w600),),
           ),
           SizedBox(height: screenHeight * 0.02),
           Container(
             width: screenWidth * 0.98,
             margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
             padding: EdgeInsets.all(screenHeight * 0.016),
             decoration: BoxDecoration(
               color: lightGrey,
               borderRadius: BorderRadius.circular(12),
             ),
             child: Column(
               children: [
                 Text(
                 aboutUs,
                   style: TextStyle(
                     fontSize: screenHeight * 0.015,
                     height: 1.5,
                     color: Colors.black87,
                     fontFamily: medium,
                   ),
                   textAlign: TextAlign.justify,
                 ),
                 VxSwiper(items: swiperItems,autoPlay: true,
                   enlargeCenterPage: true,
                   height: 200,
                   aspectRatio: 16 / 9,
                   autoPlayInterval: Duration(seconds: 3), ),
                 SizedBox(height: screenHeight * 0.02),
               ],
             ),
           ),
           SizedBox(height: screenHeight * 0.08),
         ],
       ),
     ),
   );
  }
}