import 'package:get/get.dart';
import 'package:tijara/core/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:tijara/core/consts/styles.dart';
import 'package:velocity_x/velocity_x.dart';
import '../core/models/my_ad.dart';
import '../views/drawer_screen/my_ad_detail_screen.dart';

class MyAdTile extends StatelessWidget{
  final MyAd ad;
   const MyAdTile({
    required this.ad,
    Key? key,
}):super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenHeight= MediaQuery.of(context).size.height;
    final screenWidth= MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){
          Get.to(MyAdDetailScreen(myAd: ad));
        },
        child: Container(
          height: screenHeight* 0.15,
          width: screenWidth,
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300),
              boxShadow: [
                BoxShadow(color: Colors.grey.shade200, blurRadius: 6, spreadRadius: 2)
              ]
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                    width: 100, // or screenWidth * 0.4, etc.
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        ad.images[0],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                10.heightBox,
                       Text(ad.title,
                           style: const TextStyle(
                             fontSize: 16, fontFamily: bold,)),
                       Text(ad.price,
                         style: const TextStyle(fontSize: 14, color: Colors.green,fontFamily: medium),),
                       Text(ad.description,
                           maxLines: 2,
                           style:  TextStyle(fontSize: 14, color: Colors.grey.shade800,fontFamily: medium)),
                       const SizedBox(height: 4),
                       Text(ad.location,
                           style: const TextStyle(fontSize: 12, color: Colors.grey)),
                     ],
                   ),
                 ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
