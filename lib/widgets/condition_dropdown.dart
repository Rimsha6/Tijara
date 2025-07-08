import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tijara/core/consts/colors.dart';
import 'package:tijara/core/consts/styles.dart';
import 'package:velocity_x/velocity_x.dart';

class ConditionDropdown extends StatefulWidget {
  final Function(String) onChanged; // <-- required parameter

  const ConditionDropdown({super.key, required this.onChanged});

  @override
  State<ConditionDropdown> createState() => _ConditionDropdownState();
}

class _ConditionDropdownState extends State<ConditionDropdown> {
  String? selectedCondition;

  final List<String> condition = [
    "Used / Old",
    "Almost New",
    "New"
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
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: lightGrey,
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: Row(
                      children: [
                        Icon(Icons.location_on_outlined, color: Colors.green),
                        SizedBox(width: 8),
                        "Select Condition"
                            .text
                            .fontFamily(medium)
                            .color(grey)
                            .make(),
                      ],
                    ),
                    value: selectedCondition,
                    isExpanded: true,
                    icon: Icon(Icons.arrow_drop_down),
                    items: condition.map((eachCondition) {
                      return DropdownMenuItem<String>(
                        value: eachCondition,
                        child: eachCondition.text.fontFamily(medium).make(),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCondition = value!;
                      });
                      widget.onChanged(value!); // Notify parent
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        10.heightBox,
      ],
    );
  }
}
