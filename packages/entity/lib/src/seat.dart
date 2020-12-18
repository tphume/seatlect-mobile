import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class Seat extends Equatable {
  final String name;
  final int floor;
  final int space;
  final String
      price; // String for now - until appropriate decimal package is found
  final double x;
  final double y;

  Seat(
      {@required this.name,
      @required this.floor,
      @required this.space,
      @required this.price,
      @required this.x,
      @required this.y})
      : assert(name != null),
        assert(floor != null),
        assert(space != null),
        assert(price != null),
        assert(x != null),
        assert(y != null);

  @override
  List<Object> get props {
    return [name, floor, space, price, x, y];
  }
}
