import 'package:authentication_api/authentication_api.dart';
import 'package:feed_api/feed_api.dart';

class AuthenticationRepository {
  const AuthenticationRepository({
    required AuthenticationApi authenticationApi,
    required UserApi userApi,
  }) : _authenticationApi = authenticationApi;

  final AuthenticationApi _authenticationApi;

  Stream<AuthenticationState> get stream => _authenticationApi.stream;
  AuthenticationState get state => _authenticationApi.state;

  Future<void> start() async {
    final hasUserCookie = await _authenticationApi.hasUserCookie();

    if (hasUserCookie) {
      _authenticationApi.authenticate();
    } else {
      await _authenticationApi.unauthenticate();
    }

    try {
      final firstPage = await _feedApi.fetchFeedPage(
        const InitialPageUrl(FeedType.top),
      );

      _authenticationApi.authenticate(firstPage.user);
    } catch (_) {}
  }

  Future<List<Cookie>> cookies() async {
    final cookies = await _authenticationApi.cookies();
    return cookies;
  }

  Future<void> saveCookies(List<Cookie> cookies) async {
    await _authenticationApi.saveCookies(cookies);
  }

  Future<void> login({
    required String username,
    required String password,
  }) async {
    await _authenticationApi.login(
      username: username,
      password: password,
    );
  }

  Future<void> createAccount({
    required String username,
    required String password,
  }) async {
    await _authenticationApi.createAccount(
      username: username,
      password: password,
    );
  }

  Future<void> logout() async {
    await _authenticationApi.logout();
  }
}
