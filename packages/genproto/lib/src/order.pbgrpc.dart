///
//  Generated code. Do not modify.
//  source: order.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'order.pb.dart' as $0;
export 'order.pb.dart';

class OrderServiceClient extends $grpc.Client {
  static final _$listOrder =
      $grpc.ClientMethod<$0.ListOrderRequest, $0.ListOrderResponse>(
          '/seatlect.OrderService/ListOrder',
          ($0.ListOrderRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ListOrderResponse.fromBuffer(value));

  OrderServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options,
      $core.Iterable<$grpc.ClientInterceptor> interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.ListOrderResponse> listOrder(
      $0.ListOrderRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$listOrder, request, options: options);
  }
}

abstract class OrderServiceBase extends $grpc.Service {
  $core.String get $name => 'seatlect.OrderService';

  OrderServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ListOrderRequest, $0.ListOrderResponse>(
        'ListOrder',
        listOrder_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListOrderRequest.fromBuffer(value),
        ($0.ListOrderResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.ListOrderResponse> listOrder_Pre($grpc.ServiceCall call,
      $async.Future<$0.ListOrderRequest> request) async {
    return listOrder(call, await request);
  }

  $async.Future<$0.ListOrderResponse> listOrder(
      $grpc.ServiceCall call, $0.ListOrderRequest request);
}
