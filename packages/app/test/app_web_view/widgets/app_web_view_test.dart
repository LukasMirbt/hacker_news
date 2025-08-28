// ignore_for_file: prefer_const_constructors

import 'package:app/app_web_view/app_web_view.dart';
import 'package:app_logging/app_logging.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';
import '../mock_in_app_web_view_platform.dart';

class _MockAppWebViewBloc extends MockBloc<AppWebViewEvent, AppWebViewState>
    implements AppWebViewBloc {}

class _MockAppWebViewState extends Mock implements AppWebViewState {}

class _MockAppWebViewConfiguration extends Mock
    implements AppWebViewConfiguration {}

class _MockInAppWebViewInitialData extends Mock
    implements InAppWebViewInitialData {}

class _MockURLRequest extends Mock implements URLRequest {}

class _MockInAppWebViewController extends Mock
    implements InAppWebViewController {}

class _MockNavigationAction extends Mock implements NavigationAction {}

class _MockWebResourceRequest extends Mock implements WebResourceRequest {}

class _MockWebResourceError extends Mock implements WebResourceError {}

class _MockWebResourceResponse extends Mock implements WebResourceResponse {}

class _MockLogger extends Mock implements Logger {}

void main() {
  group(AppWebView, () {
    late AppWebViewBloc bloc;
    late AppWebViewState state;
    late AppWebViewConfiguration configuration;
    late InAppWebViewInitialData initialData;
    late URLRequest initialUrlRequest;
    late InAppWebViewController controller;
    late NavigationAction navigationAction;
    late WebResourceRequest request;
    late WebResourceError error;
    late WebResourceResponse response;
    late Logger logger;
    late MockInAppWebViewPlatform platform;

    setUp(() {
      bloc = _MockAppWebViewBloc();
      state = _MockAppWebViewState();
      configuration = _MockAppWebViewConfiguration();
      initialData = _MockInAppWebViewInitialData();
      initialUrlRequest = _MockURLRequest();
      controller = _MockInAppWebViewController();
      navigationAction = _MockNavigationAction();
      request = _MockWebResourceRequest();
      error = _MockWebResourceError();
      response = _MockWebResourceResponse();
      logger = _MockLogger();
      when(() => bloc.state).thenReturn(state);
      when(() => state.configuration).thenReturn(configuration);
      when(() => configuration.initialData).thenReturn(initialData);
      when(() => configuration.initialUrlRequest).thenReturn(initialUrlRequest);
      platform = MockInAppWebViewPlatform();
      InAppWebViewPlatform.instance = platform;
    });

    Widget buildSubject() {
      return Provider.value(
        value: logger,
        child: BlocProvider.value(
          value: bloc,
          child: AppWebView(),
        ),
      );
    }

    final url = WebUri.uri(
      Uri.parse('http://example.com'),
    );

    group(InAppWebView, () {
      testWidgets('has correct initialData', (tester) async {
        await tester.pumpApp(buildSubject());
        expect(platform.params.initialData, initialData);
      });

      testWidgets('has correct initialUrlRequest', (tester) async {
        await tester.pumpApp(buildSubject());
        expect(platform.params.initialUrlRequest, initialUrlRequest);
      });

      group('onWebViewCreated', () {
        testWidgets('adds $AppWebViewCreated', (tester) async {
          await tester.pumpApp(buildSubject());
          final onWebViewCreated = platform.params.onWebViewCreated;
          onWebViewCreated?.call(controller);
          verify(
            () => bloc.add(
              AppWebViewCreated(controller),
            ),
          ).called(1);
        });
      });

      group('shouldOverrideUrlLoading', () {
        testWidgets('returns ${NavigationActionPolicy.ALLOW} '
            'when onNavigationRequest is null', (tester) async {
          await tester.pumpApp(buildSubject());
          final shouldOverrideUrlLoading =
              platform.params.shouldOverrideUrlLoading;
          final result = shouldOverrideUrlLoading?.call(
            controller,
            navigationAction,
          );
          expect(result, NavigationActionPolicy.ALLOW);
        });

        testWidgets('returns ${NavigationActionPolicy.ALLOW} '
            'when onNavigationRequest is non-null '
            'request.url is null', (tester) async {
          when(() => state.onNavigationRequest).thenReturn(
            (_) => NavigationDecision.navigate,
          );
          when(() => navigationAction.request).thenReturn(
            _MockURLRequest(),
          );
          await tester.pumpApp(buildSubject());
          final shouldOverrideUrlLoading =
              platform.params.shouldOverrideUrlLoading;
          final result = shouldOverrideUrlLoading?.call(
            controller,
            navigationAction,
          );
          expect(result, NavigationActionPolicy.ALLOW);
        });

        testWidgets('returns ${NavigationActionPolicy.CANCEL} '
            'when onNavigationRequest is non-null '
            'and request.url is non-null and onNavigationRequest '
            'returns ${NavigationDecision.prevent}', (tester) async {
          const decision = NavigationDecision.prevent;
          final request = _MockURLRequest();
          final url = WebUri.uri(
            Uri.parse('http://example.com'),
          );
          when(() => state.onNavigationRequest).thenReturn(
            (_) => decision,
          );
          when(() => navigationAction.request).thenReturn(request);
          when(() => request.url).thenReturn(url);
          await tester.pumpApp(buildSubject());
          final shouldOverrideUrlLoading =
              platform.params.shouldOverrideUrlLoading;
          final result = shouldOverrideUrlLoading?.call(
            controller,
            navigationAction,
          );
          expect(result, NavigationActionPolicy.CANCEL);
        });

        testWidgets('returns ${NavigationActionPolicy.ALLOW} '
            'when onNavigationRequest is non-null '
            'and request.url is non-null and onNavigationRequest '
            'returns ${NavigationDecision.navigate}', (tester) async {
          const decision = NavigationDecision.navigate;
          final request = _MockURLRequest();
          final url = WebUri.uri(
            Uri.parse('http://example.com'),
          );
          when(() => state.onNavigationRequest).thenReturn(
            (_) => decision,
          );
          when(() => navigationAction.request).thenReturn(request);
          when(() => request.url).thenReturn(url);
          await tester.pumpApp(buildSubject());
          final shouldOverrideUrlLoading =
              platform.params.shouldOverrideUrlLoading;
          final result = shouldOverrideUrlLoading?.call(
            controller,
            navigationAction,
          );
          expect(result, NavigationActionPolicy.ALLOW);
        });
      });

      group('onLoadStart', () {
        testWidgets('adds $AppWebViewLoadStarted', (tester) async {
          await tester.pumpApp(buildSubject());
          final onLoadStart = platform.params.onLoadStart;
          onLoadStart?.call(controller, url);
          verify(
            () => bloc.add(
              AppWebViewLoadStarted(url),
            ),
          ).called(1);
        });
      });

      group('onUpdateVisitedHistory', () {
        testWidgets('adds $AppWebViewVisitedHistoryUpdated', (tester) async {
          await tester.pumpApp(buildSubject());
          final onUpdateVisitedHistory = platform.params.onUpdateVisitedHistory;
          onUpdateVisitedHistory?.call(controller, url, false);
          verify(
            () => bloc.add(
              AppWebViewVisitedHistoryUpdated(url),
            ),
          ).called(1);
        });
      });

      group('onProgressChanged', () {
        testWidgets('adds $AppWebViewProgressChanged', (tester) async {
          await tester.pumpApp(buildSubject());
          final onProgressChanged = platform.params.onProgressChanged;
          onProgressChanged?.call(controller, 50);
          verify(
            () => bloc.add(
              AppWebViewProgressChanged(50),
            ),
          ).called(1);
        });
      });

      group('onLoadStop', () {
        testWidgets('adds $AppWebViewLoadStopped', (tester) async {
          await tester.pumpApp(buildSubject());
          final onLoadStop = platform.params.onLoadStop;
          onLoadStop?.call(controller, url);
          verify(
            () => bloc.add(
              AppWebViewLoadStopped(url),
            ),
          ).called(1);
        });
      });

      group('onReceivedError', () {
        testWidgets('adds $AppWebViewReceivedError', (tester) async {
          when(() => request.url).thenReturn(url);
          await tester.pumpApp(buildSubject());
          final onReceivedError = platform.params.onReceivedError;
          onReceivedError?.call(controller, request, error);
          verify(
            () => bloc.add(
              AppWebViewReceivedError(url),
            ),
          ).called(1);
        });

        testWidgets('calls logger.severe', (tester) async {
          when(() => request.url).thenReturn(url);
          await tester.pumpApp(buildSubject());
          final onReceivedError = platform.params.onReceivedError;
          onReceivedError?.call(controller, request, error);
          verify(
            () => logger.severe('Error', error, any()),
          ).called(1);
        });
      });

      group('onReceivedHttpError', () {
        testWidgets('calls logger.severe', (tester) async {
          const statusCode = 404;
          when(() => response.statusCode).thenReturn(statusCode);
          await tester.pumpApp(buildSubject());
          final onReceivedHttpError = platform.params.onReceivedHttpError;
          onReceivedHttpError?.call(controller, request, response);
          verify(
            () => logger.severe('Http error', statusCode, any()),
          ).called(1);
        });
      });
    });
  });
}
