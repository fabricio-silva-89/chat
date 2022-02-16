import 'package:flutter/material.dart';

import 'package:chat/core/models/chat_message.dart';

class MessageBubble extends StatelessWidget {
  final ChatMessage message;
  final bool belongsToCurrentUser;

  const MessageBubble({
    Key? key,
    required this.message,
    required this.belongsToCurrentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: belongsToCurrentUser
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: belongsToCurrentUser
                ? Colors.grey.shade300
                : Theme.of(context).accentColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          width: 180,
          child: Column(
            children: [
              Text(
                message.userName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: belongsToCurrentUser ? Colors.black : Colors.white,
                ),
              ),
              Text(
                message.text,
                style: TextStyle(
                  color: belongsToCurrentUser ? Colors.black : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
