import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.karma,
    required this.profileUrl,
    required this.logoutUrl,
  });

  factory User.fromParsed({
    required String id,
    required int? karma,
    required String? profileUrl,
    required String? logoutUrl,
  }) {
    return User(
      id: id,
      karma: karma ?? 0,
      profileUrl: profileUrl ?? '',
      logoutUrl: logoutUrl ?? '',
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

  @override
  List<Object?> get props => [
    id,
    karma,
    profileUrl,
    logoutUrl,
  ];
}
