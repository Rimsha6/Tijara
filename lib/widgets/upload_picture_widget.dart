import 'dart:io';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../core/consts/colors.dart';
import '../core/consts/styles.dart';

class UploadPicture extends StatelessWidget {
  final File? imageFile;

  const UploadPicture({super.key, required this.imageFile});

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
          height: 150,
          child: imageFile == null
              ? Center(
            child: Icon(
              Icons.image,
              color: Colors.grey.shade600,
              size: 40,
            ),
          )
              : ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.file(
              imageFile!,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ),
      ],
    );
  }
}
