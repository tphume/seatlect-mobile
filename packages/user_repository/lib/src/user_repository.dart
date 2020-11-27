import 'dart:async';
import 'dart:developer' as developer;

import 'package:grpc/grpc.dart';
import 'package:meta/meta.dart';

import 'package:entity/entity.dart';
import 'package:genproto/genproto.dart' as api;

class UserRepo {
  // This is used to communicate with the presentation layer of the application
  User _user;

  // For pushing updates to the presentation layer
  final _controller = StreamController<User>();

  // Token manager stream used to push tokens on login
  StreamController<String> tokenController;

  // Client for calling gRPC endpoint
  api.UserServiceClient client;

  UserRepo({@required this.client, @required this.tokenController})
      : assert(client != null),
        assert(tokenController != null) {
    this._user = User.empty;
  }

  Stream<User> get user async* {
    yield _user;
    yield* _controller.stream;
  }

  Future<void> login(String username, String password) async {
    final request = api.SignInRequest()
      ..username = username
      ..password = password;

    try {
      final response = await this.client.signIn(request);
      final user = response.user;

      this._user = User(
          username: user.username,
          dob: DateTime.parse(user.dob),
          avatar: user.avatar,
          preference: user.preference,
          favorite: user.favorite.map<Business>((e) => Business(
              id: e.id,
              name: e.name,
              type: e.type,
              description: e.description,
              location: Location(
                  latitude: e.location.latitude,
                  longitude: e.location.longitude),
              address: e.address,
              displayImage: e.displayImage,
              images: e.images,
              menu: null)));

      this.tokenController.add(response.token);
      return this._controller.add(this._user);
    } on GrpcError catch (e) {
      // TODO Rethrow errors
      developer.log('gRPC error at login',
          time: DateTime.now(), name: 'UserRepo', error: e);
    } catch (e) {
      // TODO Rethrow errors
      developer.log('non-gRPC error at login',
          time: DateTime.now(), name: 'UserRepo', error: e);
    }

    this._user = User.empty;
    return this._controller.add(this._user);
  }

  void logout() {
    this._user = User.empty;
    this._controller.add(this._user);
    this.tokenController.add('');
  }

  void dispose() => _controller.close();
}

class MockUserRepo implements UserRepo {
  // This is used to communicate with the presentation layer of the application
  User _user;

  // For pushing updates to the presentation layer
  final _controller = StreamController<User>();

  StreamController<String> tokenController;

  // Client for calling gRPC endpoint - mock doesn't actually use this
  api.UserServiceClient client;

  MockUserRepo() {
    this._user = User.empty;
  }

  Stream<User> get user async* {
    yield _user;
    yield* _controller.stream;
  }

  Future<void> login(String username, String password) async {
    await Future.delayed(Duration(seconds: 1));

    this._user = User(
        username: 'Jiaroach',
        dob: new DateTime.utc(1999, 2, 25),
        avatar: 'assets/avatar01.png',
        preference: ['BEER', 'BURGER', 'JAPANESE'],
        favorite: []);

    this._controller.add(this._user);
  }

  void logout() {
    this._user = User.empty;
    this._controller.add(this._user);
  }

  void dispose() => _controller.close();
}
