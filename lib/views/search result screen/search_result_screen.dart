import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tijara/core/consts/colors.dart';
import 'package:tijara/core/consts/styles.dart';
import 'package:tijara/core/data/sample_ads.dart';
import 'package:tijara/core/data/sample_ads_1.dart';
import 'package:tijara/core/data/sample_of_search_result_ads.dart';
import 'package:tijara/views/auth%20screen/login_screen.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/ad.dart';
import '../../widgets_common/customt_textfield.dart';
import '../../widgets_common/each_ad_tile.dart';
import '../../widgets_common/location_dropdown.dart';

class SearchResultScreen extends StatefulWidget {
  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}
class _SearchResultScreenState extends State<SearchResultScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: lightGrey,
      body: Column(
        children: [
          // Header Section
          Stack(
            children: [
              Container(
                color: green,
                width: screenWidth,
                height: screenHeight * 0.23,
              ),
              Positioned(
                left: 2,
                top: 40,
                child: BackButton(color: white),
              ),
              Positioned(
                top: 60,
                left: 20,
                right: 20,
                child: customTextField(
                  color: white,
                  title: "",
                  hint: "Search Anything!",
                  icon: Icons.search,
                ),
              ),
              Positioned(
                top: 150,
                left: 20,
                right: 20,
                child: Row(
                  children: [
                    Expanded(child: LocationDropdown()),
                    const SizedBox(width: 10),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.filter_alt_outlined, color: darkFontGrey),
                      label: Text("Filter", style: TextStyle(fontFamily: medium, color: darkFontGrey)),
                      style: ElevatedButton.styleFrom(backgroundColor: white),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Sort and Grid View Buttons
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.sort, color: darkFontGrey),
                  label: Text("Sort", style: TextStyle(fontFamily: medium, color: darkFontGrey)),
                  style: ElevatedButton.styleFrom(backgroundColor: white),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.grid_view, color: darkFontGrey),
                  label: Text("Grid View", style: TextStyle(fontFamily: medium, color: darkFontGrey)),
                  style: ElevatedButton.styleFrom(backgroundColor: white),
                ),
              ],
            ),
          ),

          // List Section
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: searchAds.length,
              itemBuilder: (context, index) {
                return EachAdTile(ad: searchAds[index]);
              },
            ),
          ),
          10.heightBox,
        ],
      ),
    );
  }
}


