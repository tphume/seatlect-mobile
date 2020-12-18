import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'seat.dart';
import 'preorder.dart';

class Order extends Equatable {
  final String id;
  final String reservationId;
  final String businessId;
  final DateTime start;
  final DateTime end;
  final List<Seat> seats;
  final List<Preorder> preorder;
  final String
      totalPrice; // String for now - until appropriate decimal package is found
  final String status;
  final String image;
  final int extraSpace;

  Order(
      {@required this.id,
      @required this.reservationId,
      @required this.businessId,
      @required this.start,
      @required this.end,
      @required this.seats,
      @required this.preorder,
      @required this.totalPrice,
      @required this.status,
      @required this.image,
      @required this.extraSpace})
      : assert(id != null),
        assert(reservationId != null),
        assert(businessId != null),
        assert(start != null),
        assert(end != null),
        assert(seats != null),
        assert(preorder != null),
        assert(totalPrice != null),
        assert(start != null),
        assert(image != null),
        assert(extraSpace != null);

  @override
  List<Object> get props {
    return [
      id,
      reservationId,
      businessId,
      start,
      end,
      seats,
      preorder,
      totalPrice,
      status,
      image,
      extraSpace
    ];
  }
}
