import 'dart:async';

import 'package:app_client/app_client.dart';
import 'package:bloc/bloc.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:secure_user_id_storage/secure_user_id_storage.dart';

class AppClient extends Cubit<AuthenticationState> {
  AppClient({
    required Uri baseUrl,
    required CookieJar cookieJar,
    required SecureUserIdStorage userIdStorage,
    required void Function(Dio, CookieJar) addPlatformConfiguration,
    void Function(String?)? debugPrint,
  }) : _cookieJar = cookieJar,
       _userIdStorage = userIdStorage,
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

    final userId = _userIdStorage.read();

    if (hasUserCookie && userId != null) {
      emit(
        state.copyWith(
          status: AuthenticationStatus.authenticated,
          user: User.initial(userId),
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: AuthenticationStatus.unauthenticated,
        ),
      );
    }
  }

  final CookieJar _cookieJar;
  final SecureUserIdStorage _userIdStorage;
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

  Future<void> authenticate(User user) async {
    await _userIdStorage.write(user.id);

    emit(
      state.copyWith(
        status: AuthenticationStatus.authenticated,
        user: user,
      ),
    );
  }

  Future<void> unauthenticate() async {
    await _cookieJar.deleteAll();
    await _userIdStorage.delete();

    emit(
      state.copyWith(
        user: User.empty,
        status: AuthenticationStatus.unauthenticated,
      ),
    );
  }
}
