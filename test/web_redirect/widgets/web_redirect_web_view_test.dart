// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/web_redirect/web_redirect.dart';
import 'package:logging/logging.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';
import '../mock_in_app_web_view_platform.dart';

class _MockWebRedirectBloc extends MockBloc<WebRedirectEvent, WebRedirectState>
    implements WebRedirectBloc {}

class _MockWebRedirectState extends Mock implements WebRedirectState {}

class _MockWebRedirectModel extends Mock implements WebRedirectModel {}

class _MockURLRequest extends Mock implements URLRequest {}

class _MockInAppWebViewController extends Mock
    implements InAppWebViewController {}

class _MockWebResourceRequest extends Mock implements WebResourceRequest {}

class _MockLogger extends Mock implements Logger {}

void main() {
  group(WebRedirectWebView, () {
    late WebRedirectBloc bloc;
    late WebRedirectState state;
    late WebRedirectModel redirect;
    late URLRequest initialUrlRequest;
    late InAppWebViewController controller;
    late Logger logger;
    late MockInAppWebViewPlatform platform;

    setUp(() {
      bloc = _MockWebRedirectBloc();
      state = _MockWebRedirectState();
      redirect = _MockWebRedirectModel();
      initialUrlRequest = _MockURLRequest();
      controller = _MockInAppWebViewController();
      logger = _MockLogger();
      when(() => bloc.state).thenReturn(state);
      when(() => state.redirect).thenReturn(redirect);
      when(() => redirect.initialUrlRequest).thenReturn(initialUrlRequest);
      platform = MockInAppWebViewPlatform();
      InAppWebViewPlatform.instance = platform;
    });

    Widget buildSubject() {
      return Provider.value(
        value: logger,
        child: BlocProvider.value(
          value: bloc,
          child: WebRedirectWebView(),
        ),
      );
    }

    final uri = WebUri.uri(
      Uri.parse('http://example.com'),
    );

    group(InAppWebView, () {
      testWidgets('has correct initialUrlRequest', (tester) async {
        await tester.pumpApp(buildSubject());
        expect(platform.params.initialUrlRequest, initialUrlRequest);
      });

      testWidgets('adds $WebRedirectCreated onWebViewCreated', (
        tester,
      ) async {
        await tester.pumpApp(buildSubject());
        final onWebViewCreated = platform.params.onWebViewCreated;
        onWebViewCreated?.call(controller);
        verify(
          () => bloc.add(
            WebRedirectCreated(controller),
          ),
        ).called(1);
      });

      testWidgets('adds $WebRedirectLoadStarted onLoadStart', (
        tester,
      ) async {
        await tester.pumpApp(buildSubject());
        final onLoadStart = platform.params.onLoadStart;
        onLoadStart?.call(controller, uri);
        verify(
          () => bloc.add(
            WebRedirectLoadStarted(),
          ),
        ).called(1);
      });

      testWidgets('adds $WebRedirectProgressChanged onProgressChanged', (
        tester,
      ) async {
        await tester.pumpApp(buildSubject());
        final onProgressChanged = platform.params.onProgressChanged;
        onProgressChanged?.call(controller, 50);
        verify(
          () => bloc.add(
            WebRedirectProgressChanged(50),
          ),
        ).called(1);
      });

      testWidgets('adds $WebRedirectLoadStopped onLoadStop', (tester) async {
        await tester.pumpApp(buildSubject());
        final onLoadStop = platform.params.onLoadStop;
        onLoadStop?.call(controller, uri);
        verify(
          () => bloc.add(
            WebRedirectLoadStopped(),
          ),
        ).called(1);
      });

      testWidgets('calls logger.severe onReceivedError', (tester) async {
        final error = WebResourceError(
          description: 'description',
          type: WebResourceErrorType.BAD_URL,
        );
        await tester.pumpApp(buildSubject());

        final onReceivedError = platform.params.onReceivedError;

        onReceivedError?.call(
          _MockInAppWebViewController(),
          _MockWebResourceRequest(),
          error,
        );

        verify(
          () => logger.severe('Error', error, any()),
        ).called(1);
      });

      testWidgets('calls logger.severe onReceivedHttpError', (tester) async {
        final errorResponse = WebResourceResponse();
        await tester.pumpApp(buildSubject());

        final onReceivedHttpError = platform.params.onReceivedHttpError;

        onReceivedHttpError?.call(
          _MockInAppWebViewController(),
          _MockWebResourceRequest(),
          errorResponse,
        );

        verify(
          () => logger.severe('Http error', errorResponse, any()),
        ).called(1);
      });
    });
  });
}
