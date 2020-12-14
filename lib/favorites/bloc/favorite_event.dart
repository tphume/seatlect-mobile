part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();
}

class FetchFavorite extends FavoriteEvent {
  final List<String> ids;

  FetchFavorite({@required this.ids});

  @override
  List<Object> get props {
    return [this.ids];
  }
}

class AddFavorite extends FavoriteEvent {
  final Business business;

  AddFavorite({@required this.business});

  @override
  List<Object> get props {
    return [this.business];
  }
}

class RemoveFavorite extends FavoriteEvent {
  final Business business;

  RemoveFavorite({@required this.business});

  @override
  List<Object> get props {
    return [this.business];
  }
}
