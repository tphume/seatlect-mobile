import 'dart:async';
import 'dart:developer' as developer;

import 'package:meta/meta.dart';

import 'package:token_manager/token_manager.dart';
import 'package:entity/entity.dart';
import 'package:genproto/genproto.dart' as api;

class ReservationRepo {
  TokenManager tokenManager;

  api.ReservationServiceClient client;

  ReservationRepo({@required this.client, @required this.tokenManager})
      : assert(client != null),
        assert(tokenManager != null);

  Future<List<Reservation>> ListReservation(
      DateTime start, DateTime end) async {
    final request = api.ListReservationRequest()
      ..start = start.toIso8601String()
      ..end = end.toIso8601String();

    // Call endpoint
    try {
      final response = await client.listReservation(request);
      final reservations =
          response.reservation.map((r) => ReservationProtoToEntity(r)).toList();

      return reservations;
    } catch (e) {
      developer.log('non-gRPC error at login',
          time: DateTime.now(), name: 'UserRepo', error: e);

      rethrow;
    }
  }
}

// Helper functions here
Reservation ReservationProtoToEntity(api.Reservation r) {
  return Reservation(
      id: r.id,
      businessId: r.businessId,
      name: r.name,
      start: DateTime.parse(r.start),
      end: DateTime.parse(r.end),
      placement:
          r.placement.map((rs) => ReservationSeatProtoToEntity(rs)).toList(),
      menu: r.menu.map((mi) => MenuItemProtoToEntity(mi)).toList(),
      image: r.image);
}

ReservationSeat ReservationSeatProtoToEntity(api.ReservationSeat rs) {
  return ReservationSeat(
      name: rs.name,
      floor: rs.floor,
      type: rs.type,
      space: rs.space,
      user: rs.user,
      status: rs.status,
      x: rs.x,
      y: rs.y,
      width: rs.width,
      height: rs.height,
      rotation: rs.rotation);
}

MenuItem MenuItemProtoToEntity(api.MenuItem mi) {
  return MenuItem(
      name: mi.name,
      description: mi.description,
      image: mi.image,
      price: mi.price);
}
