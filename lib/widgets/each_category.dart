import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          padding: const EdgeInsets.all(5),
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
    final String image = ad["imageUrl"] ?? '';
    final String title = ad["productName"] ?? 'No Title';
    final String price = ad["productPrice"] ?? 'N/A';
    final String description = ad["description"] ?? 'No description';
    final String location = ad["location"] ?? 'Unknown';
    final int views = ad["views"] ?? 0;

    return GestureDetector(
      onTap: () {
        Get.to(AdDetailScreen(ad: ad));
      },
      child: Container(
        width: 200,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 6,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: image.isNotEmpty
                  ? Image.network(
                image,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              )
                  : Container(
                height: 100,
                width: double.infinity,
                color: Colors.grey.shade300,
                child: const Icon(Icons.image_not_supported),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'bold',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3.0, left: 8.0, bottom: 8.0),
              child: Text(
                price,
                style: const TextStyle(fontSize: 13, fontFamily: 'bold'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontFamily: 'medium', fontSize: 12.5),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.location_on, size: 14, color: Colors.green),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      location,
                      style: const TextStyle(fontSize: 12, fontFamily: 'medium'),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Icon(Icons.remove_red_eye, size: 14, color: Colors.green),
                  const SizedBox(width: 2),
                  Text(
                    views.toString(),
                    style: const TextStyle(fontSize: 12, fontFamily: 'medium'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
