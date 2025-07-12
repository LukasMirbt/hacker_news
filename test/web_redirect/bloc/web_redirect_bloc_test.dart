// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart' hide Cookie;
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/web_redirect/web_redirect.dart';
import 'package:mocktail/mocktail.dart';

class _MockWebRedirectCookieManager extends Mock
    implements WebRedirectCookieManager {}

class _MockWebRedirectActionModel extends Mock
    implements WebRedirectActionModel {}

class _MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

class _MockInAppWebViewController extends Mock
    implements InAppWebViewController {}

void main() {
  final redirect = WebRedirectPlaceholder();
  final initialState = WebRedirectState.from(redirect);

  group(WebRedirectBloc, () {
    late WebRedirectCookieManager cookieManager;
    late WebRedirectActionModel actionModel;
    late AuthenticationRepository repository;

    setUp(() {
      cookieManager = _MockWebRedirectCookieManager();
      actionModel = _MockWebRedirectActionModel();
      repository = _MockAuthenticationRepository();
    });

    WebRedirectBloc buildBloc() {
      return WebRedirectBloc(
        redirect: redirect,
        webRedirectCookieManager: cookieManager,
        webRedirectActionModel: actionModel,
        authenticationRepository: repository,
      );
    }

    test('initial state is $WebRedirectState', () {
      expect(buildBloc().state, initialState);
    });

    group(WebRedirectStarted, () {
      final cookies = [
        Cookie('name1', 'value1'),
        Cookie('name2', 'value2'),
      ];

      final getCookies = () => repository.cookies();

      final setCookies = () => cookieManager.setCookies(
        url: redirect.url,
        cookies: cookies,
      );

      blocTest<WebRedirectBloc, WebRedirectState>(
        'sets cookies and emits [success]',
        setUp: () {
          when(getCookies).thenAnswer((_) async => cookies);
          when(setCookies).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            WebRedirectStarted(),
          );
        },
        expect: () => [
          initialState.copyWith(
            initialLoadStatus: InitialLoadStatus.success,
          ),
        ],
        verify: (_) {
          verify(getCookies).called(1);
          verify(setCookies).called(1);
        },
      );
    });

    group(WebRedirectCreated, () {
      final inAppWebViewController = _MockInAppWebViewController();
      final initialize = () => actionModel.initialize(inAppWebViewController);

      blocTest<WebRedirectBloc, WebRedirectState>(
        'calls initialize',
        setUp: () {
          when(initialize).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            WebRedirectCreated(inAppWebViewController),
          );
        },
        verify: (_) {
          verify(initialize).called(1);
        },
      );
    });

    group(WebRedirectLoadStarted, () {
      blocTest<WebRedirectBloc, WebRedirectState>(
        'sets progress to 0',
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            WebRedirectLoadStarted(),
          );
        },
        expect: () => [
          initialState.copyWith(progress: 0),
        ],
      );
    });

    group(WebRedirectProgressChanged, () {
      const progress = 50;

      blocTest<WebRedirectBloc, WebRedirectState>(
        'emits progress',
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            WebRedirectProgressChanged(progress),
          );
        },
        expect: () => [
          initialState.copyWith(
            progress: progress,
          ),
        ],
      );
    });

    group(WebRedirectLoadStopped, () {
      final baseUrl = Uri.parse('baseUrl');
      final state = AuthenticationState(baseUrl: baseUrl);

      final cookies = [
        Cookie('name', 'value'),
      ];

      final getCookies = () => cookieManager.cookies(baseUrl);
      final saveCookies = () => repository.saveCookies(cookies);

      const canGoBack = true;
      const canGoForward = true;

      final canGoBackFuture = () => actionModel.canGoBack();
      final canGoForwardFuture = () => actionModel.canGoForward();

      blocTest<WebRedirectBloc, WebRedirectState>(
        'saves cookies and emits canGoBack and canGoForward',
        setUp: () {
          when(() => repository.state).thenReturn(state);
          when(getCookies).thenAnswer((_) async => cookies);
          when(saveCookies).thenAnswer((_) async {});
          when(canGoBackFuture).thenAnswer((_) async => canGoBack);
          when(canGoForwardFuture).thenAnswer((_) async => canGoForward);
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            WebRedirectLoadStopped(),
          );
        },
        expect: () => [
          initialState.copyWith(
            canGoBack: canGoBack,
            canGoForward: canGoForward,
          ),
        ],
        verify: (_) {
          verify(getCookies).called(1);
          verify(saveCookies).called(1);
          verify(canGoBackFuture).called(1);
          verify(canGoForwardFuture).called(1);
        },
      );
    });

    group(WebRedirectBackPressed, () {
      final goBack = () => actionModel.goBack();

      blocTest<WebRedirectBloc, WebRedirectState>(
        'calls goBack',
        setUp: () {
          when(goBack).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            WebRedirectBackPressed(),
          );
        },
        verify: (_) {
          verify(goBack).called(1);
        },
      );
    });

    group(WebRedirectForwardPressed, () {
      final goForward = () => actionModel.goForward();

      blocTest<WebRedirectBloc, WebRedirectState>(
        'calls goForward',
        setUp: () {
          when(goForward).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            WebRedirectForwardPressed(),
          );
        },
        verify: (_) {
          verify(goForward).called(1);
        },
      );
    });

    group(WebRedirectReloadPressed, () {
      final reload = () => actionModel.reload();

      blocTest<WebRedirectBloc, WebRedirectState>(
        'calls reload',
        setUp: () {
          when(reload).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            WebRedirectReloadPressed(),
          );
        },
        verify: (_) {
          verify(reload).called(1);
        },
      );
    });
  });
}
