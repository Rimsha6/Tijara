import 'dart:ui';

import 'package:flutter/material.dart';

import '../core/consts/colors.dart';
import '../core/consts/styles.dart';

class ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color iconColor;
  final Color textColor;

  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.iconColor = green,
    this.textColor = Colors.black,
  });
//widget to display buttons below the profile like change password, change username, log out etc.
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        tileColor: white,
        leading: Icon(icon, color: iconColor),
        title: Text(title, style: TextStyle(fontFamily: medium, fontSize: 15, color: textColor)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
