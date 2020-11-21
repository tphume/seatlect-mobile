import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'entity.dart';

class User extends Equatable {
  final String username;
  final DateTime dob;
  final String avatar;
  final List<String> preference;
  final List<Business> favorite;

  User(
      {@required this.username,
      @required this.dob,
      @required this.avatar,
      @required this.preference,
      @required this.favorite})
      : assert(username != null),
        assert(dob != null),
        assert(avatar != null),
        assert(preference != null),
        assert(favorite != null);

  @override
  List<Object> get props {
    return [username, dob, avatar, preference, favorite];
  }
}
