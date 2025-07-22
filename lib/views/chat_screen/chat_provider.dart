import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../../core/models/chat_model.dart';
import '../../core/services/database_services.dart';

class ChatProvider with ChangeNotifier {
  final String currentUserId = FirebaseAuth.instance.currentUser!.uid;
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final dbService = DatabaseServices();


  /// Send Message Function >>>>
  void send(ChatProvider provider, userId) {
    final msg = messageController.text.trim();
    if (msg.isEmpty) return;

    final message = ChatMessage(
      senderId: currentUserId,
      receiverId: userId,
      message: msg,
      timestamp: DateTime.now(),
    );

    dbService.sendMessage(message);
    messageController.clear();

    Future.delayed(const Duration(milliseconds: 100), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          0.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }
}

