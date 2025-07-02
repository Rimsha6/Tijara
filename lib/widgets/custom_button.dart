import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:tijara/core/consts/styles.dart';

Widget customButton({
  String? title,
  required VoidCallback? onPressed,
  required Color color,
  required Color textColor,
  required double width,
  required double height,
  Widget? child,
}) {
  return SizedBox(
    width: width,
    height: height,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      ),
      child: child ??
          (title != null
              ? title.text
              .fontFamily(medium)
              .size(15)
              .color(textColor)
              .make()
              : const SizedBox()),
    ),
  );
}
