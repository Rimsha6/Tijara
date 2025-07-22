import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/consts/colors.dart';
import '../../widgets/bottom_nav_bar.dart';
import 'chat_provider.dart';
import 'chat_screen.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChatProvider(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Inbox View", style: TextStyle(color: Colors.white)),
          backgroundColor: green,
        ),
        body: Consumer<ChatProvider>(
          builder: (context, provider, _) {
            return StreamBuilder<List<String>>(
              stream: provider.dbService.getInboxUserIds(provider.currentUserId),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator(color: green));
                }
                final userIds = snapshot.data!;
                if (userIds.isEmpty) {
                  return const Center(child: Text("No user chats yet."));
                }

                return ListView.separated(
                  padding: const EdgeInsets.all(12),
                  itemCount: userIds.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final userId = userIds[index];
                    return FutureBuilder<Map<String, dynamic>?>(
                      future: provider.dbService.getUserData(userId),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const ListTile(title: Text("Loading..."));
                        }
                        final data = snapshot.data!;
                        return Card(
                          elevation: 3,
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 25,
                              backgroundImage: data['profileImageUrl'] != null
                                  ? NetworkImage(data['profileImageUrl'])
                                  : null,
                              child: data['profileImageUrl'] == null
                                  ? const Icon(Icons.person)
                                  : null,
                            ),
                            title: Text(data['userName'] ?? "Unknown"),
                            subtitle: const Text("Tap to open chat"),
                            trailing: const Icon(Icons.chat_bubble_outline),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ChatScreen(
                                    userId: userId,
                                    userName: data['userName'] ?? 'User',
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                );
              },
            );
          },
        ),
        bottomNavigationBar: BottomNavBar(currentIndex: 3),

      ),
    );
  }
}
