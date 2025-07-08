// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'dart:typed_data';

import 'package:app_client/app_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mutex/mutex.dart';

class _MockMutex extends Mock implements Mutex {}

class _MockHttpClientAdapter extends Mock implements HttpClientAdapter {}

void main() {
  group(SequentialDio, () {
    late Mutex mutex;
    late HttpClientAdapter adapter;

    setUp(() {
      mutex = _MockMutex();
      adapter = _MockHttpClientAdapter();
      registerFallbackValue(RequestOptions());
      registerFallbackValue(Stream<Uint8List>.empty());
    });

    SequentialDio createSubject() {
      return SequentialDio(
        mutex: mutex,
        httpClientAdapter: adapter,
      );
    }

    group('fetch', () {
      final requestOptions = RequestOptions();
      const data = "{'key': 'value'}";
      const statusCode = 200;
      final responseBody = ResponseBody.fromString(data, statusCode);

      final protect = () => mutex.protect<Response<dynamic>>(any());
      final fetch = () => adapter.fetch(requestOptions, any(), any());

      test('calls protect, fetch and returns response', () async {
        when(protect).thenAnswer((invocation) async {
          final callback =
              invocation.positionalArguments.first
                  as Future<Response<dynamic>> Function();
          return callback();
        });
        when(fetch).thenAnswer(
          (_) async => responseBody,
        );
        final dio = createSubject();
        await expectLater(
          dio.fetch<dynamic>(requestOptions),
          completion(
            isA<Response<dynamic>>()
                .having(
                  (response) => response.data,
                  'data',
                  data,
                )
                .having(
                  (response) => response.statusCode,
                  'statusCode',
                  statusCode,
                ),
          ),
        );
        verify(protect).called(1);
        verify(fetch).called(1);
      });
    });
  });
}
