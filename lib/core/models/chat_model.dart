class ChatMessage {
  final String senderId, receiverId, message;
  final DateTime timestamp;

  ChatMessage({
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() => {
    'senderId': senderId,
    'receiverId': receiverId,
    'message': message,
    'timestamp': timestamp.millisecondsSinceEpoch,
  };

  factory ChatMessage.fromJson(Map<String, dynamic> map) => ChatMessage(
    senderId: map['senderId'],
    receiverId: map['receiverId'],
    message: map['message'],
    timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp']),
  );
}
