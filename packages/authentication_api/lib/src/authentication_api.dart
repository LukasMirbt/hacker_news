import 'dart:async';

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

  void updateAuthenticationFromHtml(String html) {
    _client.updateAuthenticationFromHtml(html);
  }

  Future<void> saveCookies(List<Cookie> cookies) async {
    await _client.saveCookies(cookies);
  }

  Future<void> login({
    required String username,
    required String password,
  }) async {
    await _client.http.post<String>(
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

    await _client.authenticate(
      User.initial(username),
    );
  }

  Future<void> createAccount({
    required String username,
    required String password,
  }) async {
    await _client.http.post<String>(
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

    await _client.authenticate(
      User.initial(username),
    );
  }

  Future<void> logout() async {
    // TODO(LukasMirbt): Handle network errors
    await _client.http.get<void>(state.user.logoutUrl);
    await _client.unauthenticate();
  }
}
