///
//  Generated code. Do not modify.
//  source: business.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'common.pb.dart' as $1;

import 'business.pbenum.dart';

export 'business.pbenum.dart';

class ListBusinessRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ListBusinessRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'seatlect'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'limit',
        $pb.PbFieldType.O3)
    ..e<Sort>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sort',
        $pb.PbFieldType.OE,
        defaultOrMaker: Sort.NAME_ASC,
        valueOf: Sort.valueOf,
        enumValues: Sort.values)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..pPS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tags')
    ..aOM<$1.Latlng>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'location', subBuilder: $1.Latlng.create)
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'startPrice', $pb.PbFieldType.O3, protoName: 'startPrice')
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'endPrice', $pb.PbFieldType.O3, protoName: 'endPrice')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'startDate', protoName: 'startDate')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'endDate', protoName: 'endDate')
    ..hasRequiredFields = false;

  ListBusinessRequest._() : super();
  factory ListBusinessRequest() => create();
  factory ListBusinessRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ListBusinessRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ListBusinessRequest clone() => ListBusinessRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ListBusinessRequest copyWith(void Function(ListBusinessRequest) updates) =>
      super.copyWith((message) => updates(
          message as ListBusinessRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListBusinessRequest create() => ListBusinessRequest._();
  ListBusinessRequest createEmptyInstance() => create();
  static $pb.PbList<ListBusinessRequest> createRepeated() =>
      $pb.PbList<ListBusinessRequest>();
  @$core.pragma('dart2js:noInline')
  static ListBusinessRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListBusinessRequest>(create);
  static ListBusinessRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get limit => $_getIZ(0);
  @$pb.TagNumber(1)
  set limit($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLimit() => $_has(0);
  @$pb.TagNumber(1)
  void clearLimit() => clearField(1);

  @$pb.TagNumber(2)
  Sort get sort => $_getN(1);
  @$pb.TagNumber(2)
  set sort(Sort v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSort() => $_has(1);
  @$pb.TagNumber(2)
  void clearSort() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.String> get tags => $_getList(3);

  @$pb.TagNumber(5)
  $1.Latlng get location => $_getN(4);
  @$pb.TagNumber(5)
  set location($1.Latlng v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasLocation() => $_has(4);
  @$pb.TagNumber(5)
  void clearLocation() => clearField(5);
  @$pb.TagNumber(5)
  $1.Latlng ensureLocation() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.int get startPrice => $_getIZ(5);
  @$pb.TagNumber(6)
  set startPrice($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasStartPrice() => $_has(5);
  @$pb.TagNumber(6)
  void clearStartPrice() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get endPrice => $_getIZ(6);
  @$pb.TagNumber(7)
  set endPrice($core.int v) {
    $_setSignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasEndPrice() => $_has(6);
  @$pb.TagNumber(7)
  void clearEndPrice() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get startDate => $_getSZ(7);
  @$pb.TagNumber(8)
  set startDate($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasStartDate() => $_has(7);
  @$pb.TagNumber(8)
  void clearStartDate() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get endDate => $_getSZ(8);
  @$pb.TagNumber(9)
  set endDate($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasEndDate() => $_has(8);
  @$pb.TagNumber(9)
  void clearEndDate() => clearField(9);
}

class ListBusinessResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ListBusinessResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'seatlect'),
      createEmptyInstance: create)
    ..pc<$1.Business>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'businesses',
        $pb.PbFieldType.PM,
        subBuilder: $1.Business.create)
    ..hasRequiredFields = false;

  ListBusinessResponse._() : super();
  factory ListBusinessResponse() => create();
  factory ListBusinessResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ListBusinessResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ListBusinessResponse clone() =>
      ListBusinessResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ListBusinessResponse copyWith(void Function(ListBusinessResponse) updates) =>
      super.copyWith((message) => updates(
          message as ListBusinessResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListBusinessResponse create() => ListBusinessResponse._();
  ListBusinessResponse createEmptyInstance() => create();
  static $pb.PbList<ListBusinessResponse> createRepeated() =>
      $pb.PbList<ListBusinessResponse>();
  @$core.pragma('dart2js:noInline')
  static ListBusinessResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListBusinessResponse>(create);
  static ListBusinessResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.Business> get businesses => $_getList(0);
}

class ListBusinessByIdRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ListBusinessByIdRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'seatlect'),
      createEmptyInstance: create)
    ..pPS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ids')
    ..hasRequiredFields = false;

  ListBusinessByIdRequest._() : super();
  factory ListBusinessByIdRequest() => create();
  factory ListBusinessByIdRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ListBusinessByIdRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ListBusinessByIdRequest clone() =>
      ListBusinessByIdRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ListBusinessByIdRequest copyWith(
          void Function(ListBusinessByIdRequest) updates) =>
      super.copyWith((message) => updates(
          message as ListBusinessByIdRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListBusinessByIdRequest create() => ListBusinessByIdRequest._();
  ListBusinessByIdRequest createEmptyInstance() => create();
  static $pb.PbList<ListBusinessByIdRequest> createRepeated() =>
      $pb.PbList<ListBusinessByIdRequest>();
  @$core.pragma('dart2js:noInline')
  static ListBusinessByIdRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListBusinessByIdRequest>(create);
  static ListBusinessByIdRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get ids => $_getList(0);
}

class ListBusinessByIdResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ListBusinessByIdResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'seatlect'),
      createEmptyInstance: create)
    ..pc<$1.Business>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'businesses',
        $pb.PbFieldType.PM,
        subBuilder: $1.Business.create)
    ..hasRequiredFields = false;

  ListBusinessByIdResponse._() : super();
  factory ListBusinessByIdResponse() => create();
  factory ListBusinessByIdResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ListBusinessByIdResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ListBusinessByIdResponse clone() =>
      ListBusinessByIdResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ListBusinessByIdResponse copyWith(
          void Function(ListBusinessByIdResponse) updates) =>
      super.copyWith((message) => updates(message
          as ListBusinessByIdResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListBusinessByIdResponse create() => ListBusinessByIdResponse._();
  ListBusinessByIdResponse createEmptyInstance() => create();
  static $pb.PbList<ListBusinessByIdResponse> createRepeated() =>
      $pb.PbList<ListBusinessByIdResponse>();
  @$core.pragma('dart2js:noInline')
  static ListBusinessByIdResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListBusinessByIdResponse>(create);
  static ListBusinessByIdResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.Business> get businesses => $_getList(0);
}
