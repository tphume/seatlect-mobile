///
//  Generated code. Do not modify.
//  source: common.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

const User$json = const {
  '1': 'User',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'dob', '3': 2, '4': 1, '5': 9, '10': 'dob'},
    const {'1': 'avatar', '3': 3, '4': 1, '5': 9, '10': 'avatar'},
    const {'1': 'preference', '3': 4, '4': 3, '5': 9, '10': 'preference'},
    const {
      '1': 'favorite',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.seatlect.Business',
      '10': 'favorite'
    },
  ],
};

const Business$json = const {
  '1': 'Business',
  '2': const [
    const {'1': '_id', '3': 1, '4': 1, '5': 12, '10': 'Id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'type', '3': 3, '4': 3, '5': 9, '10': 'type'},
    const {'1': 'description', '3': 4, '4': 1, '5': 9, '10': 'description'},
    const {
      '1': 'location',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.seatlect.Latlng',
      '10': 'location'
    },
    const {'1': 'address', '3': 6, '4': 1, '5': 9, '10': 'address'},
    const {'1': 'displayImage', '3': 7, '4': 1, '5': 9, '10': 'displayImage'},
    const {'1': 'images', '3': 8, '4': 3, '5': 9, '10': 'images'},
    const {
      '1': 'menu',
      '3': 9,
      '4': 3,
      '5': 11,
      '6': '.seatlect.MenuItem',
      '10': 'menu'
    },
  ],
};

const Latlng$json = const {
  '1': 'Latlng',
  '2': const [
    const {'1': 'latitude', '3': 1, '4': 1, '5': 1, '10': 'latitude'},
    const {'1': 'longitude', '3': 2, '4': 1, '5': 1, '10': 'longitude'},
  ],
};

const MenuItem$json = const {
  '1': 'MenuItem',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'image', '3': 3, '4': 1, '5': 9, '10': 'image'},
    const {'1': 'price', '3': 4, '4': 1, '5': 9, '10': 'price'},
  ],
};
