import 'package:flutter/material.dart';

import 'package:seatlect_mobile/app.dart';
import 'package:user_repository/user_repository.dart';

// Development version of the application - uses mock repository
void main() {
  // Setup repository
  final userRepo = MockUserRepo();

  runApp(App(
    userRepo: userRepo,
  ));
}
