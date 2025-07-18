// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app_client/app_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thread_api/thread_api.dart';

class _MockAppClient extends Mock implements AppClient {}

class _MockThreadParser extends Mock implements ThreadParser {}

class _MockDio extends Mock implements Dio {}

void main() {
  group(ThreadApi, () {
    late AppClient client;
    late ThreadParser parser;
    late Dio http;

    setUp(() {
      client = _MockAppClient();
      parser = _MockThreadParser();
      http = _MockDio();
      when(() => client.http).thenReturn(http);
    });

    ThreadApi createSubject() {
      return ThreadApi(
        appClient: client,
        threadParser: parser,
      );
    }

    group('fetchFeedPage', () {
      const pageUrl = InitialPageUrl(id: 'id');
      const html = 'html';
      const page = ThreadFeedPageDataPlaceholder();
      final request = () => http.get<String>(pageUrl.url);
      final parse = () => parser.parse(html);

      test('returns $ThreadFeedPageData', () async {
        when(request).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(),
            data: html,
          ),
        );
        when(parse).thenReturn(page);
        final api = createSubject();
        await expectLater(
          api.fetchFeedPage(pageUrl),
          completion(page),
        );
        verify(request).called(1);
      });
    });
  });
}
