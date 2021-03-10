import 'dart:developer' as developer;

import 'package:business_repository/business_repository.dart';
import 'package:flutter/material.dart';
import 'package:genproto/genproto.dart';
import 'package:grpc/grpc.dart';
import 'package:order_repository/order_repository.dart';
import 'package:reservation_repository/reservation_repository.dart';

import 'package:seatlect_mobile/app.dart';
import 'package:token_manager/token_manager.dart';
import 'package:user_repository/user_repository.dart';

// Production version of the application
void main() async {
  // Get configurations from environment
  const host = String.fromEnvironment('HOST');
  if (host.isEmpty) {
    developer.log('missing gRPC hostname', time: DateTime.now(), name: 'main');
    return;
  }

  int port;
  try {
    const tmp = String.fromEnvironment('PORT');
    port = int.parse(tmp);
  } catch (e) {
    developer.log('invalid gRPC port ',
        time: DateTime.now(), name: 'main', error: e);
    return;
  }

  // Configure gRPC client channel
  final channel = ClientChannel(host,
      port: port,
      options:
      const ChannelOptions(credentials: ChannelCredentials.insecure()));
  final tokenManager = TokenManager();

  // Setup repository and clients
  // TODO: Add interceptor or MetadataProvider
  final userClient = UserServiceClient(channel,
      options: CallOptions(timeout: Duration(seconds: 15)));
  final userRepo = UserRepo(client: userClient, tokenManager: tokenManager);

  // TODO: Add interceptor or MetadataProvider
  final businessClient = BusinessServiceClient(channel,
      options: CallOptions(timeout: Duration(seconds: 15)));
  final businessRepo =
  BusinessRepo(client: businessClient, tokenManager: tokenManager);

  // TODO: Add interceptor or MetadataProvider
  final orderClient = OrderServiceClient(channel,
      options: CallOptions(timeout: Duration(seconds: 15)));
  final orderRepo = OrderRepo(client: orderClient, tokenManager: tokenManager);

  final resClient = ReservationServiceClient(channel,
      options: CallOptions(timeout: Duration(seconds: 15)));
  final resRepo = ReservationRepo(client: resClient, tokenManager: tokenManager)

  // Start Flutter app
  runApp(App(
    userRepo: userRepo,
    businessRepo: businessRepo,
    orderRepo: orderRepo,
    resRepo: resRepo,
  ));

  // Cleanup
  await channel.shutdown();
}
