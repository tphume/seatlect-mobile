part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props {
    return [];
  }
}

// Event to fetch business for recommendation list
class HomeFetchBusiness extends HomeEvent {}

// Event if fetch was successful
class HomeFetchOk extends HomeEvent {}

// Event if fetch was unsuccessful
class HomeFetchFailed extends HomeEvent {}

// Event is location service is not enabled
class HomeFetchDisabled extends HomeEvent {}
