// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app/app_web_view/app_web_view.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart' hide Cookie;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockAppWebViewController extends Mock implements AppWebViewController {}

class _MockAppWebViewAuthenticationModel extends Mock
    implements AppWebViewAuthenticationModel {}

class _MockInAppWebViewController extends Mock
    implements InAppWebViewController {}

void main() {
  final configuration = AppWebViewConfiguration.from(
    initialUrl: Uri.parse('https://www.example.com'),
  );

  final initialState = AppWebViewState.from(
    configuration: configuration,
  );

  group(AppWebViewBloc, () {
    late AppWebViewController controller;
    late AppWebViewAuthenticationModel authenticationModel;

    setUp(() {
      controller = _MockAppWebViewController();
      authenticationModel = _MockAppWebViewAuthenticationModel();
    });

    AppWebViewBloc buildBloc() {
      return AppWebViewBloc(
        configuration: configuration,
        appWebViewController: controller,
        appWebViewAuthenticationModel: authenticationModel,
      );
    }

    TypeMatcher<AppWebViewState> matchState({
      InitialLoadStatus? initialLoadStatus,
      AppWebViewProgressModel? progress,
      bool? canGoBack,
      bool? canGoForward,
      Uri? url,
    }) {
      return isA<AppWebViewState>()
          .having(
            (state) => state.configuration,
            'configuration',
            isA<AppWebViewConfiguration>(),
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
            (state) => state.url,
            'url',
            url ?? initialState.url,
          );
    }

    test('initial state is $AppWebViewState', () {
      expect(buildBloc().state, matchState());
    });

    group(AppWebViewStarted, () {
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
            AppWebViewStarted(),
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

    group(AppWebViewCreated, () {
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
            AppWebViewCreated(inAppWebViewController),
          );
        },
        verify: (_) {
          verify(initialize).called(1);
        },
      );
    });

    group(AppWebViewLoadStarted, () {
      blocTest(
        'updates progress',
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            AppWebViewLoadStarted(),
          );
        },
        expect: () => [
          matchState(
            progress: AppWebViewProgressModel(
              status: PageLoading(),
            ),
          ),
        ],
      );
    });

    group(AppWebViewVisitedHistoryUpdated, () {
      final url = Uri.parse('https://www.example.com/updated');
      const canGoBack = true;
      const canGoForward = true;

      final getUrlMethod = () => controller.url();
      final canGoBackMethod = () => controller.canGoBack();
      final canGoForwardMethod = () => controller.canGoForward();

      blocTest(
        'emits canGoBack and canGoForward',
        setUp: () {
          when(getUrlMethod).thenAnswer((_) async => url);
          when(canGoBackMethod).thenAnswer((_) async => canGoBack);
          when(canGoForwardMethod).thenAnswer((_) async => canGoForward);
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            AppWebViewVisitedHistoryUpdated(),
          );
        },
        expect: () => [
          matchState(
            url: url,
            canGoBack: canGoBack,
            canGoForward: canGoForward,
          ),
        ],
        verify: (_) {
          verify(getUrlMethod).called(1);
          verify(canGoBackMethod).called(1);
          verify(canGoForwardMethod).called(1);
        },
      );
    });

    group(AppWebViewProgressChanged, () {
      const progress = 50;

      final successState = initialState.copyWith(
        progress: AppWebViewProgressModel(
          status: PageSuccess(),
        ),
      );

      final loadingState = initialState.copyWith(
        progress: AppWebViewProgressModel(
          status: PageLoading(),
        ),
      );

      blocTest(
        'returns when !status.isLoading',
        seed: () => successState,
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            AppWebViewProgressChanged(progress),
          );
        },
        expect: () => <AppWebViewState>[],
      );

      blocTest(
        'emits progress when status.isLoading',
        seed: () => loadingState,
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            AppWebViewProgressChanged(progress),
          );
        },
        expect: () => [
          matchState(
            progress: AppWebViewProgressModel(
              status: PageLoading(progress),
            ),
          ),
        ],
      );
    });

    group(AppWebViewLoadStopped, () {
      final url = Uri.parse('https://www.example.com/url');

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
            AppWebViewLoadStopped(url),
          );
        },
        expect: () => [
          matchState(
            progress: AppWebViewProgressModel(
              status: PageSuccess(),
            ),
            url: url,
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
            AppWebViewLoadStopped(url),
          );
        },
        expect: () => [
          matchState(
            progress: AppWebViewProgressModel(
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

    group(AppWebViewReceivedError, () {
      blocTest(
        'emits updated progress',
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            AppWebViewReceivedError(),
          );
        },
        expect: () => [
          matchState(
            progress: AppWebViewProgressModel(
              status: PageFailure(),
            ),
          ),
        ],
      );
    });

    group(AppWebViewBackPressed, () {
      final goBack = () => controller.goBack();

      blocTest(
        'calls goBack',
        setUp: () {
          when(goBack).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            AppWebViewBackPressed(),
          );
        },
        verify: (_) {
          verify(goBack).called(1);
        },
      );
    });

    group(AppWebViewForwardPressed, () {
      final goForward = () => controller.goForward();

      blocTest(
        'calls goForward',
        setUp: () {
          when(goForward).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            AppWebViewForwardPressed(),
          );
        },
        verify: (_) {
          verify(goForward).called(1);
        },
      );
    });

    group(AppWebViewReloadPressed, () {
      final reload = () => controller.reload();

      blocTest(
        'calls reload',
        setUp: () {
          when(reload).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            AppWebViewReloadPressed(),
          );
        },
        verify: (_) {
          verify(reload).called(1);
        },
      );
    });
  });
}
