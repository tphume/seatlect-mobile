import 'dart:async';

import 'order_repository.dart';
import 'package:entity/entity.dart';
import 'package:genproto/genproto.dart' as api;

class MockOrderRepo implements OrderRepo {
  // Client for calling gRPC endpoint - mock doesn't actually use this
  api.OrderServiceClient client;

  MockOrderRepository() {}

  Future<List<Order>> ListOrder(int limit, int page) async {
    await Future.delayed(Duration(seconds: 1));

    return [
      Order(
          id: '1',
          reservationId: '1',
          business: Business(
              id: '1',
              name: 'PogChampBurger',
              tags: ['BURGER', 'BEER', 'LIVE MUSIC'],
              description:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              location: Location(
                  latitude: 13.745226384751511, longitude: 100.53793107547114),
              address: 'Groove, Central World',
              displayImage: 'https://placekitten.com/505/505',
              images: [
                'https://placekitten.com/500/500',
                'https://placekitten.com/600/600'
              ],
              menu: [
                MenuItem(
                    name: 'MeatBurger',
                    description:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna ...',
                    image: 'https://placeimg.com/640/480/any',
                    price: '10'),
                MenuItem(
                    name: 'MeatBurger',
                    description:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna ...',
                    image: 'https://placeimg.com/640/480/any',
                    price: '10'),
                MenuItem(
                    name: 'MeatBurger',
                    description:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna ...',
                    image: 'https://placeimg.com/640/480/any',
                    price: '10'),
                MenuItem(
                    name: 'MeatBurger',
                    description:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna ...',
                    image: 'https://placeimg.com/640/480/any',
                    price: '10')
              ]),
          start: DateTime.parse('2020-12-18T20:00:00+0700'),
          end: DateTime.parse('2020-12-18T23:00:00+0700'),
          seats: [
            Seat(name: 'A10', floor: 0, space: 2, price: '30', x: 0, y: 0)
          ],
          preorder: [
            Preorder(
                name: 'MeatBurger',
                description: '',
                image: '',
                price: '130',
                quantity: 3)
          ],
          totalPrice: '420',
          status: 'USED',
          extraSpace: 0),
    ];
  }
}
