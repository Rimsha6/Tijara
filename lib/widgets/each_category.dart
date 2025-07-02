import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tijara/core/consts/colors.dart';
import 'package:tijara/core/data/sample_of_search_result_ads.dart';
import 'package:velocity_x/velocity_x.dart';
import '../core/consts/styles.dart';
import '../views/search_result_screen/ad_detail_screen.dart';
class EachCategory extends StatelessWidget {
  final String categoryTitle;
  final List<Map<String, dynamic>> ads;

  const EachCategory({
    required this.categoryTitle,
    required this.ads,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child:
            categoryTitle.text.fontFamily(bold).size(16.5).make(),
        ),

        // Horizontally scrollable ads
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: ads.map((ad) => AdCard(ad: ad)).toList(),
          ),
        ),
      ],
    );
  }
}
// Reusable widget for individual ad cards
class AdCard extends StatelessWidget {
  final Map<String, dynamic> ad;
  const AdCard({required this.ad, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Logic needs to be implemented for now its hardcoded values
    return GestureDetector(
      onTap: (){
Get.to(AdDetailScreen(ad: searchAds[1]));
      },
      //********************************** when the ad is clicked it should display the relevant ad detai;l
      child: Container(
        width: 200,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.grey.shade200, blurRadius: 6, spreadRadius: 2)
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with favorite icon
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    ad["image"],
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Icon(
                    ad["isFavorite"] ? Icons.favorite : Icons.favorite_border,
                    color: ad["isFavorite"] ? Colors.red : Colors.grey,
                  ),
                ),
              ],
            ),
            // Title
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0,bottom: 0),
              child: Text(
                ad["title"],
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3.0,left: 8.0,bottom: 8.0),
              child: Text(
                ad["price"],
                style: TextStyle(fontSize: 13, fontFamily: bold),
              ),
            ),
            // Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                ad["description"],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: medium,
                  fontSize: 12.5
                ),
              ),
            ),
            // Location & Views
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.location_on, size: 14, color: green),
                  SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      ad["location"],
                      style: TextStyle(fontSize: 12,fontFamily: medium,),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(Icons.remove_red_eye, size: 14, color: green),
                  SizedBox(width: 2),
                  Text("${ad["views"]}", style: TextStyle(fontSize: 12,fontFamily: medium)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}