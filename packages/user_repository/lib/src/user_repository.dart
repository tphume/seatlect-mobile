import 'dart:async';
import 'dart:developer' as developer;

import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_connection_interface.dart';
import 'package:meta/meta.dart';

import 'user_exception.dart';
import 'package:entity/entity.dart';
import 'package:genproto/genproto.dart' as api;

class UserRepo {
  // Token manager stream used to push tokens on login
  StreamController<String> tokenController;

  // Client for calling gRPC endpoint
  api.UserServiceClient client;

  UserRepo({@required this.client, @required this.tokenController})
      : assert(client != null),
        assert(tokenController != null);

  Future<User> login(String username, String password) async {
    final request = api.SignInRequest()
      ..username = username
      ..password = password;

    try {
      final response = await this.client.signIn(request);
      final user = response.user;

      final userEntity = User(
          username: user.username,
          dob: DateTime.parse(user.dob),
          avatar: user.avatar,
          preference: user.preference,
          favorite: user.favorite);

      this.tokenController.add(response.token);
      return userEntity;
    } on GrpcError catch (e) {
      developer.log('gRPC error at login',
          time: DateTime.now(), name: 'UserRepo', error: e);

      if (e.codeName == StatusCode.unauthenticated) {
        throw AuthFail();
      }

      rethrow;
    } catch (e) {
      developer.log('non-gRPC error at login',
          time: DateTime.now(), name: 'UserRepo', error: e);

      rethrow;
    }
  }

  void logout() {
    this.tokenController.add('');
  }
}

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
