
import 'package:flutter/material.dart';
import 'package:tijara/core/consts/colors.dart';
import 'package:tijara/core/data/sample_favourites.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../core/consts/styles.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../../widgets/favourite_item_card.dart';


class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        title: const Text("Favourites", style: TextStyle(fontFamily: medium, color: white,fontSize: 18)),
        backgroundColor: green,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.02,
          horizontal: screenWidth * 0.02,
        ),
        child: ListView.separated(
          itemCount: favourites.length,
          separatorBuilder: (_, __) => SizedBox(height: screenHeight * 0.015),
          itemBuilder: (context, index) {
            final item = favourites[index];
            return FavouriteItemCard(item: item, screenHeight: screenHeight);
          },
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 1),
    );
  }
}
