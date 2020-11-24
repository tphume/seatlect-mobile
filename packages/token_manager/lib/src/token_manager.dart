import 'dart:async';

import 'package:grpc/grpc.dart';

class TokenManager extends ClientInterceptor {
  Map<String, String> metadata = {};

  // For other components to update the jwt token if needed
  final controller = StreamController<String>();

  TokenManager() {
    controller.stream.listen((event) {
      if (event == null) {
        return;
      }

      this.metadata = {'jwt': event};
    });
  }

  void dispose() => controller.close();
}
