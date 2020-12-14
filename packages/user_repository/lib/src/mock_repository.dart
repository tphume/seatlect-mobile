import 'dart:async';
import 'package:entity/entity.dart';
import 'package:genproto/genproto.dart' as api;

import 'user_repository.dart';
import 'user_exception.dart';

class MockUserRepo implements UserRepo {
  StreamController<String> tokenController;

  // Client for calling gRPC endpoint - mock doesn't actually use this
  api.UserServiceClient client;

  MockUserRepo() {}

  Future<User> login(String username, String password) async {
    await Future.delayed(Duration(seconds: 1));

    // Uncomment this to test auth failure snackbar
    // throw AuthFail();

    // Uncomment this to test network error snackbar
    // throw FormatException();

    return User(
        username: 'Jiaroach',
        dob: new DateTime.utc(1999, 2, 25),
        avatar: 'assets/avatar01.png',
        preference: ['BEER', 'BURGER', 'JAPANESE'],
        favorite: ['1', '2']);
  }

  void logout() {}
}
