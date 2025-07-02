import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:tijara/core/consts/styles.dart';
import 'package:tijara/core/consts/colors.dart';
Widget customTextField({
  String? title,
  String? hint,
  TextEditingController? controller,
  FormFieldValidator<String>? validator,
  IconData? icon,
  bool iconOnRight = false,
  Color? color,
  int maxLines = 1,
  Widget? suffixIcon,
  bool obscureText = false, // 🔒 NEW PARAM
}) {
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
      TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obscureText, // 🔒 SET HERE
        maxLines: obscureText ? 1 : maxLines,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            fontFamily: medium,
            color: textFieldGrey,
            fontSize: 14,
          ),
          fillColor: color,
          filled: true,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: darkFontGrey),
          ),
          prefixIcon: icon != null && !iconOnRight
              ? Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 20, maxHeight: 20),
              child: Icon(icon, size: 20, color: darkFontGrey),
            ),
          )
              : null,
          suffixIcon: suffixIcon ??
              (icon != null && iconOnRight
                  ? Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 20, maxHeight: 20),
                  child: Icon(icon, size: 20, color: darkFontGrey),
                ),
              )
                  : null),
        ),
      ),
      12.heightBox,
    ],
  );
}

class CustomTextField extends StatelessWidget {
  final onChanged;
  final validator;
  final hintText;
  final initialValue;
  final enabled;
  final controller;
  final preFixIcon;
  final maxLine;
  final Iterable<String>? autofillHints;
  final bool obscureText;
  final bool readOnly;
  final textInputAction;
  final keyBoardType;
  final IconButton? suffixIcon;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;
  final bool isMultiline;
  final TextAlign textAlign;
  final List<TextInputFormatter>? inputFormatters;
  final String? prefixText;

  CustomTextField({
    this.isMultiline = false,
    this.preFixIcon,
    this.maxLine = 1,
    this.readOnly = false,
    this.autofillHints,
    this.onChanged,
    this.initialValue,
    this.controller,
    this.enabled = true,
    this.hintText,
    this.validator,
    this.obscureText = false,
    this.textInputAction,
    this.keyBoardType,
    this.suffixIcon,
    this.focusNode,
    this.onFieldSubmitted,
    EdgeInsets? contentPadding,
    this.textAlign = TextAlign.center,
    this.inputFormatters,
    this.prefixText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      textInputAction: textInputAction??TextInputAction.next,
      readOnly: readOnly,
      keyboardType: keyBoardType,
      onChanged: onChanged,
      validator: validator,
      controller: controller,
      maxLines: maxLine,
      obscureText: obscureText,
      autofillHints: autofillHints,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600
      ),
      onFieldSubmitted: onFieldSubmitted,
      inputFormatters: inputFormatters,
      // textAlign: textAlign,
      decoration: InputDecoration(
          filled: true,
          enabled: enabled,
          prefixText: prefixText,
          fillColor: Colors.white.withOpacity(0.05),
          hintText: hintText,
          border: InputBorder.none,
          prefixStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          labelStyle: const TextStyle( fontSize: 14,
              fontWeight: FontWeight.w400),
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 25, vertical: 10),
          enabledBorder: OutlineInputBorder(
            // borderSide: BorderSide(color: borderColor, width: 1),
            borderSide: const BorderSide(color: Colors.black38, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          hintStyle:  const TextStyle(fontSize: 14, color: Colors.grey),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: green, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffF7658B), width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffF7658B), width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          errorStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xffF7658B),
          ),
          suffixIcon: suffixIcon,
          prefixIcon: preFixIcon
      ),
    );
  }
}