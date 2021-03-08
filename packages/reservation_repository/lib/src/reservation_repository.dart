import 'dart:async';
import 'dart:developer' as developer;

import 'package:meta/meta.dart';

import 'package:token_manager/token_manager.dart';
import 'package:genproto/genproto.dart' as api;

class ReservationRepo {
  TokenManager tokenManager;

  api.ReservationServiceClient client;

  ReservationRepo({@required this.client, @required this.tokenManager})
      : assert(client != null),
        assert(tokenManager != null);
}
