part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props {
    return [];
  }
}

// Event to fetch business for recommendation list
class HomeFetchBusiness extends HomeEvent {
  final Location location;

  HomeFetchBusiness({@required this.location});

  @override
  List<Object> get props {
    return [location];
  }
}
