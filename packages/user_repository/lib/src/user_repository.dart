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

  Future<void> AddFavorite(String id) async {
    // Construct request
    final request = api.AddFavoriteRequest()..businessId = id;

    // Call api
    try {
      final response = await client.addFavorite(request);
      return;
    } catch (e) {
      developer.log('non-gRPC error at add favorite',
          time: DateTime.now(), name: 'UserRepo', error: e);

      rethrow;
    }
  }

  Future<void> RemoveFavorite(String id) async {
    // Construct request
    final request = api.RemoveFavoriteRequest()..businessId = id;

    // Call api
    try {
      final response = await client.removeFavorite(request);
      return;
    } catch (e) {
      developer.log('non-gRPC error at remove favorite',
          time: DateTime.now(), name: 'UserRepo', error: e);

      rethrow;
    }
  }
}
