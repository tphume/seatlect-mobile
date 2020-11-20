import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final double latitude;
  final double longitude;

  Location({@required this.latitude, @required this.longitude}) {
    if (latitude > 90 || latitude < -90) {
      throw FormatException("latitude must be between -90 and 90", latitude);
    }

    if (longitude > 180 || latitude < -180) {
      throw FormatException(
          "longitude must be between -180 and 180", longitude);
    }
  }

  @override
  List<Object> get props {
    return [latitude, longitude];
  }
}
