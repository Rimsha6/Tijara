import 'package:flutter/material.dart';
import 'package:tijara/consts/colors.dart';
import 'package:velocity_x/velocity_x.dart';
import '../consts/styles.dart';

class LocationDropdown extends StatefulWidget {
  final Color backgroundColor;
  final Color hintTextColor;
  const LocationDropdown(
      { Key? key,
        this.backgroundColor= white,
        this.hintTextColor= grey,
      }): super (key:key);
  @override
  _LocationDropdownState createState() => _LocationDropdownState();
}
class _LocationDropdownState extends State<LocationDropdown> {
  String? selectedLocation;
  final List<String> ksaLocations = [
    'Riyadh', 'Jeddah', 'Mecca', 'Medina', 'Dammam', 'Khobar', 'Tabuk',
    'Abha', 'Hail', 'Buraydah', 'Najran', 'Sakaka', 'Al Bahah', 'Yanbu',
    'Al Hofuf', 'Jazan', 'Arar', 'Al Qassim', 'Taif', 'Al Khafji'
    // Add more if needed
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: widget.backgroundColor,
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedLocation,
                hint: Row(
                  children: [
                    Icon(Icons.location_on_outlined, color: Colors.green),
                    SizedBox(width: 8),
                    "Select Location".text.fontFamily(medium).color(widget.hintTextColor).make(),
                  ],
                ),
                isExpanded: true,
                icon: Icon(Icons.arrow_drop_down),
                items: ksaLocations.map((location) {
                  return DropdownMenuItem<String>(
                    value: location,
                    child: location.text.fontFamily(medium).make(),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedLocation = value;
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
