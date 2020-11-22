///
//  Generated code. Do not modify.
//  source: token.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class FetchJWTRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'FetchJWTRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'seatlect'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  FetchJWTRequest._() : super();
  factory FetchJWTRequest() => create();
  factory FetchJWTRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FetchJWTRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  FetchJWTRequest clone() => FetchJWTRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  FetchJWTRequest copyWith(void Function(FetchJWTRequest) updates) =>
      super.copyWith((message) =>
          updates(message as FetchJWTRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchJWTRequest create() => FetchJWTRequest._();
  FetchJWTRequest createEmptyInstance() => create();
  static $pb.PbList<FetchJWTRequest> createRepeated() =>
      $pb.PbList<FetchJWTRequest>();
  @$core.pragma('dart2js:noInline')
  static FetchJWTRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FetchJWTRequest>(create);
  static FetchJWTRequest _defaultInstance;
}

class FetchJWTResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'FetchJWTResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'seatlect'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'jwtToken',
        protoName: 'jwtToken')
    ..hasRequiredFields = false;

  FetchJWTResponse._() : super();
  factory FetchJWTResponse() => create();
  factory FetchJWTResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FetchJWTResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  FetchJWTResponse clone() => FetchJWTResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  FetchJWTResponse copyWith(void Function(FetchJWTResponse) updates) =>
      super.copyWith((message) => updates(
          message as FetchJWTResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchJWTResponse create() => FetchJWTResponse._();
  FetchJWTResponse createEmptyInstance() => create();
  static $pb.PbList<FetchJWTResponse> createRepeated() =>
      $pb.PbList<FetchJWTResponse>();
  @$core.pragma('dart2js:noInline')
  static FetchJWTResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FetchJWTResponse>(create);
  static FetchJWTResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get jwtToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set jwtToken($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasJwtToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearJwtToken() => clearField(1);
}
