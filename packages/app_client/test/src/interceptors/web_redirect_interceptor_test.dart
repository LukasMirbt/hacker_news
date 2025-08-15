// ignore_for_file: prefer_function_declarations_over_variables
// ignore_for_file: cascade_invocations

import 'dart:async';

import 'package:app_client/app_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockRedirectValidator extends Mock implements RedirectValidator {}

class _MockRequestInterceptorHandler extends Mock
    implements RequestInterceptorHandler {}

class _MockResponse extends Mock implements Response<dynamic> {}

class _MockResponseInterceptorHandler extends Mock
    implements ResponseInterceptorHandler {}

class _MockRequestOptions extends Mock implements RequestOptions {}

void main() {
  group(WebRedirectInterceptor, () {
    late RedirectValidator validator;

    setUp(() {
      validator = _MockRedirectValidator();
    });

    WebRedirectInterceptor createSubject() {
      return WebRedirectInterceptor(
        redirectValidator: validator,
      );
    }

    group('onRequest', () {
      late RequestInterceptorHandler handler;
      late RequestOptions options;

      setUp(() {
        handler = _MockRequestInterceptorHandler();
        options = RequestOptions();
      });

      final shouldValidate = () => validator.shouldValidate(options);
      final next = () => handler.next(options);

      test('sets followRedirects to false and calls next '
          'when shouldValidate', () {
        when(shouldValidate).thenReturn(true);
        final interceptor = createSubject();
        expect(options.followRedirects, true);
        interceptor.onRequest(options, handler);
        expect(options.followRedirects, false);
        verify(shouldValidate).called(1);
        verify(next).called(1);
      });

      test('does not set followRedirects to false and calls next '
          'when !shouldValidate', () {
        when(shouldValidate).thenReturn(false);
        final interceptor = createSubject();
        expect(options.followRedirects, true);
        interceptor.onRequest(options, handler);
        expect(options.followRedirects, true);
        verify(shouldValidate).called(1);
        verify(next).called(1);
      });
    });

    group('onResponse', () {
      late Response<dynamic> response;
      late ResponseInterceptorHandler handler;
      late RequestOptions requestOptions;

      setUp(() {
        response = _MockResponse();
        handler = _MockResponseInterceptorHandler();
        requestOptions = _MockRequestOptions();
        when(() => response.requestOptions).thenReturn(requestOptions);
        registerFallbackValue(
          DioException(requestOptions: requestOptions),
        );
        registerFallbackValue(WebRedirectPlaceholder());
      });

      final requestUrl = Uri.parse('https://example.com/request');
      const responseHtml = 'responseHtml';
      final redirectUrl = Uri.parse('https://example.com/redirect');

      final missingRedirectException = MissingRedirectException(
        requestUrl: requestUrl,
        responseHtml: responseHtml,
      );

      final unexpectedRedirectException = UnexpectedRedirectException(
        redirectUrl,
      );

      const validationException = ValidationException();

      final shouldValidate = () => validator.shouldValidate(requestOptions);
      final validateRedirect = () => validator.validateRedirect(response);

      final next = () => handler.next(response);
      final reject = () => handler.reject(any());

      test('calls next and returns when !shouldValidate', () {
        when(shouldValidate).thenReturn(false);
        final interceptor = createSubject();
        interceptor.onResponse(response, handler);
        verify(shouldValidate).called(1);
        verify(next).called(1);
      });

      test('calls next when shouldValidate '
          'and validateRedirect succeeds', () {
        when(shouldValidate).thenReturn(true);
        final interceptor = createSubject();
        interceptor.onResponse(response, handler);
        verify(shouldValidate).called(1);
        verify(validateRedirect).called(1);
        verify(next).called(1);
      });

      test('emits $WebRedirect and calls reject when shouldValidate '
          'and validateRedirect throws $MissingRedirectException', () async {
        when(shouldValidate).thenReturn(true);
        when(validateRedirect).thenThrow(missingRedirectException);
        final interceptor = createSubject();
        expect(
          interceptor.redirect,
          emits(
            isA<WebRedirect>()
                .having(
                  (redirect) => redirect.url,
                  'url',
                  requestUrl,
                )
                .having(
                  (redirect) => redirect.html,
                  'html',
                  responseHtml,
                ),
          ),
        );
        await interceptor.onResponse(response, handler);
        verify(shouldValidate).called(1);
        verify(validateRedirect).called(1);
        verify(reject).called(1);
      });

      test('emits $WebRedirect and calls reject when shouldValidate '
          'and validateRedirect throws $UnexpectedRedirectException', () async {
        when(shouldValidate).thenReturn(true);
        when(validateRedirect).thenThrow(unexpectedRedirectException);
        final interceptor = createSubject();
        expect(
          interceptor.redirect,
          emits(
            isA<WebRedirect>()
                .having(
                  (redirect) => redirect.url,
                  'url',
                  redirectUrl,
                )
                .having(
                  (redirect) => redirect.html,
                  'html',
                  null,
                ),
          ),
        );
        await interceptor.onResponse(response, handler);
        verify(shouldValidate).called(1);
        verify(validateRedirect).called(1);
        verify(reject).called(1);
      });

      test('calls reject when shouldValidate '
          'and validateRedirect throws $ValidationException', () async {
        when(shouldValidate).thenReturn(true);
        when(validateRedirect).thenThrow(validationException);

        final controller = StreamController<WebRedirect>();
        final interceptor = createSubject();
        interceptor.redirect.listen(controller.add);
        expect(controller.stream, neverEmits(anything));
        await interceptor.onResponse(response, handler);
        await Future<void>.delayed(Duration.zero);

        verify(shouldValidate).called(1);
        verify(validateRedirect).called(1);
        verify(reject).called(1);

        await controller.close();
      });
    });
  });
}
