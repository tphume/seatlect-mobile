import 'dart:async';
import 'dart:developer' as developer;

import 'package:meta/meta.dart';
import 'package:reservation_repository/reservation_repository.dart';

import 'package:token_manager/token_manager.dart';
import 'package:entity/entity.dart';
import 'package:genproto/genproto.dart' as api;

class MockReservationRepo implements ReservationRepo {
  TokenManager tokenManager;

  api.ReservationServiceClient client;

  MockReservationRepo() {}

  Future<List<Reservation>> ListReservation(
      DateTime start, DateTime end) async {}
}
