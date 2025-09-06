// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app/app_web_view/app_web_view.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart' hide Cookie;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:share_launcher/share_launcher.dart';

class _MockAppWebViewController extends Mock implements AppWebViewController {}

class _MockAppWebViewAuthenticationModel extends Mock
    implements AppWebViewAuthenticationModel {}

class _MockInAppWebViewController extends Mock
    implements InAppWebViewController {}

class _MockShareLauncher extends Mock implements ShareLauncher {}

void main() {
  final configuration = AppWebViewConfiguration(
    initialUrl: Uri.parse('https://www.example.com'),
  );

  final initialState = AppWebViewState.from(configuration);

  final url = Uri.parse('https://www.example.com/updated');

  group(AppWebViewBloc, () {
    late AppWebViewController controller;
    late AppWebViewAuthenticationModel authenticationModel;
    late ShareLauncher shareLauncher;

    setUp(() {
      controller = _MockAppWebViewController();
      authenticationModel = _MockAppWebViewAuthenticationModel();
      shareLauncher = _MockShareLauncher();
    });

    AppWebViewBloc buildBloc() {
      return AppWebViewBloc(
        configuration: configuration,
        appWebViewController: controller,
        appWebViewAuthenticationModel: authenticationModel,
        shareLauncher: shareLauncher,
      );
    }

    test('initial state is $AppWebViewState', () {
      expect(buildBloc().state, initialState);
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
          initialState.copyWith(
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

    group(AppWebViewNavigationPrevented, () {
      blocTest(
        'emits $PreventedNavigation',
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            AppWebViewNavigationPrevented(url),
          );
        },
        expect: () => [
          isA<AppWebViewState>().having(
            (state) => state.preventedNavigation,
            'preventedNavigation',
            isA<PreventedNavigation>().having(
              (navigation) => navigation.url,
              'url',
              url,
            ),
          ),
        ],
      );
    });

    group(AppWebViewLoadStarted, () {
      blocTest(
        'updates progress',
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            AppWebViewLoadStarted(url),
          );
        },
        expect: () => [
          initialState.copyWith(
            url: url,
            progress: AppWebViewProgressModel(
              status: PageLoading(),
            ),
          ),
        ],
      );
    });

    group(AppWebViewVisitedHistoryUpdated, () {
      const canGoBack = true;
      const canGoForward = true;

      final canGoBackMethod = () => controller.canGoBack();
      final canGoForwardMethod = () => controller.canGoForward();

      blocTest(
        'emits updated state',
        setUp: () {
          when(canGoBackMethod).thenAnswer((_) async => canGoBack);
          when(canGoForwardMethod).thenAnswer((_) async => canGoForward);
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            AppWebViewVisitedHistoryUpdated(url),
          );
        },
        expect: () => [
          initialState.copyWith(
            url: url,
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
          initialState.copyWith(
            progress: AppWebViewProgressModel(
              status: PageLoading(progress),
            ),
          ),
        ],
      );
    });

    group(AppWebViewLoadStopped, () {
      const canGoBack = true;
      const canGoForward = true;

      final canGoBackMethod = () => controller.canGoBack();
      final canGoForwardMethod = () => controller.canGoForward();

      final matchesAppHost = () => authenticationModel.matchesAppHost(url);
      final syncCookiesToApp = () => authenticationModel.syncCookiesToApp();

      final updateAuthenticationFromHtml = () =>
          authenticationModel.updateAuthenticationFromHtml();

      blocTest(
        'calls syncCookiesToApp, updateAuthenticationFromHtml '
        'when url matches app host and emits updated state',
        setUp: () {
          when(canGoBackMethod).thenAnswer((_) async => canGoBack);
          when(canGoForwardMethod).thenAnswer((_) async => canGoForward);
          when(matchesAppHost).thenReturn(true);
          when(syncCookiesToApp).thenAnswer((_) async {});
          when(updateAuthenticationFromHtml).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            AppWebViewLoadStopped(url),
          );
        },
        expect: () => [
          initialState.copyWith(
            url: url,
            canGoBack: canGoBack,
            canGoForward: canGoForward,
            progress: AppWebViewProgressModel(
              status: PageSuccess(),
            ),
          ),
        ],
        verify: (_) {
          verify(canGoBackMethod).called(1);
          verify(canGoForwardMethod).called(1);
          verify(matchesAppHost).called(1);
          verify(syncCookiesToApp).called(1);
          verify(updateAuthenticationFromHtml).called(1);
        },
      );

      blocTest(
        'emits updated state when url does not match app host',
        setUp: () {
          when(canGoBackMethod).thenAnswer((_) async => canGoBack);
          when(canGoForwardMethod).thenAnswer((_) async => canGoForward);
          when(matchesAppHost).thenReturn(false);
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            AppWebViewLoadStopped(url),
          );
        },
        expect: () => [
          initialState.copyWith(
            url: url,
            canGoBack: canGoBack,
            canGoForward: canGoForward,
            progress: AppWebViewProgressModel(
              status: PageSuccess(),
            ),
          ),
        ],
        verify: (_) {
          verify(canGoBackMethod).called(1);
          verify(canGoForwardMethod).called(1);
          verify(matchesAppHost).called(1);
          verifyNever(syncCookiesToApp);
          verifyNever(updateAuthenticationFromHtml);
        },
      );
    });

    group(AppWebViewReceivedError, () {
      const canGoBack = true;
      const canGoForward = true;

      final canGoBackMethod = () => controller.canGoBack();
      final canGoForwardMethod = () => controller.canGoForward();

      blocTest(
        'emits updated state',
        setUp: () {
          when(canGoBackMethod).thenAnswer((_) async => canGoBack);
          when(canGoForwardMethod).thenAnswer((_) async => canGoForward);
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            AppWebViewReceivedError(url),
          );
        },
        expect: () => [
          initialState.copyWith(
            url: url,
            canGoBack: canGoBack,
            canGoForward: canGoForward,
            progress: AppWebViewProgressModel(
              status: PageFailure(),
            ),
          ),
        ],
        verify: (bloc) {
          verify(canGoBackMethod).called(1);
          verify(canGoForwardMethod).called(1);
        },
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

    group(AppWebViewSharePressed, () {
      final url = Uri.parse('https://example.com');

      final share = () => shareLauncher.share(
        text: url.toString(),
      );

      blocTest(
        'calls share',
        setUp: () {
          when(share).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            AppWebViewSharePressed(url),
          );
        },
        verify: (_) {
          verify(share).called(1);
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
