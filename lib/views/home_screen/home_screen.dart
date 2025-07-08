import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tijara/core/consts/colors.dart';
import 'package:tijara/widgets/bottom_nav_bar.dart';
import 'package:tijara/widgets/categories_types_box.dart';
import 'package:tijara/widgets/customt_textfield.dart';
import 'package:tijara/widgets/each_category.dart';
import 'package:tijara/widgets/home_drawer.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../core/consts/styles.dart';
import '../notification_screen/notification_screen.dart';
import 'home_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: lightGrey,
      drawer: HomeDrawer(),
      body: RefreshIndicator(
        onRefresh: () async {
          await homeProvider.fetchAds();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: screenWidth,
                    height: screenHeight * 0.20,
                    color: green,
                  ),
                  Positioned(
                    top: screenHeight * 0.056,
                    left: screenWidth * 0.04,
                    child: Builder(
                      builder: (context) => IconButton(
                        icon: const Icon(Icons.menu, color: Colors.white, size: 34),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: screenHeight * 0.069,
                    left: screenWidth * 0.37,
                    child: Row(
                      children: [
                        "English".text.color(white).fontFamily(medium).size(15).make().onTap(() {}),
                        " / ".text.color(white).fontFamily(medium).size(15).make(),
                        "العربية".text.color(white).fontFamily(medium).size(15).make().onTap(() {}),
                      ],
                    ),
                  ),
                  Positioned(
                    top: screenHeight * 0.056,
                    left: screenWidth * 0.85,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => NotificationsScreen()),
                        );
                      },
                      icon: Image.asset(
                        "Assets/logos/notificationi.png",
                        width: 35,
                        height: 35,
                        color: Colors.amberAccent,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100,
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
                padding: const EdgeInsets.all(12),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: "Categories".text.fontFamily(bold).size(17).make(),
                ),
              ),
               CategoriesBox(),
              homeProvider.isLoading
                  ? const Padding(
                padding: EdgeInsets.all(20),
                child: CircularProgressIndicator(),
              )
                  : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EachCategory(
                    categoryTitle: "Mobiles and Tablets",
                    ads: homeProvider.getAdsForCategory("Mobiles and Tablets"),
                  ),
                  EachCategory(
                    categoryTitle: "Furniture",
                    ads: homeProvider.getAdsForCategory("Furniture"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 0),
    );
  }

}
