import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/consts/colors.dart';
import '../core/consts/styles.dart';

class UploadPicture extends StatefulWidget {
  @override
  State<UploadPicture> createState() => _UploadPictureState();
}

class _UploadPictureState extends State<UploadPicture> {
  // You can use any image picking logic here
  List<ImageProvider> uploadedImages = [];

  void pickImage() async {
    // TODO: Replace with real image picker logic
    setState(() {
      uploadedImages.add(AssetImage('Assets/images/sofa.jpeg')); // placeholder
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.heightBox,
        Text(
          "Upload Pictures",
          style: TextStyle(
            fontSize: 17,
            fontFamily: 'semibold',
            color: green,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: lightGrey,
            borderRadius: BorderRadius.circular(8),
          ),
          width: screenWidth,
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: uploadedImages.length + 1,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              if (index == uploadedImages.length) {
                // Add Button
                return GestureDetector(
                  onTap: pickImage,
                  child: Container(
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: green),
                    ),
                    child: Icon(Icons.add_a_photo, color: green),
                  ),
                );
              } else {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image(
                    image: uploadedImages[index],
                    fit: BoxFit.cover,
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
