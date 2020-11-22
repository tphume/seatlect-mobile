import 'dart:async';

import 'package:entity/entity.dart';

class UserRepo {
  User _user;
  final _controller = StreamController<User>();

  Stream<User> get user async* {
    yield _user;
    yield* _controller.stream;
  }

  Future<void> login() {
    return Future<void>(() => {});
  }

  void logout() {}

  void dispose() => _controller.close();
}

class MockUserRepo implements UserRepo {
  User _user;
  final _controller = StreamController<User>();

  Stream<User> get user async* {
    yield _user;
    yield* _controller.stream;
  }

  Future<void> login() {
    return Future<void>(() => {});
  }

  void logout() {}

  void dispose() => _controller.close();
}
