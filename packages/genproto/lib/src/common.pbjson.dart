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
    const {'1': 'favorite', '3': 4, '4': 3, '5': 9, '10': 'favorite'},
  ],
};

const Business$json = const {
  '1': 'Business',
  '2': const [
    const {'1': '_id', '3': 1, '4': 1, '5': 9, '10': 'Id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'type', '3': 3, '4': 1, '5': 9, '10': 'type'},
    const {'1': 'tags', '3': 4, '4': 3, '5': 9, '10': 'tags'},
    const {'1': 'description', '3': 5, '4': 1, '5': 9, '10': 'description'},
    const {
      '1': 'location',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.seatlect.Latlng',
      '10': 'location'
    },
    const {'1': 'address', '3': 7, '4': 1, '5': 9, '10': 'address'},
    const {'1': 'displayImage', '3': 8, '4': 1, '5': 9, '10': 'displayImage'},
    const {'1': 'images', '3': 9, '4': 3, '5': 9, '10': 'images'},
    const {
      '1': 'menu',
      '3': 10,
      '4': 3,
      '5': 11,
      '6': '.seatlect.MenuItem',
      '10': 'menu'
    },
  ],
};

const Order$json = const {
  '1': 'Order',
  '2': const [
    const {'1': '_id', '3': 1, '4': 1, '5': 9, '10': 'Id'},
    const {'1': 'reservationId', '3': 2, '4': 1, '5': 9, '10': 'reservationId'},
    const {'1': 'business', '3': 3, '4': 1, '5': 9, '10': 'business'},
    const {'1': 'start', '3': 4, '4': 1, '5': 9, '10': 'start'},
    const {'1': 'end', '3': 5, '4': 1, '5': 9, '10': 'end'},
    const {
      '1': 'seats',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.seatlect.OrderSeat',
      '10': 'seats'
    },
    const {'1': 'status', '3': 7, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'image', '3': 8, '4': 1, '5': 9, '10': 'image'},
    const {'1': 'extraSpace', '3': 9, '4': 1, '5': 5, '10': 'extraSpace'},
    const {'1': 'name', '3': 10, '4': 1, '5': 9, '10': 'name'},
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

const OrderSeat$json = const {
  '1': 'OrderSeat',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'space', '3': 4, '4': 1, '5': 5, '10': 'space'},
  ],
};
