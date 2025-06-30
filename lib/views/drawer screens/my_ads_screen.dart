import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tijara/core/consts/colors.dart';
import 'package:tijara/core/consts/styles.dart';
import 'package:tijara/models/my_ad.dart';
import 'package:tijara/widgets_common/My_ad_tile.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/ad.dart';
// screen to display lists of ads a user have posted
//my ads screen can be searched through the drawer
class MyAdsScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final MyAd sampleAd= MyAd(
        userId: "123456",
        adId: "123456",
        title: "Toyota Camry",
        price: "200",
        description: "2018 model, well-maintained, low mileage",
        images: [
          "Assets/images/toyota_camry.jpeg",
        ],
        location: "Damam",
        createdAt: DateTime(2025,12,3,0,0));
   return Scaffold(
     backgroundColor: lightGrey,
appBar: AppBar(
  title: "My Ads".text.fontFamily(medium).color(white).size(18).make(),
  backgroundColor: green,
  centerTitle: true,
  leading: BackButton(color: white,
  onPressed: (){
    Get.back();
  },),
),
     body: Padding(padding: EdgeInsets.symmetric(horizontal: 8,vertical: 10),
     child:
         ListView(
           children: [
             MyAdTile(ad: sampleAd),
           ],
         ),
     ),
   );
  }
}