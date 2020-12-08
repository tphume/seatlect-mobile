part of 'location_cubit.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

// Only use on init
class LocationInitial extends LocationState {}

// If location is empty
class LocationEmpty extends LocationState {}

// Contains user selected location - or current location
class LocationSelected extends LocationState {
  final entity.Location location;
  final String address;

  LocationSelected({@required this.location, @required this.address})
      : assert(location != null),
        assert(address != null);

  @override
  List<Object> get props {
    return [location, address];
  }
}
