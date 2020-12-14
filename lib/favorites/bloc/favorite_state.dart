part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  final List<Business> businesses = [];

  FavoriteState();

  @override
  List<Object> get props {
    return [this.businesses];
  }
}

class FavoriteInitial extends FavoriteState {
  final List<Business> businesses = [];
}

class FavoriteCurrent extends FavoriteState {
  final List<Business> businesses;

  FavoriteCurrent({@required this.businesses}) : assert(businesses != null);
}
