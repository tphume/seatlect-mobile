import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:entity/entity.dart';

import 'package:user_repository/user_repository.dart';
import 'package:business_repository/business_repository.dart';

part 'favorite_event.dart';

part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final UserRepo userRepo;
  final BusinessRepo businessRepo;

  FavoriteBloc({@required this.userRepo, @required this.businessRepo})
      : assert(userRepo != null),
        assert(businessRepo != null),
        super(FavoriteInitial());

  @override
  Stream<FavoriteState> mapEventToState(
    FavoriteEvent event,
  ) async* {
    if (event is FavoriteReset) {
      yield FavoriteInitial();
    } else if (event is FetchFavorite) {
      try {
        final businesses = await businessRepo.ListBusinessById(event.ids);
        yield FavoriteCurrent(businesses: businesses);
      } catch (e) {}
    } else if (event is AddFavorite) {
      try {
        final businesses = [...state.businesses, event.business];
        yield FavoriteCurrent(businesses: businesses);

        await userRepo.AddFavorite(event.business.id);
      } catch (e) {}
    } else if (event is RemoveFavorite) {
      try {
        final businesses = [...state.businesses];
        businesses.removeWhere((b) => b.id == event.business.id);

        yield FavoriteCurrent(businesses: businesses);

        await userRepo.RemoveFavorite(event.business.id);
      } catch (e) {
        yield FavoriteCurrent(
            businesses: [...state.businesses, event.business]);
      }
    }
  }
}
