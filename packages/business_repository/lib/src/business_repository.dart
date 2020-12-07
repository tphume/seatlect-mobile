import 'dart:async';
import 'dart:io';
import 'package:business_repository/business_repository.dart';
import 'package:meta/meta.dart';

import 'package:entity/entity.dart';
import 'package:genproto/genproto.dart' as api;

class BusinessRepo {
  // Client for calling gRPC endpoint
  api.BusinessServiceClient client;

  BusinessRepo({@required this.client}) : assert(client != null);

  Future<List<Business>> ListBusiness(int limit, api.Sort sort,
      {String name,
      List<String> type,
      Location location,
      int startPrice,
      int endPrice,
      DateTime startDate,
      DateTime endDate}) async {}
}

class MockBusinessRepo implements BusinessRepo {
  // Client for calling gRPC endpoint - mock doesn't actually use this
  api.BusinessServiceClient client;

  BusinessRepo() {}

  Future<List<Business>> ListBusiness(int limit, api.Sort sort,
      {String name,
      List<String> type,
      Location location,
      int startPrice,
      int endPrice,
      DateTime startDate,
      DateTime endDate}) async {
    await Future.delayed(Duration(seconds: 1));

    return [
      Business(
          id: '1',
          name: 'PogChampBurger',
          type: ['BURGER', 'BEER', 'LIVE MUSIC'],
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          location: Location(
              latitude: 13.745226384751511, longitude: 100.53793107547114),
          address: 'Groove, Central World',
          displayImage: null,
          images: null,
          menu: null),
      Business(
          id: '2',
          name: 'TateCafe',
          type: ['ITALIAN', 'COCKTAIL'],
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          location: Location(
              latitude: 13.745226384751511, longitude: 100.53793107547114),
          address: 'Groove, Central World',
          displayImage: null,
          images: null,
          menu: null),
      Business(
          id: '3',
          name: 'ManpoClub',
          type: ['BEER', 'COCKTAIL', 'DANCE'],
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          location: Location(
              latitude: 13.732566862458347, longitude: 100.58566653598916),
          address: 'Somewhere in Thonglor',
          displayImage: null,
          images: null,
          menu: null)
    ];
  }
}
