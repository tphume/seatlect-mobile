import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:entity/entity.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:user_repository/user_repository.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepo userRepo;

  UserBloc({@required this.userRepo})
      : assert(userRepo != null),
        super(UserInitial()) {
    add(UserAppInit());
  }

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is UserAppInit) {
      yield UserUnAuth();
    } else if (event is UserLogin) {
      try {
        yield UserAuthCalling();

        final user = await userRepo.login(event.username, event.password);
        add(UserAuthSuccess(user: user));
      } catch (e) {
        yield UserAuthError();
      }
    } else if (event is UserAuthSuccess) {
      yield UserAuth(user: event.user);
    }
  }
}
