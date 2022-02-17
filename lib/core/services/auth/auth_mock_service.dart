import 'dart:async';
import 'dart:io';
import 'dart:math';

import '../../models/chat_user.dart';
import 'auth_service.dart';

class AuthMockService implements AuthService {
  static const _defaultUser = ChatUser(
    id: '1',
    name: 'Teste',
    email: 'teste@teste.com',
    imageUrl: 'assets/images/avatar.png',
  );

  static final Map<String, ChatUser> _users = {_defaultUser.email: _defaultUser};

  static ChatUser? _currentUser;

  static MultiStreamController<ChatUser?>? _controller;

  static final _userStream = Stream<ChatUser?>.multi((controller) {
    _controller = controller;
    _updateUser(_defaultUser);
  });

  @override
  ChatUser? get currentUser => _currentUser;

  @override
  Stream<ChatUser?> get userChanges => _userStream;

  @override
  Future<void> login(String email, String password) async {
    _updateUser(_users[email]);
  }

  @override
  Future<void> logout() async => _updateUser(null);

  @override
  Future<void> signup(
    String name,
    String email,
    String password,
    File? image,
  ) async {
    final newUser = ChatUser(
      id: Random().nextDouble().toString(),
      name: name,
      email: email,
      imageUrl: image?.path ?? 'assets/images/avatar.png',
    );

    _users.putIfAbsent(email, () => newUser);
    _updateUser(newUser);
  }

  static void _updateUser(ChatUser? user) {
    _currentUser = user;
    _controller?.add(_currentUser);
  }
}
