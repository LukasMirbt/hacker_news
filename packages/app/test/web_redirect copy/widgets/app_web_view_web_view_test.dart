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

class _MockAppWebViewModel extends Mock implements AppWebViewModel {}

class _MockInAppWebViewInitialData extends Mock
    implements InAppWebViewInitialData {}

class _MockURLRequest extends Mock implements URLRequest {}

class _MockInAppWebViewController extends Mock
    implements InAppWebViewController {}

class _MockWebResourceRequest extends Mock implements WebResourceRequest {}

class _MockWebResourceError extends Mock implements WebResourceError {}

class _MockWebResourceResponse extends Mock implements WebResourceResponse {}

class _MockLogger extends Mock implements Logger {}

void main() {
  group(AppWebViewWebView, () {
    late AppWebViewBloc bloc;
    late AppWebViewState state;
    late AppWebViewModel redirect;
    late InAppWebViewInitialData initialData;
    late URLRequest initialUrlRequest;
    late InAppWebViewController controller;
    late WebResourceRequest request;
    late WebResourceError error;
    late WebResourceResponse response;
    late Logger logger;
    late MockInAppWebViewPlatform platform;

    setUp(() {
      bloc = _MockAppWebViewBloc();
      state = _MockAppWebViewState();
      redirect = _MockAppWebViewModel();
      initialData = _MockInAppWebViewInitialData();
      initialUrlRequest = _MockURLRequest();
      controller = _MockInAppWebViewController();
      request = _MockWebResourceRequest();
      error = _MockWebResourceError();
      response = _MockWebResourceResponse();
      logger = _MockLogger();
      when(() => bloc.state).thenReturn(state);
      when(() => state.redirect).thenReturn(redirect);
      when(() => redirect.initialData).thenReturn(initialData);
      when(() => redirect.initialUrlRequest).thenReturn(initialUrlRequest);
      platform = MockInAppWebViewPlatform();
      InAppWebViewPlatform.instance = platform;
    });

    Widget buildSubject() {
      return Provider.value(
        value: logger,
        child: BlocProvider.value(
          value: bloc,
          child: AppWebViewWebView(),
        ),
      );
    }

    final uri = WebUri.uri(
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

      testWidgets('adds $AppWebViewCreated '
          'onWebViewCreated', (tester) async {
        await tester.pumpApp(buildSubject());
        final onWebViewCreated = platform.params.onWebViewCreated;
        onWebViewCreated?.call(controller);
        verify(
          () => bloc.add(
            AppWebViewCreated(controller),
          ),
        ).called(1);
      });

      testWidgets('adds $AppWebViewLoadStarted '
          'onLoadStart', (tester) async {
        await tester.pumpApp(buildSubject());
        final onLoadStart = platform.params.onLoadStart;
        onLoadStart?.call(controller, uri);
        verify(
          () => bloc.add(
            AppWebViewLoadStarted(),
          ),
        ).called(1);
      });

      testWidgets('adds $AppWebViewVisitedHistoryUpdated '
          'onUpdateVisitedHistory', (tester) async {
        await tester.pumpApp(buildSubject());
        final onUpdateVisitedHistory = platform.params.onUpdateVisitedHistory;
        onUpdateVisitedHistory?.call(controller, uri, false);
        verify(
          () => bloc.add(
            AppWebViewVisitedHistoryUpdated(),
          ),
        ).called(1);
      });

      testWidgets('adds $AppWebViewProgressChanged '
          'onProgressChanged', (tester) async {
        await tester.pumpApp(buildSubject());
        final onProgressChanged = platform.params.onProgressChanged;
        onProgressChanged?.call(controller, 50);
        verify(
          () => bloc.add(
            AppWebViewProgressChanged(50),
          ),
        ).called(1);
      });

      testWidgets('adds $AppWebViewLoadStopped onLoadStop', (tester) async {
        await tester.pumpApp(buildSubject());
        final onLoadStop = platform.params.onLoadStop;
        onLoadStop?.call(controller, uri);
        verify(
          () => bloc.add(
            AppWebViewLoadStopped(uri.uriValue),
          ),
        ).called(1);
      });

      testWidgets('adds $AppWebViewReceivedError '
          'onReceivedError', (tester) async {
        await tester.pumpApp(buildSubject());
        final onReceivedError = platform.params.onReceivedError;
        onReceivedError?.call(controller, request, error);
        verify(
          () => bloc.add(
            AppWebViewReceivedError(),
          ),
        ).called(1);
      });

      testWidgets('calls logger.severe onReceivedError', (tester) async {
        await tester.pumpApp(buildSubject());
        final onReceivedError = platform.params.onReceivedError;
        onReceivedError?.call(controller, request, error);
        verify(
          () => logger.severe('Error', error, any()),
        ).called(1);
      });

      testWidgets('calls logger.severe onReceivedHttpError', (tester) async {
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
}
