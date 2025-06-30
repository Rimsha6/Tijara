import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tijara/core/consts/colors.dart';
import 'package:tijara/core/data/sample_ads_1.dart';
import 'package:tijara/views/notification%20screen/notification_screen.dart';
import 'package:tijara/widgets_common/bottom_nav_bar.dart';
import 'package:tijara/widgets_common/categories_types_box.dart';
import 'package:tijara/widgets_common/customt_textfield.dart';
import 'package:tijara/widgets_common/each_category.dart';
import 'package:tijara/widgets_common/home_drawer.dart';
import 'package:tijara/widgets_common/location_dropdown.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../core/consts/styles.dart' show bold, medium;
import '../../core/data/sample_ads.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: lightGrey,
      drawer: HomeDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: screenWidth,
                  height: screenHeight * 0.30,
                  color: green,
                ),
                Positioned(
                  top: screenHeight * 0.056,
                  left: screenWidth * 0.04,
                  child: Builder(
                    builder: (context) => IconButton(
                      icon: Icon(Icons.menu, color: Colors.white,size: 34,),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.069,
                  left: screenWidth * 0.37,
                  child:
                  Row(children: [
                    "English".text.color(white).fontFamily(medium).size(15).make().onTap((){}),
                    " / ".text.color(white).fontFamily(medium).size(15).make(),
                    "العربية".text.color(white).fontFamily(medium).size(15).make().onTap((){}),
                  ],),
                ),
                Positioned(
                  top: screenHeight * 0.056,
                  left: screenWidth * 0.85,
                  child: IconButton(onPressed: (){
                    Get.to(NotificationsScreen());
                  }, icon: Image.asset(width: 35,height: 35,"Assets/logos/notificationi.png",color: Colors.amberAccent,)),
                ),
                Positioned(
                  top: 150,
                  left: 20,
                  right: 100,
                  child: LocationDropdown(),
                ),
                Positioned(
                  top: 180,
                  left: 20,
                  right: 20,
                  child: customTextField(
                    color: white,
                    title: "",
                    hint: "Search Anything!",
                    icon: Icons.search,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: "Categories".text.fontFamily(bold).size(17).make(),
              ),
            ),
           CategoriesBox(),
            EachCategory(
              categoryTitle: "Vehicles",
              ads: vehicleAds,
            ),
            EachCategory(
              categoryTitle: "Furniture",
              ads: furnitureAds,
            ),

            // Add other body content below if needed
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 0),
    );
  }
}
