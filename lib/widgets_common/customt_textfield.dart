import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:tijara/core/consts/styles.dart';
import 'package:tijara/core/consts/colors.dart';

Widget customTextField({String? title, String? hint , controller, IconData? icon, bool iconOnRight=false,Color? color,int maxLines=1,}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (title != null) ...[
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontFamily: 'semibold',
            color: green,
          ),
        ),
        const SizedBox(height: 8),
      ],
      Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              maxLines: maxLines,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                  fontFamily: medium,
                  color: textFieldGrey,
                  fontSize: 14
                ),
                fillColor: color,
                filled: true,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                border:InputBorder.none,
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: darkFontGrey)),
                // Conditional icon position
                prefixIcon: icon != null && !iconOnRight
                    ? Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child:  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 20, maxHeight: 20),
                    child: Icon(icon,size: 20, color: darkFontGrey),
                  ),
                )
                    : null,
                suffixIcon:  icon != null && iconOnRight
                    ? Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 20, maxHeight: 20),
                    child: Icon(icon,size: 20, color: darkFontGrey),
                  ),
                )
                    : null,
              ),
            ),
          ),
        ],
      ),
12.heightBox,
    ],
  );
}