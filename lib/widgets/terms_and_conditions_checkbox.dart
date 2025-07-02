import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/consts/colors.dart';
import '../core/consts/styles.dart';

class TermsAndConditionsCheckBox extends StatefulWidget {
  @override
  State<TermsAndConditionsCheckBox> createState()=>_TermsAndConditionsCheckBoxState();
}
class _TermsAndConditionsCheckBoxState extends State<TermsAndConditionsCheckBox>{
  bool? termsAccepted=false;
  @override
  Widget build(BuildContext context) {
   return Row(
     children: [
       Checkbox(
         value: termsAccepted,
         onChanged: (val) {
           setState(() {
             termsAccepted = val!;
           });
         },
       ),
       Expanded(
         child: GestureDetector(
           onTap: () {
             showDialog(
               context: context,
               builder: (context) => AlertDialog(
                 title: Text("Terms & Conditions"),
                 content: SingleChildScrollView(
                   child: Text(
                     "These are the terms and conditions for posting an ad on this platform. By agreeing, you accept that your content must follow community guidelines, and you are responsible for the validity of your listing, etc.",
                   ),
                 ),
                 actions: [
                   TextButton(
                     child: Text("Close"),
                     onPressed: () => Navigator.of(context).pop(),
                   ),
                 ],
               ),
             );
           },
           child: Text.rich(
             TextSpan(
               text: "I agree to the ",
               style: TextStyle(fontFamily: medium, color: black),
               children: [
                 TextSpan(
                   text: "terms & conditions",
                   style: TextStyle(
                     color: green,
                     decoration: TextDecoration.underline,
                   ),
                 ),
               ],
             ),
           ),
         ),
       ),
     ],
   );
  }
}