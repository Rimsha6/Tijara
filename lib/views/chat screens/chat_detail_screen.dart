import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tijara/widgets_common/customt_textfield.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../consts/colors.dart';
import '../../consts/styles.dart';

class ChatDetailScreen extends StatefulWidget{
  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth=MediaQuery.of(context).size.width;
    final screenHeight=MediaQuery.of(context).size.height;
    final List<Map<String, dynamic>> messages = [
      {'fromMe': false, 'text': 'Hey! How are you?'},
      {'fromMe': true, 'text': 'I’m good, thanks!z You?'},
      {'fromMe': false, 'text': 'Doing well!'},
      {'fromMe': false, 'text': "Hey! Just wanted to check in and see how everything's going on your end. It’s been a while since we last caught up, and I figured it would be nice to reconnect. Let me know how you've been and if you're free sometime this week to grab coffee or just chat over a call. No pressure — totally up to you! 😊"},
    ];
   return Scaffold(
     appBar: AppBar(
       elevation: 1,
       backgroundColor: green,
       leading:BackButton(color: white,),
       title:
           ListTile(
             leading:CircleAvatar(
               backgroundImage: AssetImage("Assets/images/profile_img.jpeg"),
             ),
             title: "Muhammad".text.color(white).fontFamily(bold).make(),
             subtitle: "Last Active 3:30 PM 20,May,2023".text.color(lightGrey).size(12).fontFamily(medium).make(),
           ),
     ),
  body:   Column(
       children: [
         Expanded(
           child: ListView.builder(
             padding: const EdgeInsets.all(20),
             itemCount: messages.length,
             itemBuilder: (context, index) {
               final msg = messages[index];
               final bool fromMe = msg['fromMe'] as bool;
               final String text = msg['text'] as String;
               return Align(
                 alignment: msg['fromMe']!
                     ? Alignment.centerRight
                     : Alignment.centerLeft,
                 child: Container(
                   margin: const EdgeInsets.symmetric(vertical: 6),
                   padding:
                   const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                   decoration: BoxDecoration(
                     color: msg['fromMe']!
                         ? green
                         : Colors.grey.shade300,
                     borderRadius: BorderRadius.circular(12),
                   ),
                   child: Text(
                     msg['text']!,
                     style: TextStyle(
                       color: msg['fromMe']! ? Colors.white : Colors.black,
                       fontFamily: medium,
                     ),
                   ),
                 ),
               );
             },
           ),
         ),
         // Message input
         Padding(
           padding: const EdgeInsets.all(14.0),
           child: Container(
             padding:
             const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
             decoration: BoxDecoration(
               color: Colors.grey.shade200,
               borderRadius: BorderRadius.circular(40),
               border: Border.all(color: Colors.grey.shade400, ),
             ),
             child: Row(
               children: [
                 Expanded(
                   child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Type a message",
                      hintStyle: TextStyle(
                        fontFamily: medium,
                        color: fontGrey,
                      ),
                      border: InputBorder.none,
                    ),
                   ),
                 ),
                 IconButton(
                   icon: const Icon(Icons.send, color: green),
                   onPressed: () {
                     // Handle sending a message
                   },
                 ),
               ],
             ),
           ),
         ),
       ],
     ),
   );
  }
}