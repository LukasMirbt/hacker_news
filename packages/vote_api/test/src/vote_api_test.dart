// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app_client/app_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vote_api/vote_api.dart';

class _MockAppClient extends Mock implements AppClient {}

class _MockDio extends Mock implements Dio {}

void main() {
  group(VoteApi, () {
    late AppClient client;
    late Dio http;

    setUp(() {
      client = _MockAppClient();
      http = _MockDio();
      when(() => client.http).thenReturn(http);
      registerFallbackValue(RedirectValidationOptions());
    });

    VoteApi createSubject() {
      return VoteApi(appClient: client);
    }

    group('vote', () {
      final url = Uri.parse('https://example.com');

      final request = () => http.getUri<void>(
        url,
        options: any(
          named: 'options',
          that: isA<RedirectValidationOptions>(),
        ),
      );

      test('makes correct request', () async {
        when(request).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(),
          ),
        );
        final api = createSubject();
        await api.vote(url);
        verify(request).called(1);
      });
    });
  });
}
