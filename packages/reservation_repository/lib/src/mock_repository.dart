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
      DateTime start, DateTime end) async {
    await Future.delayed(Duration(seconds: 1));

    return [
      Reservation(
          id: "137",
          businessId: "1",
          name: "PogChampBurger",
          start: DateTime.parse('2021-06-01T20:00:00+0700'),
          end: DateTime.parse('2021-06-01T23:00:00+0700'),
          placement: [],
          image: 'https://i.imgur.com/rXjqn0y.jpeg'),
      Reservation(
          id: "138",
          businessId: "1",
          name: "PogChampBurger",
          start: DateTime.parse('2021-06-02T20:00:00+0700'),
          end: DateTime.parse('2021-06-02T23:00:00+0700'),
          placement: [],
          image: 'https://i.imgur.com/rXjqn0y.jpeg'),
      Reservation(
          id: "139",
          businessId: "1",
          name: "PogChampBurger",
          start: DateTime.parse('2021-06-03T20:00:00+0700'),
          end: DateTime.parse('2021-06-03T23:00:00+0700'),
          placement: [],
          image: 'https://i.imgur.com/rXjqn0y.jpeg')
    ];
  }
}
