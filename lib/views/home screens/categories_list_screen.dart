import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tijara/consts/colors.dart';
import 'package:tijara/widgets_common/categories_types_box.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../consts/styles.dart';
import '../../data/all_categories_list.dart';

class AllCategoriesListScreen extends StatefulWidget{
  @override
  State<AllCategoriesListScreen> createState() => _AllCategoriesListScreenState();
}

class _AllCategoriesListScreenState extends State<AllCategoriesListScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: "All Categories".text.fontFamily(medium).color(white).size(20).make(),
        centerTitle: true,
        backgroundColor: green,
        leading: BackButton(
          color: white,
        ),
      ),
      backgroundColor: lightGrey,
      body: SingleChildScrollView(
          child: AllCategories(allCategories: allCategories)),
    );
  }
}