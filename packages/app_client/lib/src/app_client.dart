import 'dart:async';

import 'package:app_client/app_client.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class AppClient extends Cubit<AuthenticationState> {
  AppClient({
    required Uri baseUrl,
    required CookieJar cookieJar,
    required void Function(Dio, CookieJar) addPlatformConfiguration,
    void Function(String?)? debugPrint,
  }) : _cookieJar = cookieJar,
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

  static bool isConnectionError(Object error) {
    if (error is! DioException) return false;

    switch (error.type) {
      case DioExceptionType.connectionError:
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return true;
      case DioExceptionType.unknown:
        return error.error is ClientException;
      case DioExceptionType.badCertificate:
      case DioExceptionType.badResponse:
      case DioExceptionType.cancel:
        return false;
    }
  }

  Future<void> start() async {
    try {
      print('start fetching initial data');
      await http.get<void>('news');
      print('initial data fetched successfully');
    } catch (e) {
      if (isConnectionError(e)) {
        print('Network error occurred: $e');
        emit(
          state.copyWith(
            status: AuthenticationStatus.networkError,
          ),
        );
      } else {
        print('An error occurred: $e');
        await _cookieJar.deleteAll();

        emit(
          state.copyWith(
            status: AuthenticationStatus.unauthenticated,
          ),
        );
      }
    }
  }

  final CookieJar _cookieJar;
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

  void authenticate(User user) {
    print('Authenticating user: $user');

    emit(
      state.copyWith(
        user: user,
        status: AuthenticationStatus.authenticated,
      ),
    );
  }

  Future<void> unauthenticate() async {
    print('Unauthenticating user: ${state.user.id}');

    if (!state.status.isUnauthenticated) {
      print('delete cookies');
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
