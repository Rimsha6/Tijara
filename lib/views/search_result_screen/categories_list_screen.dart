import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tijara/core/consts/colors.dart';
import 'package:tijara/widgets/categories_types_box.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../core/consts/styles.dart';
import '../../core/data/all_categories_list.dart';
import '../home_screen/home_screen.dart';

class AllCategoriesListScreen extends StatefulWidget{
  const AllCategoriesListScreen({super.key});

  @override
  State<AllCategoriesListScreen> createState() => _AllCategoriesListScreenState();
}

class _AllCategoriesListScreenState extends State<AllCategoriesListScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: "Categories".text.fontFamily(medium).color(white).size(18).make(),
        centerTitle: true,
        backgroundColor: green,
        leading: BackButton(
          color: white,
          onPressed: (){
            Get.to(HomeScreen());
          },
        ),
      ),
      backgroundColor: lightGrey,
      body: SingleChildScrollView(
          child: AllCategories(allCategories: allCategories)),
    );
  }
}