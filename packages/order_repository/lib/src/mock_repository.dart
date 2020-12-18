import 'dart:async';

import 'order_repository.dart';
import 'package:entity/entity.dart';
import 'package:genproto/genproto.dart' as api;

class MockOrderRepository implements OrderRepository {
  // Client for calling gRPC endpoint - mock doesn't actually use this
  api.OrderServiceClient client;

  MockOrderRepository() {}

  Future<List<Order>> ListOrder(int limit, int page) async {
    await Future.delayed(Duration(seconds: 1));

    return [
      Order(
          id: '1',
          reservationId: '1',
          business: null,
          start: null,
          end: null,
          seats: null,
          preorder: null,
          totalPrice: null,
          status: null,
          extraSpace: null),
    ];
  }
}
