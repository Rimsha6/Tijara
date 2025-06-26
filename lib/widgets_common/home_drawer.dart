import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tijara/views/drawer%20screens/about_us_screen.dart';
import 'package:tijara/views/drawer%20screens/contact_us_screen.dart';
import 'package:velocity_x/velocity_x.dart';

import '../consts/styles.dart';

class HomeDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return
      Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              child: Image.asset("Assets/images/bg_image.png",fit: BoxFit.fill, ),
              width: double.infinity,
              height: 200,
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: "Home".text.fontFamily(medium).size(18).make(),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(Icons.description_outlined),
              title: "My Ads".text.fontFamily(medium).size(18).make(),
              onTap: () {
                // Handle home tap
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: "Settings".text.fontFamily(medium).size(18).make(),
              onTap: () {
                // Handle settings tap
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: "About Us".text.fontFamily(medium).size(18).make(),
              onTap: () {
               Get.to(AboutUsScreen());
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_support_rounded),
              title: "Help".text.fontFamily(medium).size(18).make(),
              onTap: () {
               Get.to(ContactUsScreen());
              },
            ),
            ListTile(
              leading: Icon(Icons.star_border),
              title: "Rate Us".text.fontFamily(medium).size(18).make(),
              onTap: () {


              },
            ),
          ],
        ),
      );
  }
}