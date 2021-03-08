import 'package:entity/entity.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class Reservation extends Equatable {
  final String id;
  final String businessId;
  final String name;
  final DateTime start;
  final DateTime end;
  final List<ReservationSeat> placement;
  final List<MenuItem> menu;
  final String image;

  Reservation({@required this.id,
    this.businessId,
    this.name,
    this.start,
    this.end,
    this.placement,
    this.menu,
    this.image})
      : assert(id != null),
        assert(businessId != null),
        assert(name != null),
        assert(start != null),
        assert(end != null),
        assert(placement != null),
        assert(menu != null),
        assert(image != null);

  @override
  List<Object> get props {
    return [id, businessId, name, start, end, placement, menu, image]
  }
}
