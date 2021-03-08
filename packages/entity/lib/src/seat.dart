import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class Seat extends Equatable {
  final String name;
  final int floor;
  final int space;
  final double x;
  final double y;

  Seat(
      {@required this.name,
      @required this.floor,
      @required this.space,
      @required this.x,
      @required this.y})
      : assert(name != null),
        assert(floor != null),
        assert(space != null),
        assert(x != null),
        assert(y != null);

  @override
  List<Object> get props {
    return [name, floor, space, x, y];
  }
}

class ReservationSeat extends Equatable {
  final String name;
  final int floor;
  final String type;
  final int space;
  final String user;
  final String status;
  final double x;
  final double y;
  final double width;
  final double height;
  final double rotation;

  ReservationSeat(
      {@required this.name,
      @required this.floor,
      @required this.type,
      @required this.space,
      @required this.user,
      @required this.status,
      @required this.x,
      @required this.y,
      @required this.width,
      @required this.height,
      @required this.rotation})
      : assert(name != null),
        assert(floor != null),
        assert(type != null),
        assert(space != null),
        assert(user != null),
        assert(status != null),
        assert(x != null),
        assert(y != null),
        assert(width != null),
        assert(height != null),
        assert(rotation != null);

  @override
  List<Object> get props {
    return [
      name,
      floor,
      type,
      space,
      user,
      status,
      x,
      y,
      width,
      height,
      rotation
    ];
  }
}
