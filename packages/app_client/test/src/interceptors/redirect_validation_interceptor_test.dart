// ignore_for_file: prefer_function_declarations_over_variables
// ignore_for_file: cascade_invocations

import 'package:app_client/app_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockAppClient extends Mock implements AppClient {}

class _MockRedirectValidationService extends Mock
    implements RedirectValidationService {}

class _MockRequestInterceptorHandler extends Mock
    implements RequestInterceptorHandler {}

class _MockResponse extends Mock implements Response<dynamic> {}

class _MockResponseInterceptorHandler extends Mock
    implements ResponseInterceptorHandler {}

class _MockRequestOptions extends Mock implements RequestOptions {}

void main() {
  group(RedirectValidationInterceptor, () {
    late AppClient client;
    late RedirectValidationService service;

    setUp(() {
      client = _MockAppClient();
      service = _MockRedirectValidationService();
    });

    RedirectValidationInterceptor createSubject() {
      return RedirectValidationInterceptor(
        appClient: client,
        redirectValidationService: service,
      );
    }

    group('onRequest', () {
      late RequestInterceptorHandler handler;
      late RequestOptions options;

      setUp(() {
        handler = _MockRequestInterceptorHandler();
        options = RequestOptions();
      });

      final shouldValidate = () => service.shouldValidate(options);
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
      });

      final url = Uri.parse('https://example.com');
      final unexpectedRedirectException = UnexpectedRedirectException(url);
      const validationException = ValidationException();

      final shouldValidate = () => service.shouldValidate(requestOptions);
      final validateRedirect = () => service.validateRedirect(response);
      final redirectToWeb = () => client.redirectToWeb(url);

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

      test('calls redirectToWeb and reject when shouldValidate '
          'and validateRedirect throws $UnexpectedRedirectException', () async {
        when(shouldValidate).thenReturn(true);
        when(validateRedirect).thenThrow(unexpectedRedirectException);
        when(redirectToWeb).thenAnswer((_) async {});
        final interceptor = createSubject();
        await interceptor.onResponse(response, handler);
        verify(shouldValidate).called(1);
        verify(validateRedirect).called(1);
        verify(redirectToWeb).called(1);
        verify(reject).called(1);
      });

      test('calls reject when shouldValidate '
          'and validateRedirect throws $ValidationException', () {
        when(shouldValidate).thenReturn(true);
        when(validateRedirect).thenThrow(validationException);
        final interceptor = createSubject();
        interceptor.onResponse(response, handler);
        verify(shouldValidate).called(1);
        verify(validateRedirect).called(1);
        verifyNever(redirectToWeb);
        verify(reject).called(1);
      });
    });
  });
}
