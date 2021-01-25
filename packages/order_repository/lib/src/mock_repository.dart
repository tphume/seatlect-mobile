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
          reservationId: '2',
          business: Business(
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
          start: DateTime.parse('2020-12-27T20:00:00+0700'),
          end: DateTime.parse('2020-12-27T23:00:00+0700'),
          seats: [
            Seat(name: 'A10', floor: 0, space: 2, price: '30', x: 0, y: 0),
            Seat(name: 'B10', floor: 0, space: 2, price: '30', x: 0, y: 0)
          ],
          preorder: [
            Preorder(
                name: 'Fries',
                description: '',
                image: '',
                price: '400',
                quantity: 10)
          ],
          totalPrice: '460',
          status: 'AVAILABLE',
          extraSpace: 0),
      Order(
          id: '1',
          reservationId: '1',
          business: Business(
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
          start: DateTime.parse('2020-12-18T20:00:00+0700'),
          end: DateTime.parse('2020-12-18T23:00:00+0700'),
          seats: [
            Seat(name: 'A10', floor: 0, space: 2, price: '30', x: 0, y: 0)
          ],
          preorder: [
            Preorder(
                name: 'Fries',
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
