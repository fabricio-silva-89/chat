import 'package:chat/core/models/chat_message.dart';
import 'package:chat/core/models/chat_user.dart';
import 'package:chat/core/services/chat/chat_mock_service.dart';

abstract class ChatService {
  Future<ChatMessage> save(String text, ChatUser user);
  Stream<List<ChatMessage>> messagesStream();

  factory ChatService() {
    return ChatMockService();
  }
}
