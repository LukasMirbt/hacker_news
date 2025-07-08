// ignore_for_file: prefer_function_declarations_over_variables
// ignore_for_file: cascade_invocations

import 'package:app_client/app_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockRedirectService extends Mock implements RedirectService {}

class _MockResponseInterceptorHandler extends Mock
    implements ResponseInterceptorHandler {}

class _MockResponse extends Mock implements Response<dynamic> {}

void main() {
  group(RedirectInterceptor, () {
    late RedirectService service;

    setUp(() {
      service = _MockRedirectService();
    });

    RedirectInterceptor createSubject() {
      return RedirectInterceptor(
        redirectService: service,
      );
    }

    group('onResponse', () {
      late Response<dynamic> response;
      late ResponseInterceptorHandler handler;

      setUp(() {
        response = _MockResponse();
        handler = _MockResponseInterceptorHandler();
      });

      const html = 'html';

      final shouldRedirect = () => service.shouldRedirect(html);

      final redirectToLogin = () => service.redirectToLogin();

      final next = () => handler.next(response);

      test('calls next and returns when data is not a string', () {
        when(() => response.data).thenReturn(1);
        final interceptor = createSubject();
        interceptor.onResponse(response, handler);
        verify(next).called(1);
      });

      test('calls redirectToLogin and next when data is a string '
          'and shouldRedirect', () {
        when(() => response.data).thenReturn(html);
        when(shouldRedirect).thenReturn(true);
        final interceptor = createSubject();
        interceptor.onResponse(response, handler);
        verify(shouldRedirect).called(1);
        verify(redirectToLogin).called(1);
        verify(next).called(1);
      });

      test('calls next when data is a string '
          'and !shouldRedirect', () {
        when(() => response.data).thenReturn(html);
        when(shouldRedirect).thenReturn(false);
        final interceptor = createSubject();
        interceptor.onResponse(response, handler);
        verify(shouldRedirect).called(1);
        verify(next).called(1);
        verifyNever(redirectToLogin);
      });
    });
  });
}
