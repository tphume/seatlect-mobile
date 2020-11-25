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
  StreamSubscription<User> userSubscription;

  UserBloc({@required this.userRepo})
      : assert(userRepo != null),
        super(UserEmpty()) {
    this.userSubscription = userRepo.user.listen((user) {
      add(UserStateChange(user: user));
    });
  }

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

  @override
  Future<Function> close() {
    userSubscription?.cancel();
    this.userRepo.dispose();
    return super.close();
  }
}
