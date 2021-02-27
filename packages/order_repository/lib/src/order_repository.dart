import 'dart:async';
import 'dart:developer' as developer;

import 'package:meta/meta.dart';
import 'package:entity/entity.dart';
import 'package:genproto/genproto.dart' as api;
import 'package:token_manager/token_manager.dart';

class OrderRepo {
  TokenManager tokenManager;

  // Client for calling gRPC endpoint
  api.OrderServiceClient client;

  OrderRepo({@required this.client, @required this.tokenManager})
      : assert(client != null),
        assert(tokenManager != null);

  Future<List<Order>> ListOrder(int limit, int page) async {
    // Construct request object
    final request = api.ListOrderRequest()
      ..id = tokenManager.token
      ..limit = limit
      ..page = page;

    // Call endpoint
    try {
      final response = await client.listOrder(request);
      final orders =
          response.orders.map<Order>((o) => OrderProtoToEntity(o)).toList();

      return orders;
    } catch (e) {
      developer.log('non-gRPC error at login',
          time: DateTime.now(), name: 'UserRepo', error: e);

      rethrow;
    }
  }
}

// this parsing logic fucking sucks - hate this shit
Order OrderProtoToEntity(api.Order o) {
  return Order(
      id: o.id,
      reservationId: o.reservationId,
      businessId: o.business,
      start: DateTime.parse(o.start),
      end: DateTime.parse(o.end),
      seats: o.seats
          .map<Seat>(
              (s) => Seat(name: s.name, floor: 0, space: s.space, x: 0, y: 0))
          .toList(),
      status: o.status,
      image: o.image,
      extraSpace: o.extraSpace,
      name: o.name);
}
