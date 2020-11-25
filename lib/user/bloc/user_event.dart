part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  final User user;

  const UserEvent({@required this.user});

  @override
  List<Object> get props {
    return [];
  }
}

class UserStateChange extends UserEvent {
  final User user;

  const UserStateChange({@required this.user});
}
