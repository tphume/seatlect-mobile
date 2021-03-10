import 'package:business_repository/business_repository.dart';
import 'package:flutter/material.dart';
import 'package:order_repository/order_repository.dart';
import 'package:reservation_repository/reservation_repository.dart';

import 'package:seatlect_mobile/app.dart';
import 'package:user_repository/user_repository.dart';

// Development version of the application - uses mock repository
void main() {
  // Setup repository
  final userRepo = MockUserRepo();
  final businessRepo = MockBusinessRepo();
  final orderRepo = MockOrderRepo();
  final resRepo = MockReservationRepo();

  runApp(App(
    userRepo: userRepo,
    businessRepo: businessRepo,
    orderRepo: orderRepo,
    resRepo: resRepo,
  ));
}
