import 'package:flutter/material.dart';

import '../core/models/chat_message.dart';
import '../core/services/auth/auth_service.dart';
import '../core/services/chat/chat_service.dart';
import 'message_bubble.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = AuthService().currentUser;

    return StreamBuilder<List<ChatMessage>>(
      stream: ChatService().messagesStream(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('Sem Dados. Vamos conversar?'),
          );
        } else {
          final msg = snapshot.data!;
          return ListView.builder(
            itemCount: msg.length,
            itemBuilder: (ctx, index) {
              return MessageBubble(
                key: ValueKey(msg[index].id),
                message: msg[index],
                belongsToCurrentUser: currentUser?.id == msg[index].userId,
              );
            },
          );
        }
      },
    );
  }
}
