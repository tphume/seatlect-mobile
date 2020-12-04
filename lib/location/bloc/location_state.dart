part of 'location_cubit.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

// Only use on init
class LocationInitial extends LocationState {}

// Contains user selected location - or current location
class LocationSelected extends LocationState {
  final String location;

  LocationSelected({@required this.location}) : assert(location != null);

  @override
  List<Object> get props {
    return [location];
  }
}
