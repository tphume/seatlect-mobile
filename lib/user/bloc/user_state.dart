part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  final User user;

  const UserState({@required this.user});

  @override
  List<Object> get props => [user];
}

class UserInitial extends UserState {}

class UserUnAuth extends UserState {
  final User user = User.empty;

  const UserUnAuth();

  @override
  List<Object> get props => [user];
}

class UserAuth extends UserState {
  final User user;

  const UserAuth({@required this.user});

  @override
  List<Object> get props => [user];
}

// These are temporary state
class UserAuthCalling extends UserState {}

class UserAuthError extends UserState {}
