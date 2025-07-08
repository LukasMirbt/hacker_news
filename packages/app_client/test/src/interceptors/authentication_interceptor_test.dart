// ignore_for_file: prefer_function_declarations_over_variables
// ignore_for_file: cascade_invocations

import 'package:app_client/app_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockAuthenticationService extends Mock
    implements AuthenticationService {}

class _MockResponse extends Mock implements Response<dynamic> {}

class _MockResponseInterceptorHandler extends Mock
    implements ResponseInterceptorHandler {}

void main() {
  group(AuthenticationInterceptor, () {
    late AuthenticationService service;
    late Response<dynamic> response;
    late ResponseInterceptorHandler handler;

    setUp(() {
      service = _MockAuthenticationService();
      response = _MockResponse();
      handler = _MockResponseInterceptorHandler();
    });

    AuthenticationInterceptor createSubject() {
      return AuthenticationInterceptor(
        authenticationService: service,
      );
    }

    group('onResponse', () {
      const html = 'html';
      final update = () => service.update(html);
      final next = () => handler.next(response);

      test('calls next when data is not a string', () {
        when(() => response.data).thenReturn(1);
        final interceptor = createSubject();
        interceptor.onResponse(response, handler);
        verify(next).called(1);
        verifyNever(update);
      });

      test('calls update and next when data is a string', () {
        when(() => response.data).thenReturn(html);
        final interceptor = createSubject();
        interceptor.onResponse(response, handler);
        verify(update).called(1);
        verify(next).called(1);
      });
    });
  });
}
