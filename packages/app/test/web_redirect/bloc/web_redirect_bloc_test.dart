// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app/web_redirect/web_redirect.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart' hide Cookie;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockWebRedirectController extends Mock
    implements WebRedirectController {}

class _MockWebRedirectAuthenticationModel extends Mock
    implements WebRedirectAuthenticationModel {}

class _MockInAppWebViewController extends Mock
    implements InAppWebViewController {}

void main() {
  final redirect = WebRedirectPlaceholder();
  final initialState = WebRedirectState.from(redirect);

  group(WebRedirectBloc, () {
    late WebRedirectController controller;
    late _MockWebRedirectAuthenticationModel authenticationModel;

    setUp(() {
      controller = _MockWebRedirectController();
      authenticationModel = _MockWebRedirectAuthenticationModel();
    });

    WebRedirectBloc buildBloc() {
      return WebRedirectBloc(
        redirect: redirect,
        webRedirectController: controller,
        webRedirectAuthenticationModel: authenticationModel,
      );
    }

    TypeMatcher<WebRedirectState> matchState({
      InitialLoadStatus? initialLoadStatus,
      WebRedirectProgressModel? progress,
      bool? canGoBack,
      bool? canGoForward,
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
            (state) => state.progress,
            'progress',
            progress ?? initialState.progress,
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
      final syncCookiesToWebView = () =>
          authenticationModel.syncCookiesToWebView();

      blocTest(
        'calls syncCookiesToWebView and emits [success]',
        setUp: () {
          when(syncCookiesToWebView).thenAnswer((_) async {});
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
          verify(syncCookiesToWebView).called(1);
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
        'updates progress',
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            WebRedirectLoadStarted(),
          );
        },
        expect: () => [
          matchState(
            progress: WebRedirectProgressModel(
              status: PageLoading(),
            ),
          ),
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
            progress: WebRedirectProgressModel(
              status: PageLoading(progress),
            ),
          ),
        ],
      );
    });

    group(WebRedirectLoadStopped, () {
      final url = Uri.parse('https://www.example.com');

      final matchesAppHost = () => authenticationModel.matchesAppHost(url);
      final syncCookiesToApp = () => authenticationModel.syncCookiesToApp();

      final updateAuthenticationFromHtml = () =>
          authenticationModel.updateAuthenticationFromHtml();

      const canGoBack = true;
      const canGoForward = true;

      final canGoBackMethod = () => controller.canGoBack();
      final canGoForwardMethod = () => controller.canGoForward();

      blocTest(
        'calls syncCookiesToApp, updateAuthenticationFromHtml '
        'when url matches app host and emits updated state',
        setUp: () {
          when(matchesAppHost).thenReturn(true);
          when(syncCookiesToApp).thenAnswer((_) async {});
          when(updateAuthenticationFromHtml).thenAnswer((_) async {});
          when(canGoBackMethod).thenAnswer((_) async => canGoBack);
          when(canGoForwardMethod).thenAnswer((_) async => canGoForward);
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            WebRedirectLoadStopped(url),
          );
        },
        expect: () => [
          matchState(
            progress: WebRedirectProgressModel(
              status: PageSuccess(),
            ),
            canGoBack: canGoBack,
            canGoForward: canGoForward,
          ),
        ],
        verify: (_) {
          verify(matchesAppHost).called(1);
          verify(syncCookiesToApp).called(1);
          verify(updateAuthenticationFromHtml).called(1);
          verify(canGoBackMethod).called(1);
          verify(canGoForwardMethod).called(1);
        },
      );

      blocTest(
        'emits updated state when url does not match app host',
        setUp: () {
          when(matchesAppHost).thenReturn(false);
          when(canGoBackMethod).thenAnswer((_) async => canGoBack);
          when(canGoForwardMethod).thenAnswer((_) async => canGoForward);
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            WebRedirectLoadStopped(url),
          );
        },
        expect: () => [
          matchState(
            progress: WebRedirectProgressModel(
              status: PageSuccess(),
            ),
            canGoBack: canGoBack,
            canGoForward: canGoForward,
          ),
        ],
        verify: (_) {
          verify(matchesAppHost).called(1);
          verify(canGoBackMethod).called(1);
          verify(canGoForwardMethod).called(1);
          verifyNever(syncCookiesToApp);
          verifyNever(updateAuthenticationFromHtml);
        },
      );
    });

    group(WebRedirectReceivedError, () {
      blocTest(
        'emits updated progress',
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            WebRedirectReceivedError(),
          );
        },
        expect: () => [
          matchState(
            progress: WebRedirectProgressModel(
              status: PageFailure(),
            ),
          ),
        ],
      );
    });

    group(WebRedirectBackPressed, () {
      final goBack = () => controller.goBack();

      blocTest(
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
      final goForward = () => controller.goForward();

      blocTest(
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
      final reload = () => controller.reload();

      blocTest(
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
