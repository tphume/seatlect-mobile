part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

// Empty state --> nothing to show
class HomeEmpty extends HomeState {}

// State with business list
class HomePopulated extends HomeState {
  final List<Business> businessList;

  HomePopulated(this.businessList);

  @override
  List<Object> get props {
    return [this.businessList];
  }
}
