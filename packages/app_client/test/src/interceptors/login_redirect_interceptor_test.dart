// ignore_for_file: prefer_function_declarations_over_variables
// ignore_for_file: cascade_invocations

import 'dart:async';

import 'package:app_client/app_client.dart';
import 'package:authentication_parser/authentication_parser.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockIsLoginPageParser extends Mock implements IsLoginPageParser {}

class _MockResponseInterceptorHandler extends Mock
    implements ResponseInterceptorHandler {}

class _MockResponse extends Mock implements Response<dynamic> {}

void main() {
  group(LoginRedirectInterceptor, () {
    late IsLoginPageParser parser;

    setUp(() {
      parser = _MockIsLoginPageParser();
    });

    LoginRedirectInterceptor createSubject() {
      return LoginRedirectInterceptor(
        isLoginPageParser: parser,
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
      final parse = () => parser.parse(html);
      final next = () => handler.next(response);

      test('calls next and returns when data is not a string', () {
        when(() => response.data).thenReturn(1);
        final interceptor = createSubject();
        interceptor.onResponse(response, handler);
        verify(next).called(1);
      });

      test('calls parse, next and emits $LoginRedirect '
          'when data is a string and isLoginPage', () {
        when(() => response.data).thenReturn(html);
        when(parse).thenReturn(true);
        final interceptor = createSubject();
        expect(
          interceptor.redirect,
          emits(
            isA<LoginRedirect>(),
          ),
        );
        interceptor.onResponse(response, handler);
        verify(parse).called(1);
        verify(next).called(1);
      });

      test('calls next when data is a string '
          'and !isLoginPage', () async {
        when(() => response.data).thenReturn(html);
        when(parse).thenReturn(false);

        final controller = StreamController<LoginRedirect>();
        final interceptor = createSubject();
        interceptor.redirect.listen(controller.add);

        expect(controller.stream, neverEmits(anything));
        interceptor.onResponse(response, handler);
        await Future<void>.delayed(Duration.zero);

        verify(parse).called(1);
        verify(next).called(1);

        await controller.close();
      });
    });
  });
}
