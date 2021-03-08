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
Reservation ReservationProtoToEntity(api.Reservation r) {}

ReservationSeat ReservationSeatProtoToEntity(api.ReservationSeat rs) {}
