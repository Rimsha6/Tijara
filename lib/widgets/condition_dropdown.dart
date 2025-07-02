import 'package:flutter/cupertino.dart';
import 'package:tijara/core/consts/colors.dart';
import 'package:tijara/core/consts/styles.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class ConditionDropdown extends StatefulWidget{
  @override
  State<ConditionDropdown> createState() => _ConditionDropdownState();
}

class _ConditionDropdownState extends State<ConditionDropdown> {
  String? selectedCondition;
  List<String> condition=[
    "Used / Old", "Almost New", "New"
  ];
  @override
  Widget build(BuildContext context) {
   return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       4.heightBox,
       Text(
         "Condition",
         style: const TextStyle(
           fontSize: 17,
           fontFamily: 'semibold',
           color: green,
         ),
       ),
       const SizedBox(height: 8),
       Row(
         children: [
           Expanded(child:
           Container(
             padding: EdgeInsets.symmetric(horizontal: 12),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(30),
               color: lightGrey,
               border: Border.all(color: Colors.grey.shade300 ),
             ),
             child: DropdownButtonHideUnderline(
                 child: DropdownButton<String>(
                     hint: Row(
                       children: [
                         Icon(Icons.location_on_outlined, color: Colors.green),
                         SizedBox(width: 8),
                         "Select Condition".text.fontFamily(medium).color(grey).make(),
                       ],
                     ),
                   value: selectedCondition,
                     items: condition.map((eachCondition){
                       return DropdownMenuItem<String>(
                         value: eachCondition,
                         child: eachCondition.text.fontFamily(medium).make(),
                       );}
                     ).toList(),
                   onChanged: (value) {
                     setState(() {
                       selectedCondition = value;
                     });
                   },
                     )),
           )
           ),
         ],
       ),
10.heightBox,
     ],
   );
  }
}