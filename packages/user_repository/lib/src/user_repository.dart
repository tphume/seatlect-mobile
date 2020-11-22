import 'dart:async';
import 'package:meta/meta.dart';

import 'package:entity/entity.dart';
import 'package:genproto/genproto.dart' as api;

class UserRepo {
  // This is used to communicate with the presentation layer of the application
  User _user;

  // For pushing updates to the presentation layer
  final _controller = StreamController<User>();

  // Client for calling gRPC endpoint
  api.UserServiceClient client;

  UserRepo({@required this.client}) : assert(client != null);

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
  // This is used to communicate with the presentation layer of the application
  User _user;

  // For pushing updates to the presentation layer
  final _controller = StreamController<User>();

  // Client for calling gRPC endpoint - mock doesn't actually use this
  api.UserServiceClient client;

  MockUserRepo({@required this.client});

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
