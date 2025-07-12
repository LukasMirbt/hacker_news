import 'dart:async';
import 'dart:io';

import 'package:app_client/app_client.dart';

class AuthenticationApi {
  AuthenticationApi({
    required AppClient appClient,
  }) : _client = appClient;

  final AppClient _client;

  Stream<AuthenticationState> get stream => _client.stream;
  AuthenticationState get state => _client.state;

  void redirectToLogin() {
    _client.redirectToLogin();
  }

  Future<List<Cookie>> cookies() async {
    final cookies = await _client.cookies();
    return cookies;
  }

  Future<void> saveCookies(List<Cookie> cookies) async {
    await _client.saveCookies(cookies);
  }

  Future<void> login({
    required String username,
    required String password,
  }) async {
    final response = await _client.http.post<String>(
      'login',
      options: RedirectValidationOptions(
        contentType: Headers.formUrlEncodedContentType,
      ),
      data: {
        'goto': 'news',
        'acct': username,
        'pw': password,
      },
    );

    final redirect = response.headers.value(HttpHeaders.locationHeader)!;
    await _client.http.get<void>(redirect);
  }

  Future<void> createAccount({
    required String username,
    required String password,
  }) async {
    final response = await _client.http.post<String>(
      'login',
      options: RedirectValidationOptions(
        contentType: Headers.formUrlEncodedContentType,
      ),
      data: {
        'goto': 'news',
        'creating': 't',
        'acct': username,
        'pw': password,
      },
    );

    final redirect = response.headers.value(HttpHeaders.locationHeader)!;
    await _client.http.get<void>(redirect);
  }

  Future<void> logout() async {
    await _client.http.get<void>(state.user.logoutUrl);
    await _client.unauthenticate();
  }
}
