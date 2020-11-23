import 'dart:async';

class TokenManager {
  Map<String, String> metadata = {};

  // For other components to update the jwt token if needed
  final controller = StreamController<String>();

  TokenManager() {
    controller.stream.listen((event) {
      if (event == null) {
        return;
      }

      if (event?.isNotEmpty ?? false) {
        this.metadata = {'jwt': event};
      }
    });
  }

  void dispose() => controller.close();
}
