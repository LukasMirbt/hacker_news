import 'dart:async';

import 'package:app_client/app_client.dart';
import 'package:bloc/bloc.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class AppClient extends Cubit<AuthenticationState> {
  AppClient({
    required Uri baseUrl,
    required CookieJar cookieJar,
    required UserStorage userStorage,
    required void Function(Dio, CookieJar) addPlatformConfiguration,
    void Function(String?)? debugPrint,
  }) : _cookieJar = cookieJar,
       _userStorage = userStorage,
       http = SequentialDio(),
       super(
         AuthenticationState(baseUrl: baseUrl),
       ) {
    final baseOptions = BaseOptions(
      connectTimeout: const Duration(milliseconds: 10000),
      receiveTimeout: const Duration(milliseconds: 10000),
      validateStatus: (_) => true,
      baseUrl: baseUrl.toString(),
    );

    final loggingInterceptor = PrettyDioLogger(
      responseBody: false,
      logPrint: (object) {
        debugPrint?.call(object.toString());
      },
    );

    final redirectInterceptor = RedirectInterceptor(
      redirectService: RedirectService(appClient: this),
    );

    final authenticationInterceptor = AuthenticationInterceptor(
      authenticationService: AuthenticationService(appClient: this),
    );

    final redirectValidationInterceptor = RedirectValidationInterceptor(
      appClient: this,
    );

    addPlatformConfiguration(http, cookieJar);

    http
      ..options = baseOptions
      ..interceptors.add(loggingInterceptor)
      ..interceptors.add(redirectInterceptor)
      ..interceptors.add(authenticationInterceptor)
      ..interceptors.add(redirectValidationInterceptor);
  }

  Future<void> start() async {
    final cookies = await _cookieJar.loadForRequest(state.baseUrl);

    final hasUserCookie = cookies.any(
      (cookie) => cookie.name == 'user',
    );

    final userId = await _userStorage.readUserId();

    final status = hasUserCookie && userId != null
        ? AuthenticationStatus.authenticated
        : AuthenticationStatus.unauthenticated;

    emit(
      state.copyWith(
        user: state.user.copyWith(
          id: userId ?? state.user.id,
        ),
        status: status,
      ),
    );
  }

  final CookieJar _cookieJar;
  final UserStorage _userStorage;
  final Dio http;

  void redirectToLogin() {
    emit(
      state.copyWith(
        user: User.empty,
        status: AuthenticationStatus.unauthenticated,
        redirect: LoginRedirect(),
      ),
    );
  }

  Future<void> redirectToWeb(Uri url) async {
    emit(
      state.copyWith(
        redirect: WebRedirect(url: url),
      ),
    );
  }

  Future<List<Cookie>> cookies() async {
    final cookies = await _cookieJar.loadForRequest(state.baseUrl);
    return cookies;
  }

  Future<void> saveCookies(List<Cookie> cookies) async {
    await _cookieJar.saveFromResponse(state.baseUrl, cookies);
  }

  void authenticate(String userId) {
    emit(
      state.copyWith(
        status: AuthenticationStatus.authenticated,
        user: state.user.copyWith(
          id: userId,
        ),
      ),
    );
  }

  Future<void> unauthenticate() async {
    await _cookieJar.deleteAll();

    emit(
      state.copyWith(
        user: User.empty,
        status: AuthenticationStatus.unauthenticated,
      ),
    );
  }
}
