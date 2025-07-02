import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../core/consts/colors.dart';
import '../../core/consts/styles.dart';
import '../../core/models/my_ad.dart';
import 'my_ad_detail_screen.dart';

class Detail extends StatefulWidget{
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}
class _DetailState extends State<Detail> {
 @override
  Widget build(BuildContext context) {
   final MyAd sampleAd= MyAd(userId: "123456",
       adId: "123456",
       title:"Toyota Camry" ,
       price: "25,000 SAR",
       description:"2018 model, well-maintained, low mileage." ,
       images:  ["Assets/images/toyota_camry.jpeg",
         "Assets/images/toyota_camry.jpeg"],
       location: "Riyadh",
       createdAt: DateTime(2017, 9, 7, 17, 30),
   isActive: true,
   isApproved: true);
    return Scaffold(
      appBar: AppBar(
        title: "My Ad Detail".text.fontFamily(medium).color(white).make(),
        centerTitle: true,
        backgroundColor: green,
        leading: BackButton(color: white,),
      ),
      backgroundColor: lightGrey,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MyAdDetailScreen(myAd: sampleAd),
        ),
      ),
    );
  }
}