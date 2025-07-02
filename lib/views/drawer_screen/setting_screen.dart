import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tijara/core/consts/styles.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/consts/colors.dart';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = false; // false = light, true = dark

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: green,
        leading: BackButton(color: white),
        title: Text(
          "Settings",
          style: TextStyle(fontSize: 18, color: white,fontFamily: medium),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Container(
              color: white,
              width: screenWidth,
              height: screenHeight * 0.1,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Theme',
                      style: TextStyle(fontSize: 18, color: green,fontFamily: medium),
                    ),
                    Row(
                      children: [
                        Text(
                          'Light Mode',
                          style: TextStyle(fontSize: 12.5, color: black,fontFamily: medium),
                        ),
                        SizedBox(width: 6),
                        Switch.adaptive(
                          value: isDarkMode,
                          onChanged: (value) {
                            setState(() {
                              isDarkMode = value;
                            });
                          },
                          activeColor: green,
                          inactiveTrackColor: Colors.grey.shade400,
                        ),
                        SizedBox(width: 6),
                        Text(
                          'Dark Mode',
                          style: TextStyle(fontSize: 12.5, color: black,fontFamily: medium),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

