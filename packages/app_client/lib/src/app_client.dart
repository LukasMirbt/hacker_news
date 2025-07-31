import 'dart:async';

import 'package:app_client/app_client.dart';
import 'package:bloc/bloc.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class AppClient extends Cubit<AuthenticationState> {
  AppClient({
    required Uri baseUrl,
    required CookieJar cookieJar,
    required void Function(Dio, CookieJar) addPlatformConfiguration,
    void Function(String?)? debugPrint,
    ErrorService? errorService,
  }) : _cookieJar = cookieJar,
       _errorService = errorService ?? const ErrorService(),
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

  final CookieJar _cookieJar;
  final ErrorService _errorService;
  final Dio http;

  Future<void> start() async {
    final cookies = await _cookieJar.loadForRequest(state.baseUrl);

    final hasUserCookie = cookies.any(
      (cookie) => cookie.name == 'user',
    );

    if (!hasUserCookie) {
      return emit(
        state.copyWith(
          status: AuthenticationStatus.unauthenticated,
        ),
      );
    }

    try {
      await http.get<void>('news');
    } catch (error) {
      final isNetworkError = _errorService.isNetworkError(error);

      if (isNetworkError) {
        emit(
          state.copyWith(
            status: AuthenticationStatus.networkError,
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
  }

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

  void authenticate(User user) {
    emit(
      state.copyWith(
        user: user,
        status: AuthenticationStatus.authenticated,
      ),
    );
  }

  Future<void> unauthenticate() async {
    if (!state.status.isUnauthenticated) {
      await _cookieJar.deleteAll();
    }

    emit(
      state.copyWith(
        user: User.empty,
        status: AuthenticationStatus.unauthenticated,
      ),
    );
  }
}
