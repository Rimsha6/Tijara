import 'package:tijara/widgets/chat_tile.dart';

final List<ChatModel> chats = [
  ChatModel(
    imgPath: 'Assets/images/profile_img.jpeg',
    title: 'Muhammad',
    lastMsg: 'Hey, how are you?',
    sendDate: DateTime(2025, 5, 13),
    sendTime: DateTime(0, 1, 1, 14, 30),
    onTap: () {  },
  ),
  ChatModel(
    imgPath: 'assets/user2.png',
    title: 'Khalifa',
    lastMsg: 'Let\'s meet tomorrow.',
    sendDate: DateTime(2025, 5, 13),
    sendTime: DateTime(0, 1, 1, 15, 10),
    onTap: () {  },
  ),
  ChatModel(
    imgPath: 'assets/user3.png',
    title: 'Ameer al Hassan',
    lastMsg: 'Thanks for the update!',
    sendDate: DateTime(2025, 5, 13),
    sendTime: DateTime(0, 1, 1, 16, 45),
    onTap: () {  },
  ),
];