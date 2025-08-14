import 'dart:async';

import 'package:app_client/app_client.dart';
import 'package:authentication_parser/authentication_parser.dart'
    hide AuthenticationStatus;
import 'package:bloc/bloc.dart';
import 'package:secure_user_id_storage/secure_user_id_storage.dart';

class AppClient extends Cubit<AuthenticationState> {
  AppClient({
    required Uri baseUrl,
    required CookieJar cookieJar,
    required SecureUserIdStorage userIdStorage,
    required AuthenticationStatusService authenticationStatusService,
    required PrettyDioLogger loggingInterceptor,
    required HtmlInterceptor htmlInterceptor,
    required LoginRedirectInterceptor loginRedirectInterceptor,
    required WebRedirectInterceptor webRedirectInterceptor,
    required void Function(Dio, CookieJar) addPlatformConfiguration,
  }) : _cookieJar = cookieJar,
       _userIdStorage = userIdStorage,
       _authenticationStatusService = authenticationStatusService,
       http = SequentialDio(),
       super(
         AuthenticationState.initial(
           baseUrl: baseUrl,
         ),
       ) {
    final baseOptions = BaseOptions(
      connectTimeout: const Duration(milliseconds: 10000),
      receiveTimeout: const Duration(milliseconds: 10000),
      validateStatus: (_) => true,
      baseUrl: baseUrl.toString(),
    );

    addPlatformConfiguration(http, cookieJar);

    http
      ..options = baseOptions
      ..interceptors.add(loggingInterceptor)
      ..interceptors.add(loginRedirectInterceptor)
      ..interceptors.add(htmlInterceptor)
      ..interceptors.add(webRedirectInterceptor);

    htmlInterceptor.stream.listen(
      _authenticationStatusService.update,
    );

    loginRedirectInterceptor.redirect.listen((redirect) {
      emit(
        state.copyWith(
          loginRedirect: redirect,
          user: User.empty,
          status: AuthenticationStatus.unauthenticated,
        ),
      );
    });

    webRedirectInterceptor.redirect.listen((redirect) {
      emit(
        state.copyWith(
          webRedirect: redirect,
        ),
      );
    });

    _authenticationStatusService.status.listen((status) async {
      switch (status) {
        case final Authenticated status:
          final user = User.fromData(status.data);
          await _userIdStorage.write(user.id);

          emit(
            state.copyWith(
              status: AuthenticationStatus.authenticated,
              user: user,
            ),
          );
        case Unauthenticated():
          await _cookieJar.deleteAll();
          await _userIdStorage.delete();

          emit(
            state.copyWith(
              user: User.empty,
              status: AuthenticationStatus.unauthenticated,
            ),
          );
        case Unknown():
          return;
      }
    });
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
  final AuthenticationStatusService _authenticationStatusService;
  final Dio http;

  Future<List<Cookie>> cookies() async {
    final cookies = await _cookieJar.loadForRequest(state.baseUrl);
    return cookies;
  }

  Future<void> saveCookies(List<Cookie> cookies) async {
    await _cookieJar.saveFromResponse(state.baseUrl, cookies);
  }

  void updateAuthenticationFromHtml(String html) {
    _authenticationStatusService.update(html);
  }

  Future<void> authenticate({required String userId}) async {
    await _userIdStorage.write(userId);

    emit(
      state.copyWith(
        status: AuthenticationStatus.authenticated,
        user: User.initial(userId),
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
