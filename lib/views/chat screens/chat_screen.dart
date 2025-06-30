import 'package:flutter/material.dart';
import 'package:tijara/widgets_common/bottom_nav_bar.dart';
import 'package:tijara/widgets_common/chat_tile.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/consts/colors.dart';
import '../../core/consts/styles.dart';
import '../../core/data/chat_model_data.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: lightGrey,
appBar: AppBar(title: "Chats".text.color(white).fontFamily(medium).size(18).make(),
centerTitle: true,
backgroundColor: green,
),
      body: Padding(padding: EdgeInsets.symmetric(vertical: 12,horizontal: 8),
      child:
      ListView.separated(
        itemCount: chats.length,
        separatorBuilder: (_, __) => SizedBox(height: screenHeight * 0.015),
        itemBuilder: (context, index) {
           return ChatTile(chat: chats[index]);
        },
      ),
             ),

      bottomNavigationBar: BottomNavBar(currentIndex: 3),
    );
  }
}
