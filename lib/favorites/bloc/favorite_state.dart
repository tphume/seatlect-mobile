part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  final List<String> businessIds = [];
  final List<Business> businesses = [];

  FavoriteState();

  @override
  List<Object> get props {
    return [this.businessIds, this.businesses];
  }
}

class FavoriteInitial extends FavoriteState {
  final List<String> businessIds = [];
  final List<Business> businesses = [];
}

class FavoriteCurrent extends FavoriteState {
  final List<String> businessIds;
  final List<Business> businesses;

  FavoriteCurrent({@required this.businessIds, @required this.businesses})
      : assert(businessIds != null),
        assert(businesses != null);
}
