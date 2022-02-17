import '../../models/chat_message.dart';
import '../../models/chat_user.dart';
import 'chat_mock_service.dart';

abstract class ChatService {
  Future<ChatMessage> save(String text, ChatUser user);
  Stream<List<ChatMessage>> messagesStream();

  factory ChatService() {
    return ChatMockService();
  }
}
