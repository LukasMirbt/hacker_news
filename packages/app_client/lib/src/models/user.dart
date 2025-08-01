// ignore_for_file: annotate_overrides

import 'package:authentication_parser/authentication_parser.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const User({
    required this.id,
    required this.karma,
    required this.profileUrl,
    required this.logoutUrl,
  });

  factory User.initial(String id) {
    return User(
      id: id,
      karma: 0,
      profileUrl: '',
      logoutUrl: '',
    );
  }

  factory User.fromData(UserData data) {
    return User(
      id: data.id,
      karma: data.karma,
      profileUrl: data.profileUrl,
      logoutUrl: data.logoutUrl,
    );
  }

  static const empty = User(
    id: '',
    karma: 0,
    profileUrl: '',
    logoutUrl: '',
  );

  final String id;
  final int karma;
  final String profileUrl;
  final String logoutUrl;
}
