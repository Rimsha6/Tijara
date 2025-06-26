import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../consts/colors.dart';
import '../../consts/styles.dart';

class PersonalDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        leading: BackButton(color: white),
        backgroundColor: green,
        title: const Text(
          "Personal Details",
          style: TextStyle(fontFamily: medium, color: white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
        child: Column(
          children: [
            const SizedBox(height: 12),

            // Profile Section
            Stack(
              children: [
                Container(
                  height: screenHeight / 3.5,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade200, blurRadius: 6, spreadRadius: 2),
                    ],
                  ),
                  child: Image.asset(
                    "Assets/images/profile_bg.png",
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 90,
                  child: Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage("Assets/images/profile_img.jpeg"),
                          ),
                          Positioned(
                            bottom: -4,
                            right: -4,
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: lightGrey,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                icon: Icon(Icons.camera_alt_outlined, size: 20),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      "Muhammad".text.fontFamily(bold).size(22).make(),
                      "muhammad@example.com".text.fontFamily(medium).color(fontGrey).make(),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),
            // Personal Details Section
            Container(
              width: screenWidth,
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  buildDetailRow("Full Name", "Muhammad", screenWidth, screenHeight),
                  buildDetailRow("Email", "muhammad@example.com", screenWidth, screenHeight),
                  buildDetailRow("Phone", "+966 123456789", screenWidth, screenHeight),
                  buildDetailRow("Address", "Riyadh, Saudi Arabia", screenWidth, screenHeight),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDetailRow(String label, String value, double screenWidth, double screenHeight) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: screenWidth * 0.25,
            child: Text(
              label,
              style: TextStyle(fontFamily: medium, fontSize: 16, color: green),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                value,
                style: TextStyle(fontFamily: medium, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

