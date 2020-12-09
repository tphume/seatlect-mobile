///
//  Generated code. Do not modify.
//  source: business.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Sort extends $pb.ProtobufEnum {
  static const Sort NAME_ASC = Sort._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'NAME_ASC');
  static const Sort NAME_DESC = Sort._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'NAME_DESC');
  static const Sort LOCATION_ASC = Sort._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'LOCATION_ASC');
  static const Sort LOCATION_DESC = Sort._(
      3,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'LOCATION_DESC');
  static const Sort PRICE_ASC = Sort._(
      4,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'PRICE_ASC');
  static const Sort PRICE_DESC = Sort._(
      5,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'PRICE_DESC');
  static const Sort DATE_ASC = Sort._(
      6,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'DATE_ASC');
  static const Sort DATE_DESC = Sort._(
      7,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'DATE_DESC');

  static const $core.List<Sort> values = <Sort>[
    NAME_ASC,
    NAME_DESC,
    LOCATION_ASC,
    LOCATION_DESC,
    PRICE_ASC,
    PRICE_DESC,
    DATE_ASC,
    DATE_DESC,
  ];

  static final $core.Map<$core.int, Sort> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static Sort valueOf($core.int value) => _byValue[value];

  const Sort._($core.int v, $core.String n) : super(v, n);
}
