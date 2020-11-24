part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  final User user;

  const UserState({this.user});
}

class UserEmpty extends UserState {
  final User user = User.empty;

  const UserEmpty();

  @override
  List<Object> get props => [user];
}

class UserPopulated extends UserState {
  final User user;

  const UserPopulated(this.user);

  @override
  List<Object> get props => [user];
}
