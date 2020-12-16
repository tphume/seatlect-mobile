///
//  Generated code. Do not modify.
//  source: business.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

const Sort$json = const {
  '1': 'Sort',
  '2': const [
    const {'1': 'NAME_ASC', '2': 0},
    const {'1': 'NAME_DESC', '2': 1},
    const {'1': 'LOCATION_ASC', '2': 2},
    const {'1': 'LOCATION_DESC', '2': 3},
    const {'1': 'PRICE_ASC', '2': 4},
    const {'1': 'PRICE_DESC', '2': 5},
    const {'1': 'DATE_ASC', '2': 6},
    const {'1': 'DATE_DESC', '2': 7},
  ],
};

const ListBusinessRequest$json = const {
  '1': 'ListBusinessRequest',
  '2': const [
    const {'1': 'limit', '3': 1, '4': 1, '5': 5, '10': 'limit'},
    const {
      '1': 'sort',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.seatlect.Sort',
      '10': 'sort'
    },
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'tags', '3': 4, '4': 3, '5': 9, '10': 'tags'},
    const {
      '1': 'location',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.seatlect.Latlng',
      '10': 'location'
    },
    const {'1': 'startPrice', '3': 6, '4': 1, '5': 5, '10': 'startPrice'},
    const {'1': 'endPrice', '3': 7, '4': 1, '5': 5, '10': 'endPrice'},
    const {'1': 'startDate', '3': 8, '4': 1, '5': 9, '10': 'startDate'},
    const {'1': 'endDate', '3': 9, '4': 1, '5': 9, '10': 'endDate'},
  ],
};

const ListBusinessResponse$json = const {
  '1': 'ListBusinessResponse',
  '2': const [
    const {
      '1': 'businesses',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.seatlect.Business',
      '10': 'businesses'
    },
  ],
};

const ListBusinessByIdRequest$json = const {
  '1': 'ListBusinessByIdRequest',
  '2': const [
    const {'1': 'ids', '3': 1, '4': 3, '5': 9, '10': 'ids'},
  ],
};

const ListBusinessByIdResponse$json = const {
  '1': 'ListBusinessByIdResponse',
  '2': const [
    const {
      '1': 'businesses',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.seatlect.Business',
      '10': 'businesses'
    },
  ],
};
