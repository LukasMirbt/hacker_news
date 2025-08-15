import 'package:authentication_api/authentication_api.dart';

class AuthenticationRepository {
  const AuthenticationRepository({
    required AuthenticationApi authenticationApi,
  }) : _api = authenticationApi;

  final AuthenticationApi _api;

  Stream<AuthenticationState> get stream => _api.stream;
  AuthenticationState get state => _api.state;

  Future<List<Cookie>> cookies() async {
    final cookies = await _api.cookies();
    return cookies;
  }

  Future<void> saveCookies(List<Cookie> cookies) async {
    await _api.saveCookies(cookies);
  }

  void updateAuthenticationFromHtml(String html) {
    _api.updateAuthenticationFromHtml(html);
  }

  Future<void> login({
    required String username,
    required String password,
  }) async {
    await _api.login(
      username: username,
      password: password,
    );
  }

  Future<void> createAccount({
    required String username,
    required String password,
  }) async {
    await _api.createAccount(
      username: username,
      password: password,
    );
  }

  Future<void> logout() async {
    await _api.logout();
  }
}
