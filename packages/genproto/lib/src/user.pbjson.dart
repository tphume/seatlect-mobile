///
//  Generated code. Do not modify.
//  source: user.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

const SignInRequest$json = const {
  '1': 'SignInRequest',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

const SignInResponse$json = const {
  '1': 'SignInResponse',
  '2': const [
    const {'1': 'refreshToken', '3': 1, '4': 1, '5': 9, '10': 'refreshToken'},
    const {'1': 'jwtToken', '3': 2, '4': 1, '5': 9, '10': 'jwtToken'},
    const {
      '1': 'user',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.seatlect.User',
      '10': 'user'
    },
  ],
};

const SignUpRequest$json = const {
  '1': 'SignUpRequest',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    const {'1': 'dob', '3': 3, '4': 1, '5': 9, '10': 'dob'},
  ],
};

const SignUpResponse$json = const {
  '1': 'SignUpResponse',
  '2': const [
    const {'1': 'refreshToken', '3': 1, '4': 1, '5': 9, '10': 'refreshToken'},
    const {'1': 'jwtToken', '3': 2, '4': 1, '5': 9, '10': 'jwtToken'},
    const {
      '1': 'user',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.seatlect.User',
      '10': 'user'
    },
  ],
};
