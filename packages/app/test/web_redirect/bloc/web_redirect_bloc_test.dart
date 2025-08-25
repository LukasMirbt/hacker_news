// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app/web_redirect/web_redirect.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart' hide Cookie;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockWebRedirectCookieManager extends Mock
    implements WebRedirectCookieManager {}

class _MockWebRedirectController extends Mock
    implements WebRedirectController {}

class _MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

class _MockInAppWebViewController extends Mock
    implements InAppWebViewController {}

void main() {
  final redirect = WebRedirectPlaceholder();
  final initialState = WebRedirectState.from(redirect);

  group(WebRedirectBloc, () {
    late WebRedirectCookieManager cookieManager;
    late WebRedirectController controller;
    late AuthenticationRepository repository;

    setUp(() {
      cookieManager = _MockWebRedirectCookieManager();
      controller = _MockWebRedirectController();
      repository = _MockAuthenticationRepository();
    });

    WebRedirectBloc buildBloc() {
      return WebRedirectBloc(
        redirect: redirect,
        webRedirectCookieManager: cookieManager,
        webRedirectController: controller,
        authenticationRepository: repository,
      );
    }

    TypeMatcher<WebRedirectState> matchState({
      InitialLoadStatus? initialLoadStatus,
      bool? canGoBack,
      bool? canGoForward,
      int? progress,
    }) {
      return isA<WebRedirectState>()
          .having(
            (state) => state.redirect,
            'redirect',
            isA<WebRedirectModel>(),
          )
          .having(
            (state) => state.initialLoadStatus,
            'initialLoadStatus',
            initialLoadStatus ?? initialState.initialLoadStatus,
          )
          .having(
            (state) => state.canGoBack,
            'canGoBack',
            canGoBack ?? initialState.canGoBack,
          )
          .having(
            (state) => state.canGoForward,
            'canGoForward',
            canGoForward ?? initialState.canGoForward,
          )
          .having(
            (state) => state.progress,
            'progress',
            progress ?? initialState.progress,
          );
    }

    test('initial state is $WebRedirectState', () {
      expect(buildBloc().state, matchState());
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

      blocTest(
        'sets cookies and emits [success]',
        setUp: () {
          when(getCookies).thenAnswer((_) async => cookies);
          when(setCookies).thenAnswer((_) async {
            return;
          });
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            WebRedirectStarted(),
          );
        },
        expect: () => [
          matchState(
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
      final initialize = () => controller.initialize(inAppWebViewController);

      blocTest(
        'calls initialize',
        setUp: () {
          when(initialize).thenAnswer((_) async {
            return;
          });
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
      blocTest(
        'sets progress to 0',
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            WebRedirectLoadStarted(),
          );
        },
        expect: () => [
          matchState(progress: 0),
        ],
      );
    });

    group(WebRedirectVisitedHistoryUpdated, () {
      const canGoBack = true;
      const canGoForward = true;

      final canGoBackMethod = () => controller.canGoBack();
      final canGoForwardMethod = () => controller.canGoForward();

      blocTest(
        'emits canGoBack and canGoForward',
        setUp: () {
          when(canGoBackMethod).thenAnswer((_) async => canGoBack);
          when(canGoForwardMethod).thenAnswer((_) async => canGoForward);
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            WebRedirectVisitedHistoryUpdated(),
          );
        },
        expect: () => [
          matchState(
            canGoBack: canGoBack,
            canGoForward: canGoForward,
          ),
        ],
        verify: (_) {
          verify(canGoBackMethod).called(1);
          verify(canGoForwardMethod).called(1);
        },
      );
    });

    group(WebRedirectProgressChanged, () {
      const progress = 50;

      blocTest(
        'emits progress',
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            WebRedirectProgressChanged(progress),
          );
        },
        expect: () => [
          matchState(
            progress: progress,
          ),
        ],
      );
    });

    group(WebRedirectLoadStopped, () {
      final baseUrl = Uri.parse('baseUrl');
      final state = AuthenticationState.initial(baseUrl: baseUrl);

      final cookies = [
        Cookie('name', 'value'),
      ];

      const html = 'html';

      final getCookies = () => cookieManager.cookies(baseUrl);
      final saveCookies = () => repository.saveCookies(cookies);
      final getHtml = () => controller.html();

      final updateAuthenticationFromHtml = () =>
          repository.updateAuthenticationFromHtml(html);

      const canGoBack = true;
      const canGoForward = true;

      final canGoBackMethod = () => controller.canGoBack();
      final canGoForwardMethod = () => controller.canGoForward();

      blocTest(
        'calls saveCookies, updateAuthenticationFromHtml '
        'and emits canGoBack and canGoForward',
        setUp: () {
          when(() => repository.state).thenReturn(state);
          when(getCookies).thenAnswer((_) async => cookies);
          when(saveCookies).thenAnswer((_) async {
            return;
          });
          when(getHtml).thenAnswer((_) async => html);
          when(canGoBackMethod).thenAnswer((_) async => canGoBack);
          when(canGoForwardMethod).thenAnswer((_) async => canGoForward);
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            WebRedirectLoadStopped(),
          );
        },
        expect: () => [
          matchState(
            canGoBack: canGoBack,
            canGoForward: canGoForward,
          ),
        ],
        verify: (_) {
          verify(getCookies).called(1);
          verify(saveCookies).called(1);
          verify(getHtml).called(1);
          verify(updateAuthenticationFromHtml).called(1);
          verify(canGoBackMethod).called(1);
          verify(canGoForwardMethod).called(1);
        },
      );
    });

    group(WebRedirectBackPressed, () {
      final goBack = () => controller.goBack();

      blocTest(
        'calls goBack',
        setUp: () {
          when(goBack).thenAnswer((_) async {
            return;
          });
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
      final goForward = () => controller.goForward();

      blocTest(
        'calls goForward',
        setUp: () {
          when(goForward).thenAnswer((_) async {
            return;
          });
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
      final reload = () => controller.reload();

      blocTest(
        'calls reload',
        setUp: () {
          when(reload).thenAnswer((_) async {
            return;
          });
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
