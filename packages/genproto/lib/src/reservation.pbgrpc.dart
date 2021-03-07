///
//  Generated code. Do not modify.
//  source: reservation.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'reservation.pb.dart' as $0;
export 'reservation.pb.dart';

class ReservationServiceClient extends $grpc.Client {
  static final _$listReservation =
      $grpc.ClientMethod<$0.ListReservationRequest, $0.ListReservationResponse>(
          '/seatlect.ReservationService/ListReservation',
          ($0.ListReservationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ListReservationResponse.fromBuffer(value));

  ReservationServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options,
      $core.Iterable<$grpc.ClientInterceptor> interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.ListReservationResponse> listReservation(
      $0.ListReservationRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$listReservation, request, options: options);
  }
}

abstract class ReservationServiceBase extends $grpc.Service {
  $core.String get $name => 'seatlect.ReservationService';

  ReservationServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ListReservationRequest,
            $0.ListReservationResponse>(
        'ListReservation',
        listReservation_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListReservationRequest.fromBuffer(value),
        ($0.ListReservationResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.ListReservationResponse> listReservation_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.ListReservationRequest> request) async {
    return listReservation(call, await request);
  }

  $async.Future<$0.ListReservationResponse> listReservation(
      $grpc.ServiceCall call, $0.ListReservationRequest request);
}
