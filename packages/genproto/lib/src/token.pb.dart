///
//  Generated code. Do not modify.
//  source: token.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class FetchTokenRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'FetchTokenRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'seatlect'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  FetchTokenRequest._() : super();
  factory FetchTokenRequest() => create();
  factory FetchTokenRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FetchTokenRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  FetchTokenRequest clone() => FetchTokenRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  FetchTokenRequest copyWith(void Function(FetchTokenRequest) updates) =>
      super.copyWith((message) => updates(
          message as FetchTokenRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchTokenRequest create() => FetchTokenRequest._();
  FetchTokenRequest createEmptyInstance() => create();
  static $pb.PbList<FetchTokenRequest> createRepeated() =>
      $pb.PbList<FetchTokenRequest>();
  @$core.pragma('dart2js:noInline')
  static FetchTokenRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FetchTokenRequest>(create);
  static FetchTokenRequest _defaultInstance;
}

class FetchTokenResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'FetchTokenResponse',
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

  FetchTokenResponse._() : super();
  factory FetchTokenResponse() => create();
  factory FetchTokenResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FetchTokenResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  FetchTokenResponse clone() => FetchTokenResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  FetchTokenResponse copyWith(void Function(FetchTokenResponse) updates) =>
      super.copyWith((message) => updates(
          message as FetchTokenResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchTokenResponse create() => FetchTokenResponse._();
  FetchTokenResponse createEmptyInstance() => create();
  static $pb.PbList<FetchTokenResponse> createRepeated() =>
      $pb.PbList<FetchTokenResponse>();
  @$core.pragma('dart2js:noInline')
  static FetchTokenResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FetchTokenResponse>(create);
  static FetchTokenResponse _defaultInstance;

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
