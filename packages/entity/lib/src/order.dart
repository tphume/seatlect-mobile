import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:entity/entity.dart';
import 'seat.dart';
import 'preorder.dart';

class Order extends Equatable {
  final String id;
  final String reservationId;
  final String businessId;
  final DateTime start;
  final DateTime end;
  final List<Seat>
      seats; // String for now - until appropriate decimal package is found
  final String status;
  final String image;
  final int extraSpace;
  final String name;

  Order(
      {@required this.id,
      @required this.reservationId,
      @required this.businessId,
      @required this.start,
      @required this.end,
      @required this.seats,
      @required this.image,
      @required this.status,
      @required this.extraSpace,
      @required this.name})
      : assert(id != null),
        assert(reservationId != null),
        assert(businessId != null),
        assert(start != null),
        assert(end != null),
        assert(seats != null),
        assert(image != null),
        assert(start != null),
        assert(extraSpace != null),
        assert(name != null);

  @override
  List<Object> get props {
    return [
      id,
      reservationId,
      businessId,
      start,
      end,
      seats,
      status,
      image,
      extraSpace,
      name
    ];
  }
}
