import 'dart:async';

import 'order_repository.dart';
import 'package:entity/entity.dart';
import 'package:genproto/genproto.dart' as api;

class MockOrderRepo implements OrderRepo {
  // Client for calling gRPC endpoint - mock doesn't actually use this
  api.OrderServiceClient client;

  MockOrderRepository() {}

  Future<List<Order>> ListOrder(int limit, int page) async {
    await Future.delayed(Duration(seconds: 1));

    return [
      Order(
          id: '1',
          reservationId: '2',
          businessId: "1",
          start: DateTime.parse('2020-12-27T20:00:00+0700'),
          end: DateTime.parse('2020-12-27T23:00:00+0700'),
          seats: [
            Seat(name: 'A10', floor: 0, space: 2, x: 0, y: 0),
            Seat(name: 'B10', floor: 0, space: 2, x: 0, y: 0)
          ],
          status: 'AVAILABLE',
          image: "https://i.imgur.com/g17EY2i.jpg",
          extraSpace: 0,
          name: "PogChampBurger"),
      Order(
          id: '1',
          reservationId: '1',
          businessId: "1",
          start: DateTime.parse('2020-12-18T20:00:00+0700'),
          end: DateTime.parse('2020-12-18T23:00:00+0700'),
          seats: [Seat(name: 'A10', floor: 0, space: 2, x: 0, y: 0)],
          status: 'USED',
          image: "https://i.imgur.com/g17EY2i.jpg",
          extraSpace: 0,
          name: "PogChampBurger"),
    ];
  }
}
