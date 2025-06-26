import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tijara/data/chat_model_data.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart';
import '../consts/colors.dart';
import '../consts/styles.dart';

class ChatTile extends StatelessWidget {
  final ChatModel chat;
  const ChatTile({Key? key, required this.chat}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('MMM dd').format(chat.sendDate); // e.g., May 13
    final formattedTime = DateFormat('hh:mm a').format(chat.sendTime); // e.g., 02:30 PM

    return InkWell(
      onTap: chat.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage(chat.imgPath),
            ),
            const SizedBox(width: 12),
            // Message info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and time
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                        chat. title,
                          style: const TextStyle(
                            fontFamily: bold,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        formattedTime,
                        style: TextStyle(
                          fontFamily: medium,
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  // Last message
                  Text(
                  chat. lastMsg,
                    style: TextStyle(
                      fontFamily: medium,
                      fontSize: 14,
                      color: Colors.grey.shade700,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    formattedDate,
                    style: TextStyle(
                      fontFamily: medium,
                    fontSize: 12,
                    color: Colors.grey.shade500,
                  ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
class ChatModel {
  final String imgPath;
  final String title;
  final VoidCallback onTap;
  final String lastMsg;
  final DateTime sendDate;
  final DateTime sendTime;

  const ChatModel({
    required this.imgPath,
    required this.title,
    required this.onTap,
    required this.lastMsg,
    required this.sendDate,
    required this.sendTime,
  });}