import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tijara/consts/colors.dart';
import 'package:velocity_x/velocity_x.dart';
import '../consts/styles.dart';
class CategoriesDropdown extends StatefulWidget{
  @override
  State<CategoriesDropdown> createState() => _CategoriesDropdownState();
}

class _CategoriesDropdownState extends State<CategoriesDropdown> {
  String? selectedCategory;
  @override
  Widget build(BuildContext context) {
    final List<String> Categories=[
      "Cars and Vans" , "Bikes"  ,"Mobiles and Tablets", "Fashion" ,
      "Electronics and Appliances" , "Pets and Animals", " Home Decor",
      "Books", "Sports", "Kids and Babies", "Furniture", "Hobbies",
      "Industrial and Business",
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Category",
          style: TextStyle(
            fontSize: 17,
            fontFamily: 'semibold',
            color: green,
          ),),
        const SizedBox(height: 8),
        Row(
        children: [
          Expanded(child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: lightGrey,
          border: Border.all(color:Colors.grey.shade300),
        ),
        child: DropdownButtonHideUnderline(child:
        DropdownButton<String>(
          value: selectedCategory,
            hint: Row(
              children: [
                Icon(Icons.widgets_outlined,color: Colors.green),
                SizedBox(width: 8),
                "Select Category".text.fontFamily(medium).color(grey).make(),
              ],
            ),
            isExpanded: true,
            icon: Icon(Icons.arrow_drop_down),
            items: Categories.map((category){
              return DropdownMenuItem<String>(
                value: category,
                child: category.text.fontFamily(medium).make(),
              );
            }
            ).toList(),
          onChanged: (value) {
            setState(() {
              selectedCategory = value;
            });
          },
            )),
          ))
        ],
        ),
        10.heightBox,
      ],
    );
  }
}

