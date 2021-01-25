import 'dart:async';

import 'business_repository.dart';
import 'package:entity/entity.dart';
import 'package:genproto/genproto.dart' as api;

class MockBusinessRepo implements BusinessRepo {
  // Client for calling gRPC endpoint - mock doesn't actually use this
  api.BusinessServiceClient client;

  BusinessRepo() {}

  Future<List<Business>> ListBusiness(int limit, api.Sort sort,
      {String name,
      String type,
      List<String> tags,
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
          type: 'Restaurant',
          tags: ['BURGER', 'BEER', 'LIVE MUSIC'],
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          location: Location(
              latitude: 13.745226384751511, longitude: 100.53793107547114),
          address: 'Groove, Central World',
          displayImage: 'https://i.imgur.com/g17EY2i.jpg',
          images: [
            'https://i.imgur.com/g17EY2i.jpg',
            'https://i.imgur.com/RjFgQSZ.jpeg'
          ],
          menu: [
            MenuItem(
                name: 'Fries',
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna ...',
                image: 'https://i.imgur.com/rXjqn0y.jpeg',
                price: '10'),
            MenuItem(
                name: 'Fries',
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna ...',
                image: 'https://i.imgur.com/rXjqn0y.jpeg',
                price: '10'),
            MenuItem(
                name: 'Fries',
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna ...',
                image: 'https://i.imgur.com/rXjqn0y.jpeg',
                price: '10'),
            MenuItem(
                name: 'Fries',
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna ...',
                image: 'https://i.imgur.com/rXjqn0y.jpeg',
                price: '10')
          ]),
      Business(
          id: '2',
          name: 'TateCafe',
          type: 'Restaurant',
          tags: ['ITALIAN', 'COCKTAIL'],
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          location: Location(
              latitude: 13.745226384751511, longitude: 100.53793107547114),
          address: 'Groove, Central World',
          displayImage: 'https://i.imgur.com/g17EY2i.jpg',
          images: [
            'https://i.imgur.com/g17EY2i.jpg',
            'https://i.imgur.com/RjFgQSZ.jpeg'
          ],
          menu: [
            MenuItem(
                name: 'Fries',
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna ...',
                image: 'https://i.imgur.com/rXjqn0y.jpeg',
                price: '10'),
            MenuItem(
                name: 'Fries',
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna ...',
                image: 'https://i.imgur.com/rXjqn0y.jpeg',
                price: '10'),
            MenuItem(
                name: 'Fries',
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna ...',
                image: 'https://i.imgur.com/rXjqn0y.jpeg',
                price: '10'),
            MenuItem(
                name: 'Fries',
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna ...',
                image: 'https://i.imgur.com/rXjqn0y.jpeg',
                price: '10')
          ]),
      Business(
          id: '3',
          name: 'ManpoClub',
          type: 'Bar',
          tags: ['BEER', 'COCKTAIL', 'DANCE'],
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          location: Location(
              latitude: 13.732566862458347, longitude: 100.58566653598916),
          address: 'Somewhere in Thonglor',
          displayImage: 'https://i.imgur.com/g17EY2i.jpg',
          images: [
            'https://i.imgur.com/g17EY2i.jpg',
            'https://i.imgur.com/RjFgQSZ.jpeg'
          ],
          menu: [
            MenuItem(
                name: 'Fries',
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna ...',
                image: 'https://i.imgur.com/rXjqn0y.jpeg',
                price: '10'),
            MenuItem(
                name: 'Fries',
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna ...',
                image: 'https://placeimg.com/640/480/any',
                price: '10'),
            MenuItem(
                name: 'Fries',
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna ...',
                image: 'https://i.imgur.com/rXjqn0y.jpeg',
                price: '10'),
            MenuItem(
                name: 'Fries',
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna ...',
                image: 'https://i.imgur.com/rXjqn0y.jpeg',
                price: '10')
          ]),
    ];
  }

  Future<List<Business>> ListBusinessById(List<String> id) async {
    await Future.delayed(Duration(seconds: 1));

    return [
      Business(
          id: '1',
          name: 'PogChampBurger',
          type: 'Restaurant',
          tags: ['BURGER', 'BEER', 'LIVE MUSIC'],
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          location: Location(
              latitude: 13.745226384751511, longitude: 100.53793107547114),
          address: 'Groove, Central World',
          displayImage: 'https://i.imgur.com/g17EY2i.jpg',
          images: [
            'https://i.imgur.com/g17EY2i.jpg',
            'https://i.imgur.com/RjFgQSZ.jpeg'
          ],
          menu: [
            MenuItem(
                name: 'Fries',
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna ...',
                image: 'https://i.imgur.com/rXjqn0y.jpeg',
                price: '10'),
            MenuItem(
                name: 'Fries',
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna ...',
                image: 'https://i.imgur.com/rXjqn0y.jpeg',
                price: '10'),
            MenuItem(
                name: 'Fries',
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna ...',
                image: 'https://i.imgur.com/rXjqn0y.jpeg',
                price: '10'),
            MenuItem(
                name: 'Fries',
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna ...',
                image: 'https://i.imgur.com/rXjqn0y.jpeg',
                price: '10')
          ]),
      Business(
          id: '2',
          name: 'TateCafe',
          type: 'Restaurant',
          tags: ['ITALIAN', 'COCKTAIL'],
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          location: Location(
              latitude: 13.745226384751511, longitude: 100.53793107547114),
          address: 'Groove, Central World',
          displayImage: 'https://i.imgur.com/g17EY2i.jpg',
          images: [
            'https://i.imgur.com/g17EY2i.jpg',
            'https://i.imgur.com/RjFgQSZ.jpeg'
          ],
          menu: [
            MenuItem(
                name: 'Fries',
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna ...',
                image: 'https://i.imgur.com/rXjqn0y.jpeg',
                price: '10'),
            MenuItem(
                name: 'Fries',
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna ...',
                image: 'https://i.imgur.com/rXjqn0y.jpeg',
                price: '10'),
            MenuItem(
                name: 'Fries',
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna ...',
                image: 'https://i.imgur.com/rXjqn0y.jpeg',
                price: '10'),
            MenuItem(
                name: 'Fries',
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna ...',
                image: 'https://i.imgur.com/rXjqn0y.jpeg',
                price: '10')
          ]),
    ];
  }

  _convertApiList(List<api.Business> raw) {
    final businesses = raw.map<Business>((b) => Business(
        id: b.id,
        name: b.name,
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
