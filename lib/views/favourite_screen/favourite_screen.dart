import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tijara/core/consts/colors.dart';
import 'package:tijara/views/home_screen/home_provider.dart';
import '../../core/consts/styles.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../../widgets/emptystate_widget.dart';
import '../../widgets/favourite_item_card.dart';
import '../../widgets/loading_widget.dart';

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

    return Consumer<HomeProvider>(builder: (context, model, child) {
      return Scaffold(
        backgroundColor: lightGrey,
        appBar: AppBar(
          title: const Text("Favourites",
              style: TextStyle(fontFamily: medium, color: white, fontSize: 18)),
          backgroundColor: green,
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.02,
            horizontal: screenWidth * 0.02,
          ),
          child: FutureBuilder<List<String>>(
            future: model.getFavAdList(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SizedBox(
                    height: 500, child: Center(child: LoadingWidget()));
              }
              if (snapshot.hasError) {
                print("Error: ${snapshot.error}");
                return SizedBox(
                    height: 500,
                    child: Center(
                        child: EmptyState(
                            message: 'Error fetching favorite ads')));
              }
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return SizedBox(
                    height: 500,
                    child:
                        Center(child: EmptyState(message: 'No favorite ad')));
              }

              List<String> favUserList = snapshot.data!;
              print("UI - Retrieved Favorite ads: $favUserList");

              return FutureBuilder<List<Map<String, dynamic>>>(
                future: model.getFavUsersData(favUserList),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SizedBox(
                      height: 500,
                      child: Center(
                        child: LoadingWidget(),
                      ),
                    );
                  }
                  if (snapshot.hasError) {
                    print(" Error: ${snapshot.error}");
                    return SizedBox(
                      height: 500,
                      child: Center(
                        child:
                            EmptyState(message: 'Error fetching favorite ads'),
                      ),
                    );
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return SizedBox(
                      height: 500,
                      child: Center(
                        child: EmptyState(message: 'No favorite ad'),
                      ),
                    );
                  }

                  List<Map<String, dynamic>> favUsersData = snapshot.data!;
                  print("UI - Fetched Favorite ads: ${favUsersData.length}");

                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: favUsersData.length,
                    itemBuilder: (context, index) {
                      return FavouriteItemCard(
                          screenHeight: screenHeight,
                          userData: favUsersData[index]);
                    },
                  );
                },
              );
            },
          ),
        ),
        bottomNavigationBar: BottomNavBar(currentIndex: 1),
      );
    });
  }
}
