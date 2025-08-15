// ignore_for_file: prefer_function_declarations_over_variables
// ignore_for_file: cascade_invocations

import 'dart:async';

import 'package:app_client/app_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockResponse extends Mock implements Response<dynamic> {}

class _MockResponseInterceptorHandler extends Mock
    implements ResponseInterceptorHandler {}

void main() {
  group(HtmlInterceptor, () {
    late Response<dynamic> response;
    late ResponseInterceptorHandler handler;

    setUp(() {
      response = _MockResponse();
      handler = _MockResponseInterceptorHandler();
    });

    HtmlInterceptor createSubject() => HtmlInterceptor();

    group('onResponse', () {
      const html = 'html';
      final next = () => handler.next(response);

      test('calls next when data is not a string', () async {
        when(() => response.data).thenReturn(1);

        final controller = StreamController<String>();
        final interceptor = createSubject();
        interceptor.stream.listen(controller.add);

        expect(controller.stream, neverEmits(anything));
        interceptor.onResponse(response, handler);
        await Future<void>.delayed(Duration.zero);

        verify(next).called(1);

        await controller.close();
      });

      test('emits data and calls next when data is a string', () {
        when(() => response.data).thenReturn(html);
        final interceptor = createSubject();
        expect(interceptor.stream, emits(html));
        interceptor.onResponse(response, handler);
        verify(next).called(1);
      });
    });
  });
}
