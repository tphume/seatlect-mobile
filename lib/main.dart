import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:genproto/genproto.dart';
import 'package:grpc/grpc.dart';

import 'package:seatlect_mobile/app.dart';
import 'package:token_manager/token_manager.dart';
import 'package:user_repository/user_repository.dart';

// Production version of the application
void main() async {
  // Get configurations from environment
  final host = String.fromEnvironment('HOST');
  if (host.isEmpty) {
    dev.log('missing gRPC hostname', time: DateTime.now(), name: 'main');
    return;
  }

  int port;
  try {
    port = int.parse(String.fromEnvironment('PORT'));
  } catch (e) {
    dev.log('invalid gRPC port ', time: DateTime.now(), name: 'main', error: e);
    return;
  }

  // Configure gRPC client channel
  final channel = ClientChannel(host, port: port);
  final tokenManager = TokenManager();

  // Setup repository and clients
  // TODO: Add interceptor or MetadataProvider
  final userClient = UserServiceClient(channel);
  final userRepo =
      UserRepo(client: userClient, tokenController: tokenManager.controller);

  // Start Flutter app
  runApp(App(
    userRepo: userRepo,
  ));

  // Cleanup
  await channel.shutdown();
}
