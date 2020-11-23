import 'dart:async';

// Other components pushes update to the manager using this class type
class Token {
  final String refreshToken;
  final String jwtToken;

  Token(this.refreshToken, this.jwtToken);
}

class TokenManager {
  String _refreshToken = '';
  String _jwtToken = '';

  // For other components to update the jwt token if needed
  final controller = StreamController<Token>();

  TokenManager() {
    controller.stream.listen((event) {
      if (event == null) {
        return;
      }

      if (event.refreshToken?.isNotEmpty ?? false) {
        this._refreshToken = event.refreshToken;
      }

      if (event.jwtToken?.isNotEmpty ?? false) {
        this._jwtToken = event.jwtToken;
      }
    });
  }

  void dispose() => controller.close();
}
