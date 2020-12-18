import 'dart:async';
import 'dart:developer' as developer;

import 'package:meta/meta.dart';
import 'package:entity/entity.dart';
import 'package:genproto/genproto.dart' as api;

class OrderRepository {
  // Client for calling gRPC endpoint
  api.OrderServiceClient client;

  OrderRepository({@required this.client}) : assert(client != null);

  Future<List<Order>> ListOrder(int limit, int page) async {
    // Construct request object
    final request = api.ListOrderRequest()
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
      business: Business(
          id: o.business.id,
          name: o.business.name,
          tags: o.business.tags,
          description: o.business.description,
          location: Location(
              latitude: o.business.location.latitude,
              longitude: o.business.location.longitude),
          address: o.business.address,
          displayImage: o.business.displayImage,
          images: o.business.images,
          menu: o.business.menu
              .map<MenuItem>((i) => MenuItem(
                  name: i.name,
                  description: i.description,
                  image: i.image,
                  price: i.price))
              .toList()),
      start: DateTime.parse(o.start),
      end: DateTime.parse(o.end),
      seats: o.seats
          .map<Seat>((s) => Seat(
              name: s.name,
              floor: 0,
              space: s.space,
              price: s.price,
              x: 0,
              y: 0))
          .toList(),
      preorder: o.preorder.map<Preorder>((p) => Preorder(
          name: p.name,
          description: p.description,
          image: p.image,
          price: p.price,
          quantity: p.quantity)),
      totalPrice: o.totalPrice,
      status: o.status,
      extraSpace: o.extraSpace);
}
