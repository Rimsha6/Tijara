import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:tijara/core/consts/colors.dart';
import 'package:tijara/core/consts/styles.dart';
import 'package:tijara/core/data/sample_of_search_result_ads.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../core/models/ad.dart';
import '../../core/models/post_ad_model.dart';
import '../../widgets/customt_textfield.dart';
import '../../widgets/each_ad_tile.dart';
import '../../widgets/location_dropdown.dart';
import '../home_screen/home_provider.dart';
import 'ad_detail_screen.dart';

class SearchResultScreen extends StatefulWidget {
  final String category;
  const SearchResultScreen({super.key, required this.category});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}
class _SearchResultScreenState extends State<SearchResultScreen> {
  @override
  Widget build(BuildContext context) {
    print(">>>>>>>>>>> ${widget.category}");
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final homeProvider = Provider.of<HomeProvider>(context);
    final filteredAds = homeProvider.getAdsForCategory(widget.category);

    return Scaffold(
      backgroundColor: lightGrey,
      body: Column(
        children: [
          // Header UI
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

          Expanded(
            child: homeProvider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : filteredAds.isEmpty
                ? Center(child: Text("No ads found in ${widget.category}"))
                : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: filteredAds.length,
              itemBuilder: (context, index) {
                final adMap = filteredAds[index];
                final ad = PostAdModel.fromJson(adMap);
                return GestureDetector(
                    onTap: () {
                      Get.to(AdDetailScreen(ad: ad));
                    },
                    child: EachAdTile(ad: ad));
              },
            ),
          ),
          10.heightBox,
        ],
      ),
    );
  }

}


