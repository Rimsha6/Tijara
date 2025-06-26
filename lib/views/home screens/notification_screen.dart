import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../consts/colors.dart';
import '../../consts/styles.dart';
import '../../data/sample_notifications_data.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        centerTitle: true,
        title: "Notifications".text.color(white).fontFamily(medium).size(20).make(),
        leading: BackButton(
          color: white,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.03,
          vertical: screenHeight * 0.02,
        ),
        child: ListView.separated(
          itemCount: notifications.length,
          separatorBuilder: (_, __) => SizedBox(height: screenHeight * 0.015),
          itemBuilder: (context, index) {
            final item = notifications[index];
            return Container(
              padding: EdgeInsets.all(screenHeight * 0.02),
              decoration: BoxDecoration(
                color: item['isRead'] ? lightGrey : white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['title'],
                    style: TextStyle(
                      fontSize: screenHeight * 0.0162,
                      fontFamily: bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.007),
                  Text(
                    item['description'],
                    style: TextStyle(
                      fontFamily: medium,
                      fontSize: screenHeight * 0.015,
                      color: fontGrey,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Text(
                    item['time'],
                    style: TextStyle(
                      fontFamily: regular,
                      fontSize: screenHeight * 0.014,
                      color: grey,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
