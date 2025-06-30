import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tijara/core/consts/styles.dart';
import 'package:velocity_x/velocity_x.dart';

Widget customButton ({String? title,onPressed,textColor,color, required double width, required double height}){
  return SizedBox(
    width: width,
    height: height,
    child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
    ),
    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
    ),
      onPressed: onPressed,
      child: title!.text.fontFamily(medium).size(15).color(textColor).make(),
    ),
  );
}