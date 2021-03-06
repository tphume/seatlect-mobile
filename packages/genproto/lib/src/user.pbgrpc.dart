///
//  Generated code. Do not modify.
//  source: user.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'user.pb.dart' as $0;
export 'user.pb.dart';

class UserServiceClient extends $grpc.Client {
  static final _$signIn =
      $grpc.ClientMethod<$0.SignInRequest, $0.SignInResponse>(
          '/seatlect.UserService/SignIn',
          ($0.SignInRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.SignInResponse.fromBuffer(value));
  static final _$signUp =
      $grpc.ClientMethod<$0.SignUpRequest, $0.SignUpResponse>(
          '/seatlect.UserService/SignUp',
          ($0.SignUpRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.SignUpResponse.fromBuffer(value));
  static final _$addFavorite =
      $grpc.ClientMethod<$0.AddFavoriteRequest, $0.AddFavoriteResponse>(
          '/seatlect.UserService/AddFavorite',
          ($0.AddFavoriteRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.AddFavoriteResponse.fromBuffer(value));
  static final _$removeFavorite =
      $grpc.ClientMethod<$0.RemoveFavoriteRequest, $0.RemoveFavoriteResponse>(
          '/seatlect.UserService/RemoveFavorite',
          ($0.RemoveFavoriteRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.RemoveFavoriteResponse.fromBuffer(value));

  UserServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options,
      $core.Iterable<$grpc.ClientInterceptor> interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.SignInResponse> signIn($0.SignInRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$signIn, request, options: options);
  }

  $grpc.ResponseFuture<$0.SignUpResponse> signUp($0.SignUpRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$signUp, request, options: options);
  }

  $grpc.ResponseFuture<$0.AddFavoriteResponse> addFavorite(
      $0.AddFavoriteRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$addFavorite, request, options: options);
  }

  $grpc.ResponseFuture<$0.RemoveFavoriteResponse> removeFavorite(
      $0.RemoveFavoriteRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$removeFavorite, request, options: options);
  }
}

abstract class UserServiceBase extends $grpc.Service {
  $core.String get $name => 'seatlect.UserService';

  UserServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SignInRequest, $0.SignInResponse>(
        'SignIn',
        signIn_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SignInRequest.fromBuffer(value),
        ($0.SignInResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SignUpRequest, $0.SignUpResponse>(
        'SignUp',
        signUp_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SignUpRequest.fromBuffer(value),
        ($0.SignUpResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.AddFavoriteRequest, $0.AddFavoriteResponse>(
            'AddFavorite',
            addFavorite_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.AddFavoriteRequest.fromBuffer(value),
            ($0.AddFavoriteResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RemoveFavoriteRequest,
            $0.RemoveFavoriteResponse>(
        'RemoveFavorite',
        removeFavorite_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RemoveFavoriteRequest.fromBuffer(value),
        ($0.RemoveFavoriteResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.SignInResponse> signIn_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SignInRequest> request) async {
    return signIn(call, await request);
  }

  $async.Future<$0.SignUpResponse> signUp_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SignUpRequest> request) async {
    return signUp(call, await request);
  }

  $async.Future<$0.AddFavoriteResponse> addFavorite_Pre($grpc.ServiceCall call,
      $async.Future<$0.AddFavoriteRequest> request) async {
    return addFavorite(call, await request);
  }

  $async.Future<$0.RemoveFavoriteResponse> removeFavorite_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.RemoveFavoriteRequest> request) async {
    return removeFavorite(call, await request);
  }

  $async.Future<$0.SignInResponse> signIn(
      $grpc.ServiceCall call, $0.SignInRequest request);
  $async.Future<$0.SignUpResponse> signUp(
      $grpc.ServiceCall call, $0.SignUpRequest request);
  $async.Future<$0.AddFavoriteResponse> addFavorite(
      $grpc.ServiceCall call, $0.AddFavoriteRequest request);
  $async.Future<$0.RemoveFavoriteResponse> removeFavorite(
      $grpc.ServiceCall call, $0.RemoveFavoriteRequest request);
}
