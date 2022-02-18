import 'dart:io';

import '../../models/chat_user.dart';
import 'auth_firebase_service.dart';
// import 'auth_mock_service.dart';

abstract class AuthService {
  // factory AuthService() => AuthMockService();
  factory AuthService() => AuthFirebaseService();

  ChatUser? get currentUser;

  Stream<ChatUser?> get userChanges;

  Future<void> signup(
    String name,
    String email,
    String password,
    File? image,
  );

  Future<void> login(
    String email,
    String password,
  );

  Future<void> logout();
}
