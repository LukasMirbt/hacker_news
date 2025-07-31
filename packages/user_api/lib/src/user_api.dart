import 'dart:async';

import 'package:app_client/app_client.dart';

class UserRequestFailure with EquatableMixin implements Exception {
  UserRequestFailure(this.statusCode);

  final int? statusCode;

  @override
  List<Object?> get props => [statusCode];
}

class UserApi {
  UserApi({
    required AppClient appClient,
    UserParser? userParser,
  }) : _client = appClient,
       _parser = userParser ?? const UserParser();

  final AppClient _client;
  final UserParser _parser;

  Future<UserData> fetchUser() async {
    final response = await _client.http.get<String>('news');

    final statusCode = response.statusCode;
    if (statusCode != 200) throw UserRequestFailure(statusCode);

    final html = response.data!;
    final data = _parser.parse(html);
    final user = User.from(data);
    return user;
  }

  Future<void> logout({required String url}) async {
    await _client.http.get<void>(url);
  }
}
