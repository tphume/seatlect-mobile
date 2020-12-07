import 'package:business_repository/business_repository.dart';
import 'package:flutter/material.dart';

import 'package:seatlect_mobile/app.dart';
import 'package:user_repository/user_repository.dart';

// Development version of the application - uses mock repository
void main() {
  // Setup repository
  final userRepo = MockUserRepo();
  final businessRepo = MockBusinessRepo();

  runApp(App(
    userRepo: userRepo,
    businessRepo: businessRepo,
  ));
}
