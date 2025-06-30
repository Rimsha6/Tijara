import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tijara/widgets_common/custom_button.dart';
import 'package:tijara/widgets_common/customt_textfield.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/consts/colors.dart';
import '../../../core/consts/styles.dart';

class ChangeUsernameScreen extends StatefulWidget{
  @override
  State<ChangeUsernameScreen> createState() => _ChangeUsernameScreenState();
}

class _ChangeUsernameScreenState extends State<ChangeUsernameScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth=MediaQuery.of(context).size.width;
    final screenHeight=MediaQuery.of(context).size.height;
   return Scaffold(
     backgroundColor: lightGrey,
     appBar: AppBar(
       title: "Change Username".text.fontFamily(medium).color(white).size(18).make(),
       backgroundColor: green,
       centerTitle: true,
       leading: BackButton(color: white,),
     ),
     body: Padding
       (padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.09 ,vertical: 04,),
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
                       "Muhammad".text.fontFamily(bold).size(17).make(),
                       "muhammad@example.com".text.fontFamily(medium).color(fontGrey).make(),
                     ],
                   ),
                 )
               ]
           ),

           Padding(
             padding: const EdgeInsets.only(top: 40,bottom: 30),
             child: "Enter your new username".text.fontFamily(bold).size(16).make(),
           ),
           customTextField(title: "New Username",hint: "Muhammad",icon: Icons.edit,iconOnRight: true,color: Colors.grey.shade300),
           SizedBox(height: 14),
           customButton(title: "Submit",color: green,
             textColor: white,
             width: screenWidth * 0.875 ,
             height: screenHeight * 0.049,
             onPressed: (){
             Get.back();
             },),
         ],
     ),),
   );
  }
}
