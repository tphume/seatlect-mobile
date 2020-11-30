part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props {
    return [];
  }
}

class UserAppInit extends UserEvent {}

class UserLogin extends UserEvent {
  final String username;
  final String password;

  UserLogin({@required this.username, @required this.password});
}

class UserLogout extends UserEvent {}

class UserFetch extends UserEvent {}

// Called within the Bloc itself
class UserAuthSuccess extends UserEvent {
  final User user;

  UserAuthSuccess({@required this.user});
}
