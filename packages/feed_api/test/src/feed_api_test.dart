// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app_client/app_client.dart';
import 'package:feed_api/feed_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockAppClient extends Mock implements AppClient {}

class _MockFeedParser extends Mock implements FeedParser {}

class _MockDio extends Mock implements Dio {}

void main() {
  group(FeedApi, () {
    late AppClient client;
    late FeedParser parser;
    late Dio http;

    setUp(() {
      client = _MockAppClient();
      parser = _MockFeedParser();
      http = _MockDio();
      when(() => client.http).thenReturn(http);
    });

    FeedApi createSubject() {
      return FeedApi(
        appClient: client,
        feedParser: parser,
      );
    }

    group('fetchFeedPage', () {
      const pageUrl = InitialPageUrl(FeedType.top);
      const html = 'html';
      const page = FeedPageDataPlaceholder();
      final request = () => http.get<String>(pageUrl.url);
      final parse = () => parser.parse(html);

      test('returns $FeedPageData', () async {
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
