import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tijara/widgets/upload_picture_widget.dart';
import 'package:tijara/widgets/bottom_nav_bar.dart';
import 'package:tijara/widgets/categories_dropdown.dart';
import 'package:tijara/widgets/condition_dropdown.dart';
import 'package:tijara/widgets/custom_button.dart';
import 'package:tijara/widgets/customt_textfield.dart';
import 'package:tijara/widgets/location_dropdown.dart';
import 'package:tijara/widgets/terms_and_conditions_checkbox.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../core/consts/colors.dart';
import '../../core/consts/styles.dart';
import '../home_screen/home_screen.dart';

class PostAdScreen extends StatelessWidget{
  const PostAdScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final screenWidth=MediaQuery.of(context).size.width;
    final screenHeight=MediaQuery.of(context).size.height;
   return Scaffold(
     backgroundColor: lightGrey,
     appBar: AppBar(
       title: "Post Ad".text.fontFamily(medium).color(white).size(18).make(),
       backgroundColor: green,
       centerTitle: true,
       leading: BackButton(color: white,onPressed: (){
         Get.to(HomeScreen());
       },),
     ),
     body: SingleChildScrollView(
       child: Padding(padding: EdgeInsets.symmetric(vertical: 14,horizontal: 14),
       child: Container(
         color: white,
         width: screenWidth,
         child: Padding(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
         child: Column(
           children: [
             10.heightBox,
             "List Your Ad".text.fontFamily(bold).color(black).center.size(18).make(),
             15.heightBox,
             customTextField(title: "Product Name",color: lightGrey,iconOnRight: true, icon: Icons.edit),
             4.heightBox,
             customTextField(title: "Product Price",color: lightGrey,icon: Icons.price_change_outlined,iconOnRight: true),
             4.heightBox,
             CategoriesDropdown(),
             4.heightBox,
             ConditionDropdown(),
             4.heightBox,
             customTextField(title: "Contact Number",color: lightGrey, icon: Icons.phone_android,iconOnRight: true),
             4.heightBox,
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text("Location",
                   style: TextStyle(
                     fontSize: 17,
                     fontFamily: 'semibold',
                     color: green,
                   ),),
                 const SizedBox(height: 8),
                 LocationDropdown(backgroundColor: lightGrey,),
               ],
             ),
             4.heightBox,
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   6.heightBox,
                   Text("Description",
                   style: TextStyle(
                     fontSize: 17,
                     fontFamily: 'semibold',
                     color: green,
                   ),),
                   const SizedBox(height: 8),
                   Container(
                     width: screenWidth,
                     height: screenHeight*0.22,
                     color: lightGrey,
                     child: TextFormField(
                      // expands: true,
                       maxLines: 15,
                       minLines: null,
                       decoration:  InputDecoration(
                         hintText: "Describe your product in less than 15 lines...",
                       hintStyle: TextStyle(
                         fontFamily: medium,
                         color: textFieldGrey
                       ),
                       contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                       border: InputBorder.none,
                       focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: darkFontGrey)),
                       ),
                     ),
                   ),
                 ],
             ),
             4.heightBox,
             UploadPicture(),
             4.heightBox,
             TermsAndConditionsCheckBox(),
             10.heightBox,
             customButton(title: "Submit Ad",
               color: green,
               textColor: white,
               width: screenWidth ,
               height: screenHeight * 0.05, onPressed: () {
               Get.to(HomeScreen());
               },),

           ],
         ),
         ),
       ),
       ),
     ),
     bottomNavigationBar: BottomNavBar(currentIndex: 3),
   );
  }
}

