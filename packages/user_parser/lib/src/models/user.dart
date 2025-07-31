import 'package:equatable/equatable.dart';

class UserData extends Equatable {
  const UserData({
    required this.id,
    required this.karma,
    required this.profileUrl,
    required this.logoutUrl,
  });

  factory UserData.fromParsed({
    required String id,
    required int? karma,
    required String? profileUrl,
    required String? logoutUrl,
  }) {
    return UserData(
      id: id,
      karma: karma ?? 0,
      profileUrl: profileUrl ?? '',
      logoutUrl: logoutUrl ?? '',
    );
  }

  static const empty = UserData(
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
