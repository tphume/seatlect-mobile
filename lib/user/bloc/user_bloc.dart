import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:entity/entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserEmpty());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is UserStateChange) {
      if (event.user == User.empty) {
        yield UserEmpty();
      } else {
        yield UserPopulated(user: event.user);
      }
    }
  }
}
