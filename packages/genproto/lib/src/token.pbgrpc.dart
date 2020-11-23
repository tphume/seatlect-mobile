///
//  Generated code. Do not modify.
//  source: token.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'token.pb.dart' as $0;
export 'token.pb.dart';

class TokenServiceClient extends $grpc.Client {
  static final _$fetchToken =
      $grpc.ClientMethod<$0.FetchTokenRequest, $0.FetchTokenResponse>(
          '/seatlect.TokenService/FetchToken',
          ($0.FetchTokenRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.FetchTokenResponse.fromBuffer(value));

  TokenServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options,
      $core.Iterable<$grpc.ClientInterceptor> interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.FetchTokenResponse> fetchToken(
      $0.FetchTokenRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$fetchToken, request, options: options);
  }
}

abstract class TokenServiceBase extends $grpc.Service {
  $core.String get $name => 'seatlect.TokenService';

  TokenServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.FetchTokenRequest, $0.FetchTokenResponse>(
        'FetchToken',
        fetchToken_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FetchTokenRequest.fromBuffer(value),
        ($0.FetchTokenResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.FetchTokenResponse> fetchToken_Pre($grpc.ServiceCall call,
      $async.Future<$0.FetchTokenRequest> request) async {
    return fetchToken(call, await request);
  }

  $async.Future<$0.FetchTokenResponse> fetchToken(
      $grpc.ServiceCall call, $0.FetchTokenRequest request);
}
