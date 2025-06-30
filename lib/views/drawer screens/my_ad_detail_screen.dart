import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tijara/core/consts/styles.dart';
import 'package:tijara/models/my_ad.dart';
import 'package:tijara/widgets_common/categories_dropdown.dart';
import 'package:tijara/widgets_common/condition_dropdown.dart';
import 'package:tijara/widgets_common/custom_button.dart';
import 'package:tijara/widgets_common/customt_textfield.dart';
import 'package:tijara/widgets_common/location_dropdown.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../core/consts/colors.dart';
import 'package:flutter/material.dart';
import '../../models/ad.dart';

class MyAdDetailScreen extends StatefulWidget {
  final MyAd myAd;
  const MyAdDetailScreen({Key? key, required this.myAd}) : super(key: key);
  @override
  State<MyAdDetailScreen> createState() => _MyAdDetailScreenState();
}
class _MyAdDetailScreenState extends State<MyAdDetailScreen> {
  late TextEditingController titleController;
  late TextEditingController priceController;
  late TextEditingController descriptionController;
  late TextEditingController locationController;
  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.myAd.title);
    priceController = TextEditingController(text: widget.myAd.price.toString());
    descriptionController = TextEditingController(text: widget.myAd.description);
    locationController = TextEditingController(text: widget.myAd.location);
  }
  @override
  void dispose() {
    titleController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        backgroundColor: green,
        title: "My Ad Details".text.fontFamily(medium).color(white).make(),
        centerTitle: true,
        leading: BackButton(
          color: white,
          onPressed: (){
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Ad Image with Edit Icon
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                SizedBox(
                  height: 200,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (_, __) => SizedBox(width: 10),
                    itemCount: widget.myAd.images.length,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          widget.myAd.images[index],
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
        
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                    mini: true,
                    backgroundColor: white,
                    onPressed: () {},
                    child: const Icon(Icons.edit, color: Colors.black),
                  ),
                )
              ],
            ),
            if (widget.myAd.isActive)
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    "Ad Status:".text.color(black).fontFamily(bold).size(16).make(),
                    15.widthBox,
                    Icon(Icons.circle,color: Colors.green,size: 23,),
                    6.widthBox,
                    "Active".text.color(black).fontFamily(medium).size(16).make(),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: white,
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    customTextField(title: "Title", color: Colors.grey.shade200, maxLines: 1, controller: titleController),
                    customTextField(title: "Price", color: Colors.grey.shade200, maxLines: 1, controller: priceController),
                    CategoriesDropdown(),
                    ConditionDropdown(),
                    customTextField(title: "Description", color: Colors.grey.shade200, maxLines: 7, controller: descriptionController),
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
                    10.heightBox,
                    customTextField(title: "Contact Number",color: lightGrey,),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(Icons.visibility, color: green),
                        const SizedBox(width: 8),
                        Text("Views: ${widget.myAd.views ?? 0}"),]
                    ),
                    Row(
                      children: [
                        Icon(Icons.post_add_rounded, color: green),
                        const SizedBox(width: 8),
                        Text("Ad Posted On: ${widget.myAd.createdAt ?? 0}"),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                       MyButton(title: "Save",onPressed: (){
                           Get.back();
                       }),
                        const SizedBox(width: 12),
                        MyButton(title: "Cancel",onPressed: (){
                          Get.back();
                        }),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
Widget MyButton({String? title,onPressed}){
  return Expanded(child: OutlinedButton(
    onPressed: onPressed,
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(green),
      foregroundColor: MaterialStateProperty.all<Color>(white),
      side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
      overlayColor: MaterialStateProperty.all<Color>(Colors.white.withOpacity(0.1)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ),
    child:  Text(title!,style: TextStyle(
      fontFamily: medium
    ),),
  ),
  );
}

