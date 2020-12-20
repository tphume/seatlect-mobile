import 'dart:developer' as dev;

import 'package:business_repository/business_repository.dart';
import 'package:flutter/material.dart';
import 'package:genproto/genproto.dart';
import 'package:grpc/grpc.dart';
import 'package:order_repository/order_repository.dart';

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

  // TODO: Add interceptor or MetadataProvider
  final businessClient = BusinessServiceClient(channel);
  final businessRepo = BusinessRepo(client: businessClient);

  // TODO: Add interceptor or MetadataProvider
  final orderClient = OrderServiceClient(channel);
  final orderRepo = OrderRepo(client: orderClient);

  // Start Flutter app
  runApp(App(
    userRepo: userRepo,
    businessRepo: businessRepo,
    orderRepo: orderRepo,
  ));

  // Cleanup
  await channel.shutdown();
}
