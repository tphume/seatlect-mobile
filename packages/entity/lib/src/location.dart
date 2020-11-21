import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final double latitude;
  final double longitude;

  Location({@required this.latitude, @required this.longitude})
      : assert(latitude != null),
        assert(longitude != null);

  @override
  List<Object> get props {
    return [latitude, longitude];
  }
}
