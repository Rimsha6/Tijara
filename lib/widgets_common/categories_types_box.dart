import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tijara/core/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:tijara/core/consts/styles.dart';
import 'package:tijara/core/data/all_categories_list.dart';
import 'package:tijara/views/search%20result%20screen/categories_list_screen.dart';
import 'package:tijara/views/search%20result%20screen/search_result_screen.dart';
import 'package:tijara/widgets_common/each_category.dart';
import 'package:velocity_x/velocity_x.dart';
import '../core/data/category_list.dart';
// widget to display all the categories with their icons on home screen
class CategoriesBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          color: white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: categories.map((category) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: (){
                      if (category.label == "More") {
                        Get.to(() => AllCategoriesListScreen());
                      } else {
                        Get.to(SearchResultScreen());
                      }
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey.shade200,
                          child: Image.asset(
                            category.imagePath,
                            width: 41,
                            height: 41,
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          category.label,
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
class CategoryItem {
  final String imagePath;
  final String label;
  CategoryItem({required this.imagePath, required this.label});
}
// widget for displaying all the categories with their icons once the more button is clicked in the above class
class AllCategories extends StatelessWidget{
  final List<CategoryItem> allCategories;
  AllCategories(
  { super.key,
    required this.allCategories,}
      );
@override
  Widget build(BuildContext context) {
  return Padding(
padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
    child: Padding(padding: EdgeInsets.all(8),
    child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (_,__)=> SizedBox(height: 6,),
    itemCount: allCategories.length,
      itemBuilder: (context,index){
        final category = allCategories[index];
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 16,
            ),
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey.shade200,
              child: Image.asset(
                category.imagePath,
                width: 41,
                height: 41,
                fit: BoxFit.contain,
              ),
            ),
            title: category.label.text.fontFamily(medium).size(15).make(),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            onTap: () {
             Get.to(SearchResultScreen());
            },
          ),
        );
      }
    ),),
  );
  }
}