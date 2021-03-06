import 'dart:async';
import 'dart:developer' as developer;

import 'package:meta/meta.dart';
import 'package:entity/entity.dart';
import 'package:genproto/genproto.dart' as api;

class BusinessRepo {
  // Client for calling gRPC endpoint
  api.BusinessServiceClient client;

  BusinessRepo({@required this.client}) : assert(client != null);

  Future<List<Business>> ListBusiness(int limit, api.Sort sort,
      {String name,
      String type,
      List<String> tags,
      Location location,
      int startPrice,
      int endPrice,
      DateTime startDate,
      DateTime endDate}) async {
    // Construct request object
    final latLng = api.Latlng()
      ..latitude = location.latitude
      ..longitude = location.longitude;

    final request = api.ListBusinessRequest()
      ..limit = limit
      ..sort = sort
      ..type = type
      ..location = latLng
      ..startPrice = startPrice
      ..endPrice = endPrice
      ..startDate = startDate.toIso8601String()
      ..endDate = endDate.toIso8601String();

    request.tags.addAll(tags);

    // Call endpoint
    try {
      final response = await client.listBusiness(request);
      return _convertApiList(response.businesses);
    } catch (e) {
      developer.log('non-gRPC error at login',
          time: DateTime.now(), name: 'UserRepo', error: e);

      rethrow;
    }
  }

  Future<List<Business>> ListBusinessById(List<String> id) async {
    // Construct request object
    final request = api.ListBusinessByIdRequest()..setField(1, id);

    // Call endpoint
    try {
      final response = await client.listBusinessById(request);
      return _convertApiList(response.businesses);
    } catch (e) {
      developer.log('non-gRPC error at login',
          time: DateTime.now(), name: 'UserRepo', error: e);

      rethrow;
    }
  }

  List<Business> _convertApiList(List<api.Business> raw) {
    final businesses = raw.map<Business>((b) => Business(
        id: b.id,
        name: b.name,
        type: b.type,
        tags: b.tags,
        description: b.description,
        location: Location(
            latitude: b.location.latitude, longitude: b.location.longitude),
        address: b.address,
        displayImage: b.displayImage,
        images: b.images,
        menu: b.menu
            .map<MenuItem>((i) => MenuItem(
                name: i.name,
                description: i.description,
                image: i.image,
                price: i.price))
            .toList()));

    return businesses.toList();
  }
}
