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
  static final _$fetchJWT =
      $grpc.ClientMethod<$0.FetchJWTRequest, $0.FetchJWTResponse>(
          '/seatlect.TokenService/FetchJWT',
          ($0.FetchJWTRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.FetchJWTResponse.fromBuffer(value));

  TokenServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options,
      $core.Iterable<$grpc.ClientInterceptor> interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.FetchJWTResponse> fetchJWT($0.FetchJWTRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$fetchJWT, request, options: options);
  }
}

abstract class TokenServiceBase extends $grpc.Service {
  $core.String get $name => 'seatlect.TokenService';

  TokenServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.FetchJWTRequest, $0.FetchJWTResponse>(
        'FetchJWT',
        fetchJWT_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FetchJWTRequest.fromBuffer(value),
        ($0.FetchJWTResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.FetchJWTResponse> fetchJWT_Pre(
      $grpc.ServiceCall call, $async.Future<$0.FetchJWTRequest> request) async {
    return fetchJWT(call, await request);
  }

  $async.Future<$0.FetchJWTResponse> fetchJWT(
      $grpc.ServiceCall call, $0.FetchJWTRequest request);
}
