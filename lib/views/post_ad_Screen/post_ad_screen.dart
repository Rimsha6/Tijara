import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tijara/views/post_ad_Screen/post_ad_provider.dart';
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

class PostAdScreen extends StatelessWidget {
  const PostAdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<PostAdProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        title: "Post Ad".text.fontFamily(medium).color(white).size(18).make(),
        backgroundColor: green,
        centerTitle: true,
        leading: BackButton(
          color: white,
          onPressed: () {
            Get.to(HomeScreen());
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Container(
            color: white,
            width: screenWidth,
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.heightBox,
                Center(
                  child: Text(
                    "List Your Ad",
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'semibold',
                      color: green,
                    ),
                  ),
                ),
                15.heightBox,
                Text(
                  "Product Name",
                  style: const TextStyle(
                    fontSize: 17,
                    fontFamily: 'semibold',
                    color: green,
                  ),
                ),
                const SizedBox(height: 5),
                CustomTextField(
                  hintText: "Product Name",
                  onChanged: (value) {
                    model.postAdModel.productName = value;
                  },
                ),
                15.heightBox,
                Text(
                  "Product Price",
                  style: const TextStyle(
                    fontSize: 17,
                    fontFamily: 'semibold',
                    color: green,
                  ),
                ),
                const SizedBox(height: 5),
                CustomTextField(
                  hintText: "Product Price",
                  onChanged: (value) {
                    model.postAdModel.productPrice = value;
                  },
                ),
                15.heightBox,
                CategoriesDropdown(onChanged: (value) {
                  model.postAdModel.category = value;
                }),
                4.heightBox,
                ConditionDropdown(onChanged: (value) {
                  model.postAdModel.condition = value;
                }),
                4.heightBox,
                Text(
                  "Contact",
                  style: const TextStyle(
                    fontSize: 17,
                    fontFamily: 'semibold',
                    color: green,
                  ),
                ),
                const SizedBox(height: 5),
                CustomTextField(
                  hintText: "Contact Number",
                  onChanged: (value) {
                    model.postAdModel.contactNumber = value;
                  },
                ),
                15.heightBox,
                Text(
                  "Location",
                  style: const TextStyle(
                    fontSize: 17,
                    fontFamily: 'semibold',
                    color: green,
                  ),
                ),
                const SizedBox(height: 5),
                GestureDetector(
                  onTap: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const MapPickerScreen()),
                    );

                    if (result != null) {
                      model.setFullLocation(
                        result['address'],
                        result['lat'],
                        result['lng'],
                      );
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    decoration: BoxDecoration(
                      color: lightGrey,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.location_on_outlined,
                            color: Colors.green),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            model.postAdModel.location?.isNotEmpty == true
                                ? model.postAdModel.location!
                                : "Select Location from Map",
                            style: const TextStyle(
                              fontFamily: 'medium',
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                15.heightBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    6.heightBox,
                    Text("Description",
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'semibold',
                            color: green)),
                    const SizedBox(height: 8),
                    Container(
                      width: screenWidth,
                      height: screenHeight * 0.12,
                      color: lightGrey,
                      child: TextFormField(
                        maxLines: 4,
                        onChanged: (value) {
                          model.postAdModel.description = value;
                        },
                        decoration: InputDecoration(
                          hintText:
                              "Describe your product in less than 15 lines...",
                          hintStyle: TextStyle(
                              fontFamily: medium, color: textFieldGrey),
                          contentPadding: const EdgeInsets.all(12),
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: darkFontGrey)),
                        ),
                      ),
                    ),
                  ],
                ),
                4.heightBox,
                GestureDetector(
                  onTap: model.pickImage,
                  child: UploadPicture(imageFile: model.selectedImage),
                ),
                4.heightBox,
                TermsAndConditionsCheckBox(
                  value: model.isTermsAccepted,
                  onChanged: model.toggleTerms,
                ),
                10.heightBox,
                model.isLoading
                    ? Center(child: SizedBox(height: 25,width: 25,child: const CircularProgressIndicator()))
                    : customButton(
                        title: "Submit Ad",
                        color: model.isTermsAccepted ? green : grey,
                        textColor: white,
                        width: screenWidth,
                        height: screenHeight * 0.05,
                        onPressed: model.isTermsAccepted
                            ? () async {
                                await model.submitAd();
                                if (!model.isLoading) Get.to(HomeScreen());
                              }
                            : null,
                      ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 3),
    );
  }
}
