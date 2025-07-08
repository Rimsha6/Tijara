import 'package:flutter/material.dart';
import 'package:tijara/core/consts/colors.dart';
import 'package:tijara/core/consts/styles.dart';
import 'package:tijara/widgets/custom_button.dart';
import 'package:velocity_x/velocity_x.dart';

class AdDetailScreen extends StatelessWidget {
  final Map<String, dynamic> ad;

  const AdDetailScreen({required this.ad, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final String title = ad['productName'] ?? 'No Title';
    final String price = ad['productPrice'] ?? 'N/A';
    final String description = ad['description'] ?? 'No Description';
    final String location = ad['location'] ?? 'Unknown';
    final String category = ad['category'] ?? 'Other';
    final int views = ad['views'] ?? 0;
    final String contact = ad['contactNumber'] ?? 'N/A';
    final String userName = ad['userName'] ?? 'Anonymous';
    final String userId = ad['userId'] ?? 'N/A';
    final String adId = ad['adId'] ?? 'N/A';
    final String imageUrl = ad['imageUrl'] ?? '';

    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        backgroundColor: green,
        title: "Ad Detail".text.fontFamily(medium).color(white).make(),
        centerTitle: true,
        leading: const BackButton(color: white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: imageUrl.isNotEmpty
                  ? Image.network(
                imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              )
                  : Container(
                height: 200,
                color: Colors.grey.shade300,
                child: const Center(child: Icon(Icons.image_not_supported)),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      "Category: ".text.fontFamily(medium).color(Colors.grey.shade600).make(),
                      category.text.fontFamily(medium).color(darkFontGrey).make(),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.remove_red_eye, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      "$views".text.size(14).make(),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              color: white,
              width: screenWidth,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  title.text.fontFamily(bold).size(20).make(),
                  const SizedBox(height: 5),
                  price.text.color(green).fontFamily(medium).size(18).make(),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 18, color: Colors.grey),
                      const SizedBox(width: 4),
                      location.text.color(Colors.grey).size(14).make(),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              color: white,
              width: screenWidth,
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Details".text.fontFamily(bold).size(16).make(),
                  const SizedBox(height: 6),
                  description.text.fontFamily(medium).size(16).make(),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              color: white,
              width: screenWidth,
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      "Contact: ".text.fontFamily(bold).make(),
                      contact.text.fontFamily(medium).make(),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      "Address: ".text.fontFamily(bold).make(),
                      location.text.fontFamily(medium).make(),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Image.asset("Assets/images/maps.jpeg", height: screenHeight * 0.20, width: screenWidth, fit: BoxFit.cover),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: "Seller Profile".text.fontFamily(bold).size(16).make(),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              color: white,
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  const CircleAvatar(radius: 30, backgroundImage: AssetImage("Assets/images/profile_img.jpeg")),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        userName.text.color(green).fontFamily(medium).make(),
                        "User ID: $userId".text.color(Colors.grey.shade600).fontFamily(medium).make(),
                        "Ad ID: $adId".text.color(Colors.grey.shade600).fontFamily(medium).make(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customButton(
                    width: screenWidth * 0.44,
                    height: screenHeight * 0.05,
                    title: "Message Seller",
                    color: green,
                    textColor: white,
                    onPressed: () {},
                  ),
                  customButton(
                    width: screenWidth * 0.44,
                    height: screenHeight * 0.05,
                    title: "Call Seller",
                    color: green,
                    textColor: white,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}